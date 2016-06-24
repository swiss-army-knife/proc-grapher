#include "ProcInterface.h"

#include <algorithm>
#include <boost/algorithm/string.hpp>
#include <chrono>
#include <thread>

ProcInterface::ProcInterface()
{
	cpufile_path = boost::filesystem::path("/proc/stat");
	refresh_pids();
}

ProcInterface::~ProcInterface()
{

}

const int ProcInterface::PAGE_SIZE = sysconf(_SC_PAGESIZE) / 1024;

void ProcInterface::take_cpu_readings(long long int& total_cpu_time,long long int& utime,long long int& stime, boost::filesystem::path& statfile_path){
	total_cpu_time = 0;
	stime = 0;
	utime = 0;
	std::vector<std::string> cpuvector=get_file_lines(cpufile_path);
	std::string cpuline=cpuvector[0];
	std::vector<std::string> tokens;
	boost::split(tokens, cpuline, boost::is_any_of(" "));
	if(boost::starts_with(tokens[0],"cpu")){
		for (int i=2; i < tokens.size(); i++) {
			total_cpu_time+=boost::lexical_cast<long long int>(tokens[i]);
		}
	}
	std::vector<std::string> readings_stat=get_file_lines(statfile_path);
	std::vector<std::string> tokens_stat;
	boost::split(tokens_stat, readings_stat[0], boost::is_any_of(" "));
	utime = boost::lexical_cast<long long int>(tokens_stat[13]);
	stime = boost::lexical_cast<long long int>(tokens_stat[14]);
}

std::vector<std::string> ProcInterface:: get_file_lines(boost::filesystem::path p){
	
	std::ifstream inputfile;
	inputfile.open(p.string(),std::ios::in);
	std::string inputline;
	std::vector<std::string> temp_list_string;
	while(std::getline(inputfile,inputline)){
		temp_list_string.push_back(inputline);
	}
	return temp_list_string;
}
ProcInfo ProcInterface::fill_values(std::string pid)
{
	refresh_pids();
	ProcInfo info;
	if (std::find(pid_list.begin(),pid_list.end(),pid)!=pid_list.end())
	{
		try
		{
			boost::filesystem::path statfile_path = boost::filesystem::path("/proc");
			statfile_path /= boost::filesystem::path(pid);
			boost::filesystem::path procnamefile_path=statfile_path;
			statfile_path /= "stat";
			procnamefile_path /= "cmdline";
			
	
			// VM, RM, Threads
			std::vector<std::string> statvector=get_file_lines(statfile_path);
			for (int i=0; i < statvector.size(); i++) {
				std::string statline=statvector[i];
				std::vector<std::string> tokens;
				boost::split(tokens, statline, boost::is_any_of(" "));
				info.pid=boost::lexical_cast<long long int>(tokens[0]);
				info.num_threads=boost::lexical_cast<long long int>(tokens[19]);
				info.vsize=boost::lexical_cast<long long int>(tokens[22])/1024;
				info.rss=boost::lexical_cast<long long int>(tokens[23])*PAGE_SIZE;
			}
			
			// Proc name
			std::vector<std::string> filevector=get_file_lines(procnamefile_path);
			for (int i=0; i < filevector.size(); i++) {
				//std::string procfile=filevector[i];
				boost::filesystem::path procfile(filevector[i]);
				info.processname=procfile.filename().string();
			}
			
			// CPU utilization
			float user_util = 0.0f, sys_util = 0.0f;
			long long int  total_time_before, total_time_after, utime_before, utime_after, stime_before, stime_after;
			take_cpu_readings(total_time_before, utime_before, stime_before, statfile_path);
			
			std::this_thread::sleep_for(std::chrono::milliseconds(1000));
			
			take_cpu_readings(total_time_after, utime_after, stime_after, statfile_path);
			user_util = 100 * static_cast<float>(utime_after - utime_before) / (total_time_after - total_time_before);
			sys_util = 100 * static_cast<float>(stime_after - stime_before) / (total_time_after - total_time_before);
			info.cpu_utilization = user_util+sys_util;
		}
		catch (std::exception& ex)
		{
			// log error
		}
	}
	return info;
}
	
	

void ProcInterface::refresh_pids()
{
	pid_list.clear();
	boost::filesystem::path procdir("/proc");
	try
	{
		if(boost::filesystem::exists(procdir) && boost::filesystem::is_directory(procdir))
		{
			for (boost::filesystem::directory_entry& x : boost::filesystem::directory_iterator(procdir))
			{
				 pid_list.push_back(x.path().filename().string());
			}
		}
	}
	catch (std::exception& x)
	{
		// log error
	}
}

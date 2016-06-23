#include "ProcInterface.h"
#include "boost/filesystem.hpp"
#include <algorithm>

ProcInterface::ProcInterface()
{
	refresh_pids();
}

ProcInterface::~ProcInterface()
{

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

void ProcInterface::list_pid_memory_info(std::string pid)
{
	refresh_pids();
	if (std::find(pid_list.begin(),pid_list.end(),pid)!=pid_list.end())
	{
		try
		{
			boost::filesystem::path statfile_path = boost::filesystem::path("/proc");
			statfile_path /= boost::filesystem::path(pid);
			statfile_path /= "stat";
			std::ifstream statfile;
			std::string statline;
			statfile.open(statfile_path.string(),std::ios::in);
			while(std::getline(statfile,statline))
			{
				std::cout<<statline<<std::endl;
			}
		}
		catch (std::exception& ex)
		{
			// log error
		}
	}
}
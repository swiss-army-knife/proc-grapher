#include <iostream>
#include <stdio.h>
#include "gnuplot-iostream.h"
#include "boost/program_options.hpp"
#include "ProcInterface.h"
#include "PrintUtils.h"
#include <chrono>
#include <boost/tuple/tuple.hpp>

namespace po = boost::program_options; 

template<class T>
void print(std::vector<T> x){
	for(int i=0; i<x.size(); ++i)
		std::cout << x[i] << ' ';
	std::cout<<std::endl;
}

  
int main(int argc, char **argv)
{
	std::string pid = "";
	po::options_description desc("Usage");
	desc.add_options()("help", "Prints usage")("pid",po::value<int>(),"pid of process to be graphed");
	po::positional_options_description positional_desc;
	positional_desc.add("pid",-1);
	
	po::variables_map vm;
	po::store(po::command_line_parser(argc,argv).options(desc).positional(positional_desc).run(),vm);
	po::notify(vm);
	if (vm.count("help"))
	{
		std::cout << desc <<std::endl;
		return 0;
	}
	if (vm.count("pid"))
	{
	  pid = vm["pid"].as<int>();
	}
	else
	{
	  pid = "24984"; 
	}
	
	std::vector<double> cpu_utilization_data_x;
	std::vector<double> cpu_utilization_data_y;
	
	int ten_sec_counter = 0;
	
	auto start = std::chrono::system_clock::now();
	ProcInterface p;
	ProcInfo procInfo;
	while(true)
	{
		procInfo = p.fill_values(pid);
		PrintUtils::ConsolePrintContinuous(procInfo);
		cpu_utilization_data_x.push_back(std::chrono::duration_cast<std::chrono::seconds>(std::chrono::system_clock::now() - start).count());
		cpu_utilization_data_y.push_back(procInfo.cpu_utilization);
		ten_sec_counter++;
		if (ten_sec_counter==10)
			break;
	}
	print(cpu_utilization_data_x);
	print(cpu_utilization_data_y);
	Gnuplot gp;
	gp << "set yrange[0:100]\n";
	gp << "set title \"CPU Utilization\"\n";
	gp << "set ylabel \"CPU (%)\"\n";
	gp << "set xlabel \"Time (s)\"\n";
	gp << "plot '-' with lines title '" << procInfo.processname << "'\n";
	gp.send1d(boost::make_tuple(cpu_utilization_data_x,cpu_utilization_data_y));
	return 0;
}

#include <iostream>
#include <stdio.h>
#include "boost/program_options.hpp"
#include "ProcInterface.h"
#include "OutputUtils.h"
#include <chrono>
#include <signal.h>

namespace po = boost::program_options; 

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
		pid = "5458"; 
	}
	
	int ten_sec_counter = 0;
	
	auto start = std::chrono::system_clock::now();
	ProcInterface p;
	ProcInfo procInfo;
	OutputUtils outputter;
	
	sigset_t signal_set, pending_set;
	sigemptyset(&signal_set);
	sigemptyset(&pending_set);
	sigaddset(&signal_set, SIGINT);
	sigaddset(&signal_set, SIGTERM);
	sigaddset(&signal_set, SIGTSTP);
	
	sigprocmask(SIG_BLOCK, &signal_set, NULL);
	
	while(true)
	{
		procInfo = p.fill_values(pid);
		OutputUtils::ConsolePrintContinuous(procInfo);
		outputter.log_process_info(std::chrono::duration_cast<std::chrono::seconds>(std::chrono::system_clock::now() - start).count(), procInfo);
		sigpending(&pending_set);
		if (sigismember(&pending_set, SIGINT)||sigismember(&pending_set, SIGTERM)||sigismember(&pending_set, SIGTSTP))
		{
			break;
		}
	}
	std::cout << "Here now." <<std::endl;
	outputter.save_graphs();
	getchar();
	return 0;
}

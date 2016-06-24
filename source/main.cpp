#include <iostream>
#include <stdio.h>
#include "boost/program_options.hpp"
#include "ProcInterface.h"
#include "PrintUtils.h"

namespace po = boost::program_options; 

int main(int argc, char **argv)
{
	srand(time(NULL));
	int pid = 0;
	
	po::options_description desc("Usage");
	desc.add_options()("help", "Prints usage")("pid",po::value<int>(),"pid of process to be graphed");
	po::positional_options_description positional_desc;
	positional_desc.add("pid",-1);
	
	po::variables_map vm;
	po::store(po::command_line_parser(argc,argv).options(desc).positional(positional_desc).run(),vm);
	po::notify(vm);
	if (vm.count("help")){
		std::cout << desc <<std::endl;
		return 0;
	}
	if (vm.count("pid")){
		pid = vm["pid"].as<int>();
	}
	
	ProcInterface p;
	while(true){
		PrintUtils::ConsolePrintContinuous(p.fill_values("23831"));
	}
	
	return 0;
}

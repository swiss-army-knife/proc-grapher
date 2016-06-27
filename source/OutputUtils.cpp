#include "OutputUtils.h"
#include <iostream>
#include "boost/format.hpp"
#include <chrono>
#include <thread>
#include <time.h>
#include <boost/tuple/tuple.hpp>
#include "gnuplot-iostream.h"

void OutputUtils::log_process_info(double timestamp, ProcInfo& info){
	cpu_utilization_data_x.push_back(timestamp);
	cpu_utilization_data_y.push_back(info.cpu_utilization);
	process_name = info.processname;
}

void OutputUtils::save_graphs(){
	Gnuplot gp;
	gp << "set yrange[0:100]\n";
	gp << "set title \"CPU Utilization\"\n";
	gp << "set ylabel \"CPU (%)\"\n";
	gp << "set xlabel \"Time (s)\"\n";
	gp << "plot '-' with lines title '" << process_name << "'\n";
	gp.send1d(boost::make_tuple(cpu_utilization_data_x,cpu_utilization_data_y));
}

void OutputUtils::ConsolePrintContinuous(const ProcInfo& info){
	std::string header = (boost::format("| %-5s    | %-8s    | %-8s    | %-5s    | %-5s    | %-5s    |")%"PID"%"VMEM(KB)"%"RMEM(KB)"%"CPU"%"FILES"%"THR").str();
	int length = header.length();
	for (int i = 0;i < length; i++)
		std::cout << "_";
	std::cout << std::endl;
	std::cout << header <<std::endl<<std::flush;
	for (int i = 0;i < length; i++)
		std::cout << "-";
	std::cout << std::endl;
	std::cout << boost::format("| %-5s    | %-8d    | %-8d    | %-5.2f    | %-5d    | %-5d    |")%info.pid%(info.vsize)%(info.rss)%(info.cpu_utilization)%(rand()%10)%(info.num_threads) <<std::endl<<std::flush;
	for (int i = 0;i < length; i++)
		std::cout << "-";
	std::cout << std::endl;
	std::this_thread::sleep_for(std::chrono::milliseconds(50));
	std::cout << "\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r";
}



#include "PrintUtils.h"
#include <iostream>
#include "boost/format.hpp"
#include <chrono>
#include <thread>
#include <time.h>


void PrintUtils::ConsolePrintContinuous(){
	std::string header = (boost::format("| %-5s    | %-8s    | %-8s    | %-5s    | %-5s    | %-5s    |")%"PID"%"VMEM(KB)"%"RMEM(KB)"%"CPU"%"FILES"%"THR").str();
	int length = header.length();
	for (int i = 0;i < length; i++)
		std::cout << "_";
	std::cout << std::endl;
	std::cout << header <<std::endl<<std::flush;
	for (int i = 0;i < length; i++)
		std::cout << "-";
	std::cout << std::endl;
	std::cout << boost::format("| %-5s    | %-8d    | %-8d    | %-5.2f    | %-5d    | %-5d    |")%"10210"%(20000+rand()%10000)%(1000+rand()%1000)%(50.0f+(rand()%1000)/100)%(rand()%10)%(rand()%10) <<std::endl<<std::flush;
	for (int i = 0;i < length; i++)
		std::cout << "-";
	std::cout << std::endl;
	std::this_thread::sleep_for(std::chrono::milliseconds(500));
	std::cout << "\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r\33[2K\r\033[A\r";
}



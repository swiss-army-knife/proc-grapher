#pragma once
#include "ProcInfo.h"
#include <vector>
#include <signal.h>

class OutputUtils
{
// Data needed for creating output graphs
	std::vector<double> cpu_utilization_data_x;
	std::vector<double> cpu_utilization_data_y;
	std::string process_name;
public:
	static void ConsolePrintContinuous(const ProcInfo& info);
	void log_process_info(double time_stamp, ProcInfo& info);
	void save_graphs();
	
};



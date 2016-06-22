#pragma once

#include <vector>
#include <iostream>

class ProcInterface {
	std::vector<std::string> pid_list;
public:
	ProcInterface();
	~ProcInterface();
	void refresh_pids();
	void list_pid_memory_info(std::string pid);
};

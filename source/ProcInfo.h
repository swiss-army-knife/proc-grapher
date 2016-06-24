#ifndef PROCINFO_H
#define PROCINFO_H
#include <iostream>

struct ProcInfo {
	long long int pid;
	std::string processname;
	long long int num_threads;
	long long int vsize;
	long long int rss;
	long long int file_handles;
	float cpu_utilization;
};

#endif // PROCINFO_H

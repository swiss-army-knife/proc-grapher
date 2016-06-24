#pragma once

#include <vector>
#include <iostream>
#include "boost/filesystem.hpp"
#include "ProcInfo.h"
#include "boost/tokenizer.hpp"
#include "boost/lexical_cast.hpp"
#include <boost/algorithm/string/predicate.hpp>
typedef boost::char_separator<char> separator_type;

class ProcInterface {

	std::vector<std::string> pid_list;
	int sleep_time;
	boost::filesystem::path cpufile_path;
	void take_cpu_readings(long long int& total_cpu_time,long long int& utime,long long int& stime, boost::filesystem::path&);

public:
	static const int PAGE_SIZE;
	ProcInterface();
	~ProcInterface();
	void refresh_pids();
	ProcInfo fill_values(std::string pid);
	std::vector<std::string> get_file_lines(boost::filesystem::path);	
};

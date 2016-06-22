#include <iostream>
#include <stdio.h>
#include "ProcInterface.h"

int main(int argc, char **argv)
{
	ProcInterface p;
	p.list_pid_memory_info("30897");
	return 0;
}

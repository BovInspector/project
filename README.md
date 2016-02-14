
BovInspector can be used in the following steps:  

1. Extract the results of Fortify. Use ./fvdlParser audit.fvdl file to get static buffer overflow warnings. We save these warnings in the file checklist_bufferoverflow.   

2. Compile the testcase to LLVM bitcode.  


3. Use opt –load ./buildCFG.so –buildCFG –targetList=./checklist_bufferoverflow /dev/null to generate GuideSrc.txt. GuideSrc.txt consists of warning paths.   


4. Use klee to inspect buffer overflows with command line option --guided-execution and additional input file GuideSrc.txt.    


5. Use python repair.py to repair the vulnerabilities that have been validated. Specially, when we need to repair sprintf buffer overflow, we need copy these two files MY_vsnprintf.h and MY_vsnprintf.c to the directory where the repaired source file is. This is because we need to compute the format length to compare with the size of destination buffer.

# project

BovInspector can be used following these steps:
1. extract the results of Fortify. use ./fvdlParser audit.fvdl to get static buffer overflow warning.We save it as checklist_bufferoverflow.
2. compile the testcase to LLVM bitcode.
3. use opt –load ./buildCFG.so –buildCFG –targetList=./checklist_bufferoverflow /dev/null to genarate GuideSrc.txt.GuideSrc.txt is consist of warning path set.
4. use klee to inspect buffer overflow with command line option --guided-execution and additional input GuideSrc.txt.
5. use python repair.py to repair the vulnerability which has been validated.Specially,when we need to repair sprintf buffer overflow,we need copy these two files MY_vsnprintf.h and MY_vsnprintf.c to the dir where the repaired source file is.
Because we need to compute the format length to compare with the size of destination buffer.

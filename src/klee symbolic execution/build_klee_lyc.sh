#!/bin/sh

make clean
./configure --with-llvm=/home/qingjinlyc/IDEs/llvm-2.9  --with-stp=/home/qingjinlyc/IDEs/stp  --with-uclibc=/home/qingjinlyc/IDEs/klee-uclibc-0.02-i386 --enable-posix-runtime
make ENABLE_OPTIMIZED=1


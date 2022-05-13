#!/bin/bash


module load nvhpc/21.7

set -x

pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla:lineinfo -Mcuda type_toto.F90
pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla:lineinfo -Mcuda  test_load_model.F90

ar crv 'lib[3].a' type_toto.o

pgf90 \
  -acc=gpu -ta=tesla:lineinfo \
  -Mcuda -traceback -Mbyteswapio \
  -Wl,--start-group ./test_load_model.o -L. -l[3] -Wl,--end-group 

pgf90 -o toto.x -acc=gpu -ta=tesla:lineinfo -Mcuda -traceback -Mbyteswapio test_load_model.o type_toto.o 

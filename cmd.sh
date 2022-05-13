#!/bin/bash


module load nvhpc/21.7

set -x

\rm *.x *.o *.mod *.a

pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda type_toto.F90
pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda  test_load_model.F90

LIB="[3]"

ar crv "lib$LIB.a" type_toto.o

pgf90 -o toto1.x -acc=gpu -ta=tesla -Mcuda -traceback -Mbyteswapio test_load_model.o type_toto.o 
pgf90 -o toto2.x -acc=gpu -ta=tesla -Mcuda -traceback -Mbyteswapio test_load_model.o -L. -l$LIB 

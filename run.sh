#!/bin/bash


#odule load nvhpc/21.7
module load nvhpc/22.1

set -x

\rm *.x *.o *.mod *.a

pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda type_toto.F90
pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda  test_load_model.F90


for LIB in '_3_' '[3]' 
do
  ar crv "lib$LIB.a" type_toto.o
  pgf90 -o toto$LIB.x -acc=gpu -ta=tesla -Mcuda -traceback -Mbyteswapio test_load_model.o -L. -l$LIB
  ./toto$LIB.x
done

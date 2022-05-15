#!/bin/bash


#odule load nvhpc/21.7
module load nvhpc/22.1

set -x

\rm *.x *.o *.mod *.a

pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda type_toto.F90
pgf90 -c -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -O0 -g -acc=gpu -ta=tesla -Mcuda  test_load_model.F90

ar crv "lib[3].a" type_toto.o
ar crv "lib_3_.a" type_toto.o

pgf90 -o toto_3_.x -acc=gpu -ta=tesla -Mcuda -traceback -Mbyteswapio test_load_model.o -L. -l_3_ 
pgf90 -o toto[3].x -acc=gpu -ta=tesla -Mcuda -traceback -Mbyteswapio test_load_model.o -L. -l[3] 

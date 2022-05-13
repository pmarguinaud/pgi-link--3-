#!/bin/bash

set -x

/home/gmap/mrpm/marguina/pack/48t1_copy_model.01.PGI217.cpu0/mpif90 \
  -c -fPIC -Minfo -gopt -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash \
  -O0 -g -acc=gpu -ta=tesla:lineinfo -Mcuda type_toto.F90

ar crv 'lib[3].a' type_toto.o

/home/gmap/mrpm/marguina/install/gmkpack_support/wrapper/PGI217/mpif90  \
  -c -fPIC -Minfo -gopt -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash   \
  -O0 -g -acc=gpu -ta=tesla:lineinfo -Mcuda  test_load_model.F90


export LD_LIBRARY_PATH=/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/nvshmem/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/nccl/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/math_libs/lib64:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/cuda/lib64
export PATH=/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/bin:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/bin:/home/gmap/mrpm/khatib/public/bin/gmkpack.dev/util:/home/gmap/mrpm/marguina/install/graphviz-2.38.0/bin:/home/gmap/mrpm/marguina/install/jq-1.5/bin:/home/gmap/mrpm/marguina/install/cmake-3.15.3/bin:/home/gmap/mrpm/marguina/install/sqlite-autoconf-3170000/bin:/home/gmap/mrpm/marguina/install/gnuplot-5.0.1/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/gmap/mrpm/marguina/bin

/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi/bin/mpif90 \
  -acc=gpu -ta=tesla:lineinfo \
  -Mcuda -traceback -Mbyteswapio \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/nvshmem/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/nccl/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/mpi/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/math_libs/lib64 \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/compilers/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/cuda/lib64 \
  -Wl,--start-group ./test_load_model.o -L. -l[3] -Wl,--end-group \
  -L/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib -lnvhpcatm \
  -Wl,-rpath,/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib

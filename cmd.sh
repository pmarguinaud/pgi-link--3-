#!/bin/bash

set -x

/home/gmap/mrpm/marguina/pack/48t1_copy_model.01.PGI217.cpu0/mpif90 \
  -c -fPIC -Minfo -gopt -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash \
  -DBULL -DLINUX -DLITTLE_ENDIAN -DLITTLE -DADDRESS64 -DGRIB_API_1 -O0 -g -acc=gpu -ta=tesla:lineinfo \
  -Mcuda -DINTEL_BUG_LAIDDIOBSAD -DINTEL_BUG_MPOBSEQ \
  type_toto.F90

/home/gmap/mrpm/marguina/install/gmkpack_support/wrapper/PGI217/mpif90  \
  -c -fPIC -Minfo -gopt -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash   \
  -DBULL -DLINUX -DLITTLE_ENDIAN -DLITTLE -DADDRESS64 -DGRIB_API_1 -O0 -g -acc=gpu -ta=tesla:lineinfo -Mcuda  \
  -DINTEL_BUG_LAIDDIOBSAD -DINTEL_BUG_MPOBSEQ  test_load_model.F90

export LD_LIBRARY_PATH=/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/nvshmem/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/nccl/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/math_libs/lib64:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/cuda/lib64
export PATH=/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/bin:/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/bin:/home/gmap/mrpm/khatib/public/bin/gmkpack.dev/util:/home/gmap/mrpm/marguina/install/graphviz-2.38.0/bin:/home/gmap/mrpm/marguina/install/jq-1.5/bin:/home/gmap/mrpm/marguina/install/cmake-3.15.3/bin:/home/gmap/mrpm/marguina/install/sqlite-autoconf-3170000/bin:/home/gmap/mrpm/marguina/install/gnuplot-5.0.1/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/gmap/mrpm/marguina/bin

/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi/bin/mpif90 -acc=gpu -ta=tesla:lineinfo \
  -Mcuda -traceback -Mbyteswapio -Wl,-rpath,/home/gmap/mrpm/marguina/install/PGI217/eccodes-2.14.0/lib \
  -Wl,-rpath,/home/gmap/mrpm/marguina/install/PGI217/lapack-3.2.1/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/nvshmem/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/nccl/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/mpi/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/math_libs/lib64 \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/compilers/lib \
  -Wl,-rpath,/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/cuda/lib64 \
  -Wl,-rpath,/home/gmap/mrpm/marguina/install/PGI217/hdf5-1.10.5/lib \
  -Wl,-rpath,/home/gmap/mrpm/marguina/install/PGI217/netcdf-4.7.2/lib \
  -Wl,--start-group ./_odb_glue.o ./test_load_model.o \
  -L. -l[1] -l[2] -l[3] -l[4] -l[5] -l[6] -l[7] -l[8] -l[9] -l[10] -l[11] -l[12] -l[13] -l[14] -l[15] -l[16] \
  -l[17] -l[18] -l[19] -l[20] -l[21] -l[22] -l[23] -l[24] -l[25] -l[26] -l[27] -l[28] -l[29] -l[30] -l[31] -l[32] \
  -l[33] -l[34] -l[35] -l[36] -l[37] -l[38] -l[39] -l[40] -l[41] -l[42] -l[43] -l[44] -l[45] -l[46] \
  -Wl,--end-group -L/home/gmap/mrpm/marguina/install/PGI217/x2.9/lib -lbufr -lgribex \
  -L/home/gmap/mrpm/marguina/install/PGI217/netcdf-4.7.2/lib -lnetcdff -lnetcdf \
  -L/home/gmap/mrpm/marguina/install/PGI217/eccodes-2.14.0/lib -leccodes_f90 -leccodes \
  -L/home/gmap/mrpm/marguina/install/PGI217/hdf5-1.10.5/lib -lhdf5hl_fortran -lhdf5_fortran -lhdf5 \
  -L/home/gmap/mrpm/marguina/install/PGI217/x2.9/lib -lfdbdummy -lwamdummy -lnaglitedummy -loasisdummy \
  -L/home/gmap/mrpm/marguina/install/PGI217/lapack-3.2.1/lib -llapack -lblas -L/home/gmap/mrpm/marguina/install/PGI217/x2.9/lib \
  -libmdummy -Wl,-rpath,/home/gmap/mrpm/marguina/install/PGI217/hdf5-1.10.5/lib \
  -L/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib -lnvhpcatm \
  -Wl,-rpath,/opt/softs/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers/lib

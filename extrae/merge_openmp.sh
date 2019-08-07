#!/bin/bash
#BSUB -P stf007
#BSUB -J MINIW_MPI_OPENMP_EXTRAE_MERGE
#BSUB -o miniw_mpi_openmp_extrae_merge.o%J
#BSUB -e miniw_mpi_openmp_extrae_merge.e%J
#BSUB -W 10
#BSUB -nnodes 8


export OMP_NUM_THREADS=2

jsrun -n 64 -r 8 -a 1 -c 1  mpimpi2prv -f TRACE.mpits -e ./miniWeather_mpi_openmp

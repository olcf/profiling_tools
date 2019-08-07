#!/bin/bash
#BSUB -P stf007
#BSUB -J MINIW_MPI_OPENMP_EXTRAE
#BSUB -o miniw_mpi_openmp_extrae.o%J
#BSUB -e miniw_mpi_openmp_extrae.e%J
#BSUB -W 10
#BSUB -nnodes 2
 

export OMP_NUM_THREADS=2

jsrun -n 16 -r 8 -a 1 -c 2  ./trace_openmp.sh ./miniWeather_mpi_openmp
 

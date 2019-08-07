#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_OPENMP_TAU
#BSUB -o miniw_mpi_openmp_tau.o%J
#BSUB -e miniw_mpi_openmp_tau.e%J
#BSUB -W 10
#BSUB -nnodes 2

export OMP_NUM_THREADS=4
time jsrun -n 16 -r 8 -a 1 -c 4 -b packed:4 ./miniWeather_mpi_openmp 
 

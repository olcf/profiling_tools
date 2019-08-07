#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_TAU
#BSUB -o miniw_mpi_tau.o%J
#BSUB -e miniw_mpi_tau.e%J
#BSUB -W 10
#BSUB -nnodes 2
 

time jsrun -n 16 -r 8 -a 1 -c 1  ./miniWeather_mpi
 

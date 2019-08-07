#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI
#BSUB -o miniw_mpi.o%J
#BSUB -e miniw_mpi.e%J
#BSUB -W 10
#BSUB -nnodes 2
 

time jsrun -n 16 -r 8 -a 1 -c 1  ./miniWeather_mpi
 

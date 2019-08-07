#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_EXTRAE
#BSUB -o miniw_mpi_extrae.o%J
#BSUB -e miniw_mpi_extrae.e%J
#BSUB -W 10
#BSUB -nnodes 2


jsrun -n 16 -r 8 -a 1 -c 1  ./trace_mpi.sh ./miniWeather_mpi
 

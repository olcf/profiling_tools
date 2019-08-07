#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_EXTRAE_MERGE
#BSUB -o miniw_mpi_extrae_merge.o%J
#BSUB -e miniw_mpi_extrae_merge.e%J
#BSUB -W 10
#BSUB -nnodes 8


jsrun -n 64 -r 8 -a 1 -c 1  mpimpi2prv -f TRACE.mpits -e ./miniWeather_mpi

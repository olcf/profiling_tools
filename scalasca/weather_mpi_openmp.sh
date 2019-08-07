#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_OPENMP_SCALASCA
#BSUB -o miniw_mpi_openmp_scalasca.o%J
#BSUB -e miniw_mpi_openmp_scalasca.e%J
#BSUB -W 10
#BSUB -nnodes 2


export SCOREP_METRIC_PAPI=PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_FP_OPS
export SCOREP_MPI_ENABLE_GROUPS=ALL
export SCOREP_TOTAL_MEMORY=20MB
export OMP_NUM_THREADS=8
export SCAN_MPI_LAUNCHER=jsrun
export TOTAL_SCOREP_MEMORY=340MB
scalasca -analyze -q -t jsrun -n 16 -r 2 -a 1 -c 8 "-b packed:8" ./miniWeather_mpi_openmp

 

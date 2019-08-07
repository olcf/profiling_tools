#!/bin/bash
#BSUB -P gen130
#BSUB -J MINIW_MPI_SCALASCA
#BSUB -o miniw_mpi_scalasca.o%J
#BSUB -e miniw_mpi_scalasca.e%J
#BSUB -W 10
#BSUB -nnodes 2
 

module load scorep/6.0_r14595
module load scalasca/2.5

export SCOREP_METRIC_PAPI=PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_FP_OPS
export SCOREP_MPI_ENABLE_GROUPS=ALL
export SCOREP_TOTAL_MEMORY=20MB
export SCAN_MPI_LAUNCHER=jsrun
time scalasca -analyze  jsrun -n 16 -r 8 -a 1 -c 1 ./miniWeather_mpi 

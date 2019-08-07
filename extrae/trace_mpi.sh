#!/bin/bash



export EXTRAE_HOME=/sw/summit/extrae/3.7.1//rhel7.5_gnu6.4.0

export EXTRAE_CONFIG_FILE=$PWD/extrae_mpi.xml

export LD_PRELOAD=${EXTRAE_HOME}/lib/libmpitrace.so:$LD_PRELOAD #OpenMP

## Run the desired program
$*


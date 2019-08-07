# profiling_tools
Profiling tools training workshop 

* Download the MiniWeather app:

git clone https://github.com/mrnorman/miniWeather.git

* Replace the makefile in C++ version

cp common/Makefile_cxx miniWeather/c/Makefile

* Load the appropriate modules and compile all the versions or the one tou want

module load pgi/19.4  
module load parallel-netcdf   
export PROF_ROOT=$PWD/profiling_tools
cd miniWeather/c/   
make  

or  

MPI:  

make mpi   

OpenMP: 

make openmp   

OpenACC:  
  
make openacc  

* Submit the version you want, uodate the project ID if necessary

	* MPI  
	bsub weather_mpi.sh

	* MPI+OpenMP  
	bsub weather_mpi_openmp.sh

	* MPI+OpenACC  
	bsub weather_mpi_openacc.sh

# TAU

cd $PROF\_ROOT/tau/

cp -r ../../miniweather .

cd miniweather/c


* Load TAU

	module load tau/2.28.1_patched

* Declare the correct linking

	export TAU_OPTIONS='-optLinking=-lpnetcdf -optVerbose'

* Compile and run

	MPI:  
        Edit Makefile and replace mpicxx with tau_cxx.sh  
	Declare TAU_MAKEFILE  
	export TAU_MAKEFILE=/sw/summit/tau/2.28.1_patched/ibm64linux/lib/Makefile.tau-pgi-papi-mpi-pdt-pgi  
        make mpi  
        Edit the script weather_mpi.sh to activate the TAU variables that you require  
        bsub weather_mpi.sh 

        MPI+OpenMP:  
        Edit Makefile and replace mpicxx with tau_cxx.sh  
        Declare TAU_MAKEFILE  
        export TAU_MAKEFILE=/sw/summit/tau/2.28.1_patched/ibm64linux/lib/Makefile.tau-pgi-papi-mpi-pdt-openmp-opari-pgi  
        make openmp  
        Edit the script weather_mpi.sh to activate the TAU variables that you require  
        bsub weather_mpi_openmp.sh 

        MPI+OpenACC:
        USE mpicxx in the Makefile
        make openacc  
        Edit the script weather_mpi.sh to activate the TAU variables that you require  
        bsub weather_mpi_openacc.sh  

* Visualize

	* Connect to the systen with X11 support.
	* If there are many folders with pattern MULTI\__*, execute
		paraprof

	* If there are many files and not a folder, plack them and execute parprof  
		paraprof --pack name.ppk  
		paraprof name.ppk  
c

* Which loops require the most time?

	export TAU_OPTIONS='-optTauSelectfile=select.tau -optLinking=-lpnetcdf -optVerbose'

	* Compile and Execute

* To create a dynamic phase use the file select2.tau in TAU_OPTIONS

#SCALASCA


cd $PROF\_ROOT/tau/

cp -r ../../miniweather .

cd miniweather/c  


* Load Scalasca

        module load scorep/6.0_r14595  
        module load scalasca  

 * Edit Makefile
	
	Change the  

	CC := mpipgic++  
	to  
	CC := ${PREP} mpipgic++



* Compile and run

        MPI:
        make PREP ="scorep --mpp=mpi --pdt" mpi
        Edit the script weather_mpi.sh to activate the Scalasca/Score-P variables that you require
        bsub weather_mpi.sh

        MPI+OpenMP:
        make PREP ="scorep --mpp=mpi --openmp --pdt" openmp
        Edit the script weather_mpi.sh to activate the Scalasca/Score-P variables that you require
        bsub weather_mpi_openmp.sh

* Visualize

	scalasca -examine /path/to/folder/

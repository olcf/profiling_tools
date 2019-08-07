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

cd $PROF_ROOT

cp -r ../../miniweather .

cd miniweather/c

* Edit Makefile and replace mpicxx with tau_cxx.sh

* Load TAU

module load tau/2.28.1_patched

* Compile

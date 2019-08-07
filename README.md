# profiling_tools
Profiling tools training workshop 

* Download the MiniWeather app:

git clone https://github.com/mrnorman/miniWeather.git

* Replace the makefile in C++ version

cp common/Makefile_cxx miniWeather/c/Makefile

* Load the appropriate modules and compile all the versions or the one tou want

module load pgi/19.4 \\
module load parallel-netcdf \\
cd miniWeather/c/ \\
make \\
or  \\

MPI:\\ 
make mpi\\ 

OpenMP: \\
make openmp \\

OpenACC  \\
make openacc  \\


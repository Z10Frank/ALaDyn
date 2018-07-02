#PBS -l nodes=6:ppn=24
#PBS -q default
#PBS -j oe

module use /opt/exp_soft/vo.llr.in2p3.fr/modulefiles
module load compilers/icc/17.3.191 mpi/openmpi/1.6.5-ib-icc hdf5/1.8.19-icc-omp1.6.5 python/2.7.10 compilers/gcc/4.9.2

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'/opt/exp_soft/vo.llr.in2p3.fr/fftw-3.3.4-openmpi-1.6.5-intel-13/lib/'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'/opt/exp_soft/vo.llr.in2p3.fr/intel/v17/compilers_and_libraries_2017.3.191/linux/mkl/lib/intel64/'

#Go to current directory
cd $PBS_O_WORKDIR
export PATH=$PATH:/opt/exp_soft/vo.llr.in2p3.fr/GALOP/beck

mpirun -mca orte_num_sockets 2 -mca orte_num_cores 12 -cpus-per-proc 1  -npersocket 12 -n 144 ALaDyn

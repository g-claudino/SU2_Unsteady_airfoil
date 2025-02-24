#!/bin/sh
#SBATCH -p debug
#SBATCH -J MPI_Test
#SBATCH --nodes=2                      #Numero de Nós
#SBATCH --ntasks-per-node=64          #Numero de tarefas por Nó
#SBATCH --ntasks=128                     #Numero total de tarefas MPI
#SBATCH --cpus-per-task=1            #Numero de threads por tarefa MPI
#SBATCH -t 01:00:00
#SBATCH -o test.o%j
#SBATCH -e test.o%j
#SBATCH --mail-type=all
#SBATCH --mail-user=guilhermeclaudino1997@gmail.com

echo "########################################"
echo "Starting at `date`"
echo "Running on hosts: $SLURM_NODELIST"
echo "Running on $SLURM_NNODES nodes."
echo "Running on $SLURM_NPROCS processors."
echo "Current working directory is `pwd`"
echo "########################################"

module load SU2/7.5.1-GCC-8.2.0-2.31.1
srun -N 2 -n 128 SU2_CFD NACA64A006_Unsteady.cfg

echo "########################################"
echo "Program finished with exit code $? at: `date`"
echo "########################################"

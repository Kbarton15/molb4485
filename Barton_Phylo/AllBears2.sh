#!/bin/bash
#SBATCH -J RAxML
#SBATCH -n 1
#SBATCH -t 30:00
#SBATCH --mem=20g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kbarton3@uwyo.edu

#SBATCH --ntasks-per-node=8
#SBATCH --account=inbre-train
#SBATCH partition-inv-inbre

#each echo commands is just to make sure that all of your code is running properly
echo "Starting raxmlHPC run at $ (date)"

module load swset gcc raxml

#This next bit of code is all on one line

raxmlHPC-PTHREADS-AVX -T 8 -f a -m GTRGAMMA -p 618 -N 2 -x 309 -s AllBears.aln \
-n AllBearTrees -w /project/inbre-train/inbre005/mob4485/Barton_Phylo/AllBearTrees -o GiantPanda

echo "RAxML has finished at $(date)"

#!/bin/bash

#Hardcoded path.
cd /media/kokyriakidis/PRODUCTION/GSOC/

#Create the proper directory structure.
mkdir reference
mkdir data
mkdir stringtie_output
mkdir -p tablemaker_output/sample_brain
mkdir -p tablemaker_output/sample_liver

#Download the required sorted and genome converted BAM files.
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/genome/RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam -P ./data
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/genome/RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam -P ./data


#Download ENSEMBLE v99 Mus_musculus gff3 file from ENSEMBLE ftp repository and unzip it.
wget ftp://ftp.ensembl.org/pub/release-99/gtf/mus_musculus/Mus_musculus.GRCm38.99.gtf.gz -P ./reference
gunzip ./reference/Mus_musculus.GRCm38.99.gtf.gz

#Run Strintie using Long Reads (-L) using the brain bam file.
#Use -b parameter to enable output of Ballgown table files in the specified directory using the integrated Tablemaker tool. It requires the -G option with the reference annotation to use for guiding the assembly process (GTF/GFF3).
stringtie -L \
-G ./reference/Mus_musculus.GRCm38.99.gtf \
-b ./tablemaker_output/sample_brain \
-o ./stringtie_output/RNA_nanopore_brain.gtf \
./data/RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam


#Run Strintie using Long Reads (-L) using the liver bam file.
#Use -b parameter to enable output of Ballgown table files in the specified directory using the integrated Tablemaker tool. It requires the -G option with the reference annotation to use for guiding the assembly process (GTF/GFF3).
stringtie -L \
-G ./reference/Mus_musculus.GRCm38.99.gtf \
-b ./tablemaker_output/sample_liver \
-o ./stringtie_output/RNA_nanopore_liver.gtf \
./data/RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC_genome_convert.sorted.bam





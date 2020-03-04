#Install Ballgown
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ballgown")

#Load Ballgown
library(ballgown)

#Set working directory.
setwd("/media/kokyriakidis/PRODUCTION/GSOC")

#Make the ballgown object.
bg = ballgown(dataDir="tablemaker_output", samplePattern='sample_', meas='all')

#Extract transcript-level FPKM mesurements from the ballgown object. 
transcript_fpkm_matrix = texpr(bg, meas = "FPKM")

#The first 1000 lines of the FPKM matrix produced by Ballgown, without counting the header.
fpkm_matrix_1000_lines = transcript_fpkm_matrix[1:1000,]

#Save the previous matrix as a csv file.
write.table(fpkm_matrix_1000_lines, "/media/kokyriakidis/PRODUCTION/GSOC/FPKM_1000_LINES.csv", row.names=FALSE, sep = ",", quote = FALSE)

#Create a file containing the first 1000 lines from the stringtie output on the liver sample.
system("head -1000 ./stringtie_output/RNA_nanopore_liver.gtf > 1000_liver_stringtie.gtf")

#Create a file containing the first 1000 lines from the stringtie output on the brain sample.
system("head -1000 ./stringtie_output/RNA_nanopore_brain.gtf > 1000_brain_stringtie.gtf")

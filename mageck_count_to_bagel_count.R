###Script to turn MAGeCK count files to BAGEL count files
#Author: Jonathan Chan

library(tidyverse)
working_directory <- getwd()

working_directory <- paste(working_directory,'dipg_screen_data', sep='/') # Need to define your working directory folder here

count2b <- read_delim(paste(working_directory, 'count2b.count_thresholded.txt',sep='/')) %>%
  arrange(sgRNA)
library <- read_csv(paste(working_directory,'library_data/minlibcas9_addgene_library.csv',sep='/')) %>%
  rename(SEQUENCE =Seq, GENE = Gene) %>%
  arrange(sgRNA_ID)

bagel_output_tb <- bind_cols(count2b, SEQUENCE = library$SEQUENCE, GENE = library$GENE) %>%
  select(15,16,3:14)

write_tsv(bagel_output_tb, 'count2b.count_thresholded_bagel.txt')

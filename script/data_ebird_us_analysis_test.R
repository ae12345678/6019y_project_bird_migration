library(auk)
library(tidyverse)
f_select <- "data/ebird/ebd_smaller.txt"
ebd_us<- read.table(file = f_select, sep="\t", header = TRUE)
genus_species[1,2]

ebd_us%>%
  filter(SCIENTIFIC.NAME==genus_species[723,2])%>%
  head()
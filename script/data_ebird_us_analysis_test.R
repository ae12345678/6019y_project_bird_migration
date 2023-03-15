library(auk)
library(tidyverse)
f_select <- "data/ebird/ebd_smaller.txt"
ebd_us<- read.table(file = f_select, sep="\t", header = TRUE)
state_code <- state.abb
genus_species[1,2]
state_code[21]

ebd_us%>%
  filter(SCIENTIFIC.NAME==genus_species[723,2])%>%
  head()
ebd_us%>%
  filter(STATE.CODE==paste("US",state_code[21],sep="-"))%>%
  head()

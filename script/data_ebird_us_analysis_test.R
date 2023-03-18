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
#testing iteration of species presence in a state
for (i in 1:nrow(genus_species)){
  for (j in 1:50){
  try(h<-ebd_us%>%
        filter(SCIENTIFIC.NAME==genus_species[i,2], 
               STATE.CODE==paste("US",state_code[j],sep="-"))%>%
        nrow())
    if(h>0){
      sig_dir_bbs_test[i,j+2]=1
    }else{
      sig_dir_bbs_test[i,j+2]=0
    }
  }
  print("sp. done")}


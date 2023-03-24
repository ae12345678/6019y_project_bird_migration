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

bbs_ebird_data <- sig_dir_bbs_test%>%
  filter(!is.na(X1),
         !is.na(X2),
         std_error!="c",std_error!=NaN,std_error!=0,
         (X3==1|X4==1|X5==1|X6==1|X7==1|X8==1|X9==1|X10==1|X11==1|X12==1|X13==1|X14==1|X15==1|X16==1|X17==1|X18==1|X19==1|X20==1|X21==1|X22==1|X23==1
          |X24==1|X25==1|X26==1|X27==1|X28==1|X29==1|X30==1|X31==1|X32==1|X33==1|X34==1|X35==1|X36==1|X37==1|X38==1|X39==1|X40==1|X41==1|X42==1|X43==1
          |X44==1|X45==1|X46==1|X47==1|X48==1|X49==1|X50==1|X51==1|X52==1))

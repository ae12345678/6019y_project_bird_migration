library(tidyverse)
#testing isolating specific species from data.
bird_strat%>%
  filter (AOU == species_strat[6,2])%>%
  ggplot(aes(x=Year, y=SpeciesTotal))+
  geom_point()
#testing linear models on bbs data.
s<-bird_strat%>%
  filter (AOU == species_strat[86,2])%>%
  lm(formula=Year~SpeciesTotal)
broom::tidy(s)
#testing loop
for (i in 1:(nrow(species_strat))){
  try({s<-bird_strat%>%                   #try lets us skip the lots of 0 cases errors
    filter (AOU == species_strat[i,2])%>%
    lm(formula=Year~SpeciesTotal)})
}
#testing small scale iteration w/ name changing variable
for (i in 1:10){
  try({assign(paste("v",i,sep=""),bird_strat%>%                   
                filter (AOU == species_strat[i,2])%>%
                lm(formula=Year~SpeciesTotal))})
}
#notes
#v1tidy <- broom::tidy(v1)
#v1tidy[2,5]
#gets the pvalue

#trying to make something work with if else statements
for (i in 1:10){
  try({s<-bird_strat%>%                   #try lets us skip the lots of 0 cases errors
    filter (AOU == species_strat[i,2])%>%
    lm(formula=Year~SpeciesTotal)
  stidy <- broom::tidy(s)
  if (stidy[2,5] >= 0.05){
    print("bad")}else{print("good")}
  })
}
#small scale trialing of final automation
sig_dir_bbs_test<-data.frame(matrix(ncol=2))
for (i in 1:10){
  try({s<-bird_strat%>%                   #try lets us skip the lots of 0 cases errors
    filter (AOU == species_strat[i,2])%>%
    lm(formula=Year~SpeciesTotal)#linear model
  stidy <- broom::tidy(s)
  sig_dir_bbs_test[nrow(sig_dir_bbs_test)+1,1]=species_strat[i,2]
  if (stidy[2,5] <= 0.05& stidy[2,2]<0){        #if statements for simple presence and direction of change
    sig_dir_bbs_test[nrow(sig_dir_bbs_test),2]="-"}else if(stidy[2,5] <= 0.05){
    sig_dir_bbs_test[nrow(sig_dir_bbs_test),2]="+" 
    }else{
      sig_dir_bbs_test[nrow(sig_dir_bbs_test),2]="="  
    }
  })    #NAs in col2 seem to mean not enough data in the model.
}


#large scale trialing of final automation (this crashed for me at 4GB ram.)
sig_dir_bbs_test<-data.frame(matrix(ncol=2))
for (i in 1:nrow(species_strat)){
  try({s<-bird_strat%>%                   #try lets us skip the lots of 0 cases errors
    filter (AOU == species_strat[i,2])%>%
    lm(formula=Year~SpeciesTotal)#linear model
  stidy <- broom::tidy(s)
  sig_dir_bbs_test[i,1]=species_strat[i,2]
  if (stidy[2,5] <= 0.05& stidy[2,2]<0){        #if statements for simple presence and direction of change
    sig_dir_bbs_test[i,2]="-"}else if(stidy[2,5] <= 0.05){
      sig_dir_bbs_test[i,2]="+" 
    }else{
      sig_dir_bbs_test[i,2]="="  
    }
  })    #NAs in col2 seem to mean not enough data in the model.
}

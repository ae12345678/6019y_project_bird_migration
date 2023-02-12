library(tidyverse)
#testing isolating specific species from data.
bird_strat%>%
  filter (AOU == species_strat[86,2])%>%
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

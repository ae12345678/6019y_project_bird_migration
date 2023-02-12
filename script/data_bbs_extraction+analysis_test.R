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

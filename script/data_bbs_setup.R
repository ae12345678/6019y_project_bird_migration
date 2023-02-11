library(bbsBayes)#produced using jags version 4.3.1
fetch_bbs_data()#check https://rappdirs.r-lib.org/ for file location

load_bbs_data()
strat_bbs <- stratify(by="state")
strat_state<-load_map(stratify_by = "state")#visual of stratification.
plot(strat_state)
bird_strat<-data.frame(strat_bbs[["bird_strat"]])#needed to use data in ggplot
                                                 #turns list into dataframe.
species_strat<-data.frame(strat_bbs[["species_strat"]])
species_strat$aou <- as.numeric(as.character(species_strat$aou))#this must be run to convert a bad choice to a good choice.

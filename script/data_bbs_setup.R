library(bbsBayes)#produced using jags version 4.3.1
fetch_bbs_data()#check https://rappdirs.r-lib.org/ for file location

load_bbs_data()
stratify(by="state")
strat_state<-load_map(stratify_by = "state")
plot(strat_state)

library(auk)
library(tidyverse)
library(xlsx)
state_area_analysis<-data.frame(matrix(ncol=10))#creates dataframe for state analysis
state_urban_pop <-read.xlsx(file.path("data/pop-urban-pct-historical.xls"),sheetName = "States",colIndex = c(2,15,16))

for (i in 1:50){
  state_area_analysis[i,1]=state_code[i]
  state_area_analysis[i,2]=sum(as.numeric(bbs_ebird_data[,2])*as.numeric(bbs_ebird_data[,i+2]))/sum(bbs_ebird_data[i+2])
}

state_area_analysis%>%
  ggplot(aes(x=X1,y=X2))+
  geom_point()

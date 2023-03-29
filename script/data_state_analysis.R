library(auk)
library(tidyverse)
library(xlsx)
library(lmtest)
state_area_analysis<-data.frame(matrix(ncol=10))#creates dataframe for state analysis
state_urban_pop <-read.xlsx(file.path("data/pop-urban-pct-historical.xls"),sheetName = "States",colIndex = c(2,15,16))
state_GAP_protected <- read.csv(file.path("data/data_state_GAP_protected.csv"))
for (i in 1:50){
  state_area_analysis[i,1]=state_code[i]
  state_area_analysis[i,2]=sum(as.numeric(bbs_ebird_data[,2])*as.numeric(bbs_ebird_data[,i+2]))/sum(bbs_ebird_data[i+2])
}

state_area_analysis%>%
  ggplot(aes(x=X1,y=X2))+
  geom_point(aes(color=X5))

state.name[grep(as.character(state.abb[20]),state.abb)]
for (i in 1:50){
  state_area_analysis[i,1]=state_code[i]
  state_area_analysis[i,2]=sum(as.numeric(bbs_ebird_data[,2])*as.numeric(bbs_ebird_data[,i+2]))/sum(bbs_ebird_data[i+2])
  o<-filter(state_urban_pop,NA.==state.name[grep(as.character(state.abb[i]),state.abb)])
  state_area_analysis[i,4]=sum(o$NA..2)
  p<-filter(state_GAP_protected,state==state.abb[i])
  state_area_analysis[i,5]=sum(p$GAP_protected_percent)
  state_area_analysis[i,3]=sqrt(sum((as.numeric(bbs_ebird_data$std_error)*bbs_ebird_data[,i+2]))^2)
}

ls_gap_trend <- lm(data=state_area_analysis, formula = X2~X5)
plot(fitted(ls_gap_trend), resid(ls_gap_trend), xlab='Fitted Values', ylab='Residuals')
bptest(ls_gap_trend)#doesnt suggest heteroscedasticity, still going to see how weighting goes
ls_gap_trend_w <- lm(data=state_area_analysis, formula = X2~X5,weights = 1/X3)

ls_urban_trend <- lm(data=state_area_analysis, formula = X2~X4)
plot(fitted(ls_urban_trend), resid(ls_urban_trend), xlab='Fitted Values', ylab='Residuals')
bptest(ls_urban_trend)
ls_urban_trend_w <- lm(data=state_area_analysis, formula = X2~X4,weights = 1/X3)#greater p than without weighting
plot(fitted(ls_urban_trend_w), resid(ls_urban_trend_w), xlab='Fitted Values', ylab='Residuals')
bptest(ls_urban_trend_w)

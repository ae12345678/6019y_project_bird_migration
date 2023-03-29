library(tidyverse)
state_area_analysis%>%#urban pop and trend
  ggplot(aes(x=X4,y=X2))+
  geom_point()
state_area_analysis%>%#gap protected and trend
  ggplot(aes(x=X5,y=X2))+
  geom_point()
state_area_analysis%>%#gap protected and urban
  ggplot(aes(x=X5,y=X4))+
  geom_point()
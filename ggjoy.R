library(tidyverse)
library(ggthemes)
library(ggjoy)
library(ggrepel)


download.file("https://raw.githubusercontent.com/diegotrindade/lectures/master/data/diabetes.csv", "diabetes.csv")

diabetes<-read.csv2("diabetes.csv")
diabetes

#####
str(diabetes)

ggplot(data=diabetes,  aes(hdl, y=..density..))+
geom_histogram(color="white", fill="blue")

####


a<-ggplot(data=diabetes,  aes(hdl, fill=gender))+
  geom_histogram(color="white")

a+facet_grid(.~gender)

###

ggplot(diabetes, aes(hdl)) +
  geom_histogram(color="white")+
  facet_wrap(~gender,nrow=2)

###


ggplot(diabetes, aes(hdl)) +
  geom_histogram(color="white")+
  facet_wrap(c("gender", "location"))

####
?aggregate
library(dplyr)

d %>%
  group_by(Name) %>%
  summarise_each(funs(mean(., na.rm=TRUE)), -Month)
ggplot(diabetes, aes(hdl)) +
  geom_histogram(color="white")+
  facet_grid(gender~location)

#### ggjoy - check ###

download.file("https://raw.githubusercontent.com/diegotrindade/lectures/master/data/schools.csv", "schools.csv")

sch<-read.csv("schools.csv")

sch<-arrange(sch,school)
str(sch)

sch$school<-as.factor(sch$school)
ggplot(sch,aes(x=score1,y=reorder(school,score1)))+
  geom_joy()+
  theme_tufte()

  
ggplot(sch[1:100,],aes(x=school,y=score1))+
    geom_violin()+
    theme_tufte()+
    coord_flip()

ggplot(sch[1:100,],aes(x=school,y=score1))+
  geom_boxplot()+
  theme_tufte()+
  coord_flip()

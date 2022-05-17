rm(list = ls())

x = read.csv("G:/bigdate/2/electricity_generation_per_person.csv",
             header = T, as.is = T)
x
str(x)

plot(x)

x

getwd()

install.packages(readxl)
library(readxl)

t1 <- readLiens("G:\bigdate\2\students1")
setwd("G:/bigdate/2")
t1 <- readLiens("students1.txt")

ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
ex_data1 <- data.frame(ID=ID, SEX=SEX)


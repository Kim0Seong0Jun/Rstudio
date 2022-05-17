getwd()
setwd("F:/bigdate")

library(gapminder)
library(dplyr)
library(ggplot2)



# P.161 데이터 가공의 실제 
# 여기서 캐글에 대해서 설명을 해주는데 그냥 여러가지의 데이터가 있다.
avocado <- read.csv("F:/bigdate/avocado.csv", header = TRUE, 
                    sep = ",")


# p.162 아보카도 데이터 불러오기.
str(avocado)
head(avocado)
tail(avocado)
glimpse(avocado) # str도 좋지만 glimpse로 보면 한눈에 들어와서 좋다고함

# group_by, summarize, filter, select, arrange, sample_frac, sample_n 
# setdiff, substr, gather, merge
# 위 명령어들을 사용해서 데이터를 통계 낸다.  

# P.163 그룹 단위 통계 
(x_avg <- avocado %>% group_by(region) %>% summarize(V_avg = mean(Total.Volume), 
                                                     P_avg = mean(AveragePrice)))
glimpse(x_avg)
# 위에 꺼에서 year을 추가시킨 것이다. 
(x_avg <- avocado %>% group_by(region, year) %>% summarize(V_avg = mean(Total.Volume), 
                                                     P_avg = mean(AveragePrice)))
#  위에 꺼에서 type까지 추가 시킨 것이다. 
(x_avg <- avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), 
                                                           P_avg = mean(AveragePrice)))
# 데이터 정렬해보기
arrange(x_avg, desc(V_avg)) # 이걸로 정렬하게 되면 총합도 포함이 된다.
?arrange

X_avg2 <- x_avg %>% filter(region != "Totalus")
arrange(X_avg2, desc(V_avg))
X_avg2[x_avg2$V_avg == max(x_avg$c_avg),]
glimpse(avocado)

library(lubridate)
install.packages('lubridate')
# P. 166 

# 첫번째 문제는 
# 두번째 문제는 관측 데이터 각자 알아서 하나 정해서 결측값 

# P.168 여기 부분 내가 다시 공부하기
wine <- read.table("F:/bigdate/wine.data.txt", header = FALSE, sep = ",")
str(wine) # header를 FALSE를 주는 이유는 헤더가 없는데 트루로 하면 값이 이상해진다.

n = readLines("F:/bigdate/wine.name.txt")
n

names(wine)[2:14] <- substr(n, 4, nchar(n))

# P.169 데이터 셋 분할하기
train_set <- sample_frac(wine, 0.6)
train_set2 <- sample_n(wine, 10)
View(train_set2)
# P.169 데이터 구조 변경

# P.172
elec_gen = read.csv("F:/bigdate/electricity_generation_per_person/electricity_generation_per_person.csv", 
                    header = TRUE, sep = ",")
names(elec_gen)
names(elec_gen) <- substr(names(elec_gen), 2, nchar(names(elec_gen)))
names(elec_gen)

elec_use = read.csv("F:/bigdate/electricity_generation_per_person/electricity_use_per_person.csv", 
                    header = TRUE, sep = ",")
names(elec_use)
names(elec_use) <- substr(names(elec_gen), 2, nchar(names(elec_gen)))
names(elec_use)[2:56] = substr(names(elec_use)[2:56], 2, 
                               nchar(names(elec_use)[2:56]))

# P.173 여기 코딩하는 부분 내가 다시 해보기.. + 174페이지도.. 
library(tidyr)
install.packages("tidyr")
elec_gen_df = gather(elec_gen, -country, key="year", value = "ElectricityGeneration")






# 4월 12일 빅데이터분석 6주차 실습

getwd()
setwd("F:/bigdate")


# p. 134
# 연습문제 1번 인듯
fact2 <- function(x) {
  if (x == 1){
    return(1)
  } else if (x > 1){
    return(x * fact2(x-1))
  }
}
fact2(2)
fact2(3)
fact2(5)
# 연습문제 2번 인듯 p. 134 
f1 <- function(i) {
  inc = 0
  for (j in 1:i) {
  if (i %% j == 0) {
      inc = inc + 1
  }
  }
  if (inc== 2 ){
    return(T)
  } else {
    return(F)
  }
}

f1(5)
f1(6)
f1(11)

# 결측값 이상값에 대해 다시 얘기해줌
# 결측값은 글이 누락되어있는것, 이상값은 터무니한 값이 나온 것

# P.138 연습문제
library(MASS)
str(Cars93) 
?Cars93
head(Cars93)
table(is.na(Cars93))

a = ncol(Cars93) # 가로
a
a = nrow(Cars93) # 세로
a
for (i in c(1:ncol(Cars93))) {
  print(i)
  print(table(is.na(Cars93[,i])))
}

str(Cars93)
mean(Cars93$Luggage.room) # 결측값이 있기때문에 NA가 나옴
mean(Cars93$Weight)
mean(Cars93$Luggage.room, na.rm = T) * 28.316847  # 결측값을 제외하고 평균을 낸다.

# p.143 연습문제 
# 143페이지 연습문제 1번
str(cars)
head(cars)
tail(cars, 10) # head가 1번부터라면 tail은 마지막부터 
min(cars$dist)
max(cars$dist)
?cars

plot(cars)
boxplot(cars$dist) # 이상값을 확인할때 사용할수 있음
boxplot(cars$dist)$stats 
mean(cars$dist)

car <- cars
car$dist <- ifelse(car$dist < 2 | car$dist > 93, NA, car$dist)
mean(car$dist, na.rm = T) # 143페이지 연습문제 1번 답

str(ChickWeight)
CW <- ChickWeight
str(CW)
head(CW)
min(CW$weight)
max(CW$weight)
#boxplot()$stats 을 사용하면 이상값이 어느정도 알수 있다.
boxplot(CW$weight)$stats # 이번에 과제 준비할때 이거 쓰고 하기
CW$weight <- ifelse(CW$weight < 35 | CW$weight > 310, NA, CW$weight)
mean(CW$weight, na.rm = T)


# 143페이지 연습문제 2번 
mean(ChickWeight$weight)
mean(ChickWeight$weight, na.rm = T) 

# ChickWeight$weight <- ifelse(ChickWeight$weight < 35 |#이거는 또는 이라는 말임)

# 이거는 그냥 연습하는거 같음
?airquality
str(airquality)
head(airquality)
tail(airquality)
mean(airquality$Ozone, na.rm = T)
boxplot(airquality[, c(1:3)])
boxplot(airquality[, 1])$stats
airq <- airquality
table(is.na(airq$Ozone))
max(airq$Ozone, na.rm = T)
airq$Ozone <- ifelse(airq$Ozone < 1 | airq$Ozone > 122, NA, 
                     airq$Ozone)
table(is.na(airq$Ozone))
mean(airq$Ozone, na.rm = T)

data()
str(euro)
head(euro)
?euro

# 146페이지 단원문제 1번 문제

# i%%3 == 0 & i%%4 != 0 <- 이걸 사용하는거라는데 
a_sum = 0
for (i in 1:100){
  if (i %% 3 ==0 && i %% 4 !=0){
    a_sum = a_sum +i
  }
  print(a_sum)
}

# != 이거는 ! = 이거임 같지 않다라는말임

# 146페이지 단원문제 2번 문제
tx <- function(x, n) {
  a_sum = 0
  for (i in c(1:n)) {
    if (i %% x == 0) {
      a_sum = a_sum + i
    }
  }
  return(a_sum)
}

tx(3, 10)
tx(4, 10)

# 146페이지 3~5번 문제

install.packages("hflights")
library(hflights)
?hflights
str(hflights)
head(hflights)
table(is.na(hflights)) # na값을 알아내는 법 

# 4번 문제임 
t1 <- max(hflights$ActualElapsedTime, na.rm = T)
t1 / 6
hr <- t1 %/% 60
mn <- t1 %% 60
hr
mn
paste(hr,"시간", mn,"분")
paste0(hr,"시간", mn,"분") # 스페이스바를 안준다. 이말임

# 146페이지 단원문제 5번 답임
max(hflights$Distance)
table(is.na(hflights$Distance))

# 146페이지 단원문제 6번 

mean(hflights$Cancelled, na.rm = T)
sum(hflights$Cancelled, na.rm = T)

# 내가 잘 안되는거는 수학적인것들이 잘안되네 그거 연습하자. 


# 밑에부터는 이제 5장임 



?grep  # 패턴을 매칭 시킨다. 
?char
?paste
?substr
?strsplit

g_data <- c("a1.txt", "AB.txt", "abc.txt", 
            "1234.txt", "cba123.txt")
# grep 함수의 예시들
grep("^a", g_data) # 행만 가져오는 것 
grep("^a", g_data, value=TRUE) # 글씨가 들어간것들을 다 가져오는것 
grep("[0-9]", g_data, value=TRUE) # 숫자가 들어간것들을 가져오는것 
grep("^[0-9]", g_data, value=TRUE) # 숫자로 시작하는것들을 가져오는것

# nchar 함수의 예시들
aa <- "BTS 그래미상 후보로 선정되다."
nchar(aa) # aa안에 있는 글자가 몇개인지 보여주는 것
nchar(g_data) # g_data안에 있는 글자가 몇개인지 보여주는 것

# substr 함수의 예시들
substr('980617', 3, 6) # '' 안에 있는 글자중에 3번째부터 5번째까지 뽑아온다.

tel <- "041) 660-1114"
tel2 <- strsplit(tel, ")")
tel2

# 중간고사 범위는 다음주 수업까지 - 데이터 가공 기초까지만 한다고함
# 빅데이터분석은 이번학기 그냥 비대면강의로 쭉 한다고 함 
# 







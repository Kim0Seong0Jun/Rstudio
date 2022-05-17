getwd()
setwd("F:/bigdate")

# 중간고사 하기전에 좀 정리해주는것들 

# 중간고사를 볼려면 R이나 R스튜디오를 깔아야한다고 함 
# R스튜디오를 깔면 좋은게 복사하기 더 편하다고 함 
# 이걸 설치를 해야 시험을 볼수 있다고함.
# 문제를 보고 문제지를 풀어서 제출을 해야한다고 함 
# 다음주(4월 26일)에 시험을 본 답안지를 과제란에 제출을 하면 된다고함
# 시간이 되야 그게 열린다고 함
# 시험문제는 당일날 10문제 정도가 나갈거라고 함 
# R스튜디오로 문제를 풀어서 과제란에 제출하는 것 임 


x <- 1:12# 벡터를 만드는법 
x

matrix(x, nrow = 3)
matrix(x, nrow = 3, byrow = T)

seq(1, 6, 2) # 1부터 6까지 2씩 커지는것 
seq(0, 1, by=0.01) # 0부터 1까지 0.01씩 커지는 것 

x <- 1:5 
rep(x, times=2) # 전체를 N(2)번 반복하는거
rep(x, each=2) # 각각에 N(2)번을 반복하는것 

# dnorm, pnorm, qnorm, rnorm 이거는 일단 시험에 안나온다고함 
# 알아두면 좀 좋다고 해서 알려주심 

sx1 <- rnorm(n = 170000, mean = 85, sd = 20) #난수를 발행해주는거?..
sx1

install.packages("ggplot2")
library(ggplot2)
sy1 <- dnorm(sx1, mean = 85, sd =20)
df1 <- data.frame(sx1, sy1)
ggplot(df1, aes(sx1, sy1)) +
  geom_line() +
  geom_vline(xintercept = 85, color = "red")

# 페이지 150부터 시작 (데이터 가공)

?gapminder
install.packages("gapminder")
install.packages("dplyr")
library(gapminder)
library(dplyr)

str(gapminder)
view(gapminder)
names(gapminder)
colnames(gapminder)
glimpse(gapminder)

# p.151 
colnames(gapminder)
gapminder[, c("country", "lifeExp")] #행과 열만 가져온다는 것 
gapminder[, c("country", "lifeExp", "year")]

# p.152
gapminder[1:15, ] # 샘플을 추출하는 것이다.
gapminder[850:880, ]

head(gapminder)
gapminder[300:380, ]

# p.153

gapminder[gapminder$country == "Croatia", c("pop", "year")]
# 2개를 묶을때는 c("","") 이런식으로 하면 된다.
         
gapminder[gapminder$country == "Korea, Rep.", c("pop", "year")]
gapminder[gapminder$country == "Korea, Rep.", c("lifeExp", "year")]

gapminder[gapminder$country == "Croatia"&gapminder$year>1990, 
          c("lifeExp", "pop", "year")]

 ap1 <- matrix(c(1:10, 21:30, 31:40), nrow = 3, ncol= 10)
# ap1
# 
# # 아마 matrix에 관한 문제가 중간고사에 나올거 같다.

apply(ap1, 1, mean) # 가운데 1은 행, 2는 열을 의미한다.
apply(ap1, 2, mean) #한꺼번에 연산을 할때 apply를 사용한다. 

apply(gapminder[gapminder$country=="Croatia", 
                c("lifeExp", "pop", "year")], 2, mean)

gapminder[gapminder$country == "Korea, Rep.", c("lifeExp", "year", "max")]



# p.155 연습문제 1번
apply(gapminder[gapminder$country=="Korea, Rep.", 
                c("pop", "year")], 2, max) 

# p.155 연습문제 2번
apply(gapminder[gapminder$continent=="Asia"&gapminder$year=="2007", 
                c("pop")], 2, sum) 



gapminder %>% filter(gapminder$country == "Korea, Rep.") %>%
  select(pop) %>% max() 

gapminder %>% 
  filter(pop == 49044790) %>%
  select(year) %>% max() 

# 교수님 왜이리 %>% 이걸 좋아함?.. 

# p.157

select(gapminder, country, year, lifeExp)
filter(gapminder, country=="Croatia")

# p.158
summarize(gapminder, pop_avg = mean(pop)) # 이게 무슨말이지?
summarize(group_by(gapminder, continent), pop_avg = mean(pop))
summarize(group_by(gapminder, continent, country), 
          pop_avg = mean(pop),)

# p.159 (교수님이 %>% 이걸 좋아하시는건지 무튼 편하다고 꼭해보래) 
gapminder %>% group_by(continent, country) %>% 
  summarize(pop_avg = mean(pop))

G <- filter(gapminder, country == "Croatia")
G1 <- select(G, country, year, lifeExp)
G2 <- apply(G1[ , c("lifeExp")], 2, mean)
G2
# 이 위에것을 한번에 쓸수 있는게 %>% 이거로 한번에 쓸수 있대
# 교수님이 %>% 이거 너무 좋아해 

gapminder %>% filter(country =="Croatia") %>%
  select(country, year, lifeExp) %>% 
  summarize(lifeExp_avg = mean(lifeExp))

summarize(group_by(gapminder, continent, country), 
          pop_avg = mean(pop),)

summarize(grotp_by(Korea, Rep.))

gapminder %>% filter(country =="Korea, Rep.") %>% 
  select(lifeExp, year, gdpPercap)

# 160 페이지 연습문제 2번 아마 중요한듯 이거 시발 어렵네

A1 <-gapminder %>% filter(continent =="Africa") %>% 
  group_by(year) %>% summarize(s=sum(pop))

A2 <- gapminder %>% filter(continent =="Europe") %>% 
  group_by(year) %>% summarize(s=sum(pop))

A1
A2

A1[A1$s > A2$s, "year"] 

# p. 160 연습문제 3번

str(gapminder_unfiltered)
g2 <- gapminder_unfiltered %>% group_by(country) %>% 
  summarize(n=n()) %>% filter(n > 12) %>% 
  arrange(desc(n))
View(gapminder)

# 중간고사는 3,4,5 장에서 나온다고 함 근데 오늘 160페이지 연습문제
# 2번문제가 중간고사를 내기 좋다고 말했음 


# 오늘 중요한 내용들 다 나왔대 오늘꺼는 꼭 공부하자.. 
# 이클래스에 실시간 강의를 들어온다음에 
# 소스코드를 같이 제출해야한대
# 문제를 제시했다면, 코딩한다음에 이값을 컨트롤 씨로 카피한다음에 
# 한글에다가, 메모장에 복사한다음에 답까지 나온거 복사한다음에 붙혀놓기 해야함
# 아아 ㅇㅋㅇㅋ 
# 시험시간은 한시간정도 주는거로 한대. 
# 문제는 10문제 나갈거고, 강의에서 배웠던것들로 제출할 예정이래.
# 빅데이터분석 시험 다음주 화요일(4월 26일)에 화상강의에 들어가서
# 문제들을 본다음에 한시간동안 푸는것임. 

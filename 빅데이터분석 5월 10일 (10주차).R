getwd()
setwd("F:/bigdate")

# 6월 첫 강의는 어떻게 할지 고민하는 중이라고함
# 기말고사는 대면시험으로 한다고 하셨음
# 오늘부터 6장 -데이터 시각화- 나감. 
# 데이터 시각화란? : 데이터 시각화의 필요성 
#  -> data1~data4를 구성하는 각 11개의 데이터 샘플은 평균,분산, x,y
#  간의 상관관계가 모두 동일 하기 때문에 눈으로 표가 보여야 보기 쉽다.
#   뒷쪽에서 선형 회귀식이라는것도 배운대 
# 시각화의 효과 -> 직관을 얻을 수 있다.
#               -> 핵심을 명확하게 이해할 수 있다.
# 6장에서는 ggplot2를 많이 쓰는듯 함 
# P.179

library(dplyr)
library(ggplot2)

?anscombe
glimpse(anscombe)
head(anscombe)
apply(anscombe, 2, mean) # anscombe의 평균을 내는 것.
apply(anscombe, 2, var) # anscombe의 분산을 내는 것.

# 상관관계(상관계수) # P.180
cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)
lm(anscombe$y1 ~ anscombe$x1) # 계수와 기울기?? 이건 7장에서 한대
# 이건 그냥 연습해보는거 
x <- c(2,7,7,4,5,1,3)
mean(x) # 평균
var(x) # 분산 = (각 편차의 제곱승의 합) / (변량의 개수 - 1)
x1 <- c(8,3,2,7,10)
mean(x1)
var(x1)

head(iris)
s1 <- mean(iris$Sepal.Length)
n <- nrow(iris)
s1
n
v1 <- sum((iris$Sepal.Length - s1) ^2) / (n - 1)
v1
var(iris$Sepal.Length)

# P.182 그렇게 막 중요한 부분은 아니라고 말씀하심
library(gapminder)
y <- gapminder %>% group_by(year, continent) %>% summarize(c_pop = sum(pop))
head(y, 20)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

plot(y$year, y$c_pop)
plot(y$year, y$c_pop )

str(gapminder)

mean(gapminder$gdpPercap)
plot(gapminder$gdpPercap)
# legend("topleft", legend = levels(gapminder$gdpPercap), 
#        pch = c(1:legend(levels(gapminder$gdpPercap))), 
#        col = c(1:length(levels(gapminder$gdpPercap))))
names(gapminder) # 185 연습문제 1번 
x <- gapminder %>% group_by(year, continent) %>% 
  summarize(avg_gdp = mean(gapminder))
View(x)

# 185페이지 연습문제 2번 
# filter사용
# gdpPercap, lifeExp : 변수 할당?..
x1 <- gapminder %>% filter(year == 1952) %>% 
  group_by(year, continent) %>%
  summarise(avg_gdp = mean(gdpPercap), 
            avg_life = mean(lifeExp))
plot(x1$avg_gdp, x1$avg_life)

# 188페이지 
library(ggplot2)
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) + geom_point() + scale_x_log10()
# 191페이지 
gapminder %>% filter(year == 1952 & continent == "Asia") %>%
    ggplot(aes(reorder(country, pop), pop)) + geom_bar(stat = "identity")+ 
  coord_flip()# + scale_y_log10()

# 194페이지
gapminder %>% filter(country == "Korea, Rep.") %>% 
  ggplot(aes(year, lifeExp, col = country)) + geom_point() + geom_line()
 
# 195 페이지
x <- filter(gapminder, year == 1952)
hist(x$lifeExp, main = "Histogram of lifeExp in 1952")

x %>% ggplot(aes(lifeExp)) + geom_histogram() # ggplot함수 이용
x %>% ggplot(aes(continent, lifeExp)) + geom_boxplot()

# 197페이지 연습문제 1번 
gapminder %>% filter(year == 1952 & continent == "Asia") %>%
  ggplot(aes(country, pop)) + geom_bar(stat = "identity") + coord_flip()
#     중간에 reorder(리오더)가 안들어가 있습니다. 그래서 정렬이 안되어있습니다. 

# 197페이지 연습문제 2번
ggplot(gapminder, aes(continent, lifeExp)) + geom_point(alpha=0.2, size = 1.0, 
                                                        position = "jitter")
#     6-19는 boxplot을 사용하였다, 연습문제2번은 point를 사용하였다. 

# 198페이지 
head(cars)
plot(cars, type = "l", main = "cars")
plot(cars, type = "b", main = "cars")
plot(cars, type = "h", main = "cars")

# 201페이지
x = gapminder %>% filter(year == 1952 & continent == "Asia") %>% 
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>% arrange(desc(gdp)) %>% 
  head()
View(x)
pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)

# 202페이지 
matplot(iris[, 1:4], type = "l")
legend("topleft", names(iris)[1:4], lty = c(1, 2, 3, 4), 
       col = c(1, 2, 3, 4))











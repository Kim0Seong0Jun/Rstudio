getwd()
setwd("F:/bigdate")

# 지난 시간 복습
library(gapminder)
library(dplyr)
library(ggplot2)

glimpse(gapminder)
gapminder %>% filter(year == 1952 & gdpPercap > 100000 & 
                       continent == "Asia")
x1 <- gapminder %>% filter(year == 1952 & country == "Korea, Rep.")
View(x1)

# p.214 
gapminder %>% filter(year == 1952 & gdpPercap > 100000 & 
                       continent == "Asia")

gapminder %>% filter(country == "Kuwait") %>% 
  ggplot(aes(year, gdpPercap)) +
  geom_point() + geom_line()
# 쿠웨이트의 인구의 연도에 따른 변화 그래프 기말 나올듯 싶음
gapminder %>% filter(country == "Kuwait") %>% 
  ggplot(aes(year, pop)) +
  geom_point() + geom_line()
# 교수님께서 이거 괜히 한건 아닌거 같은디
gdp <- gapminder %>% 
  mutate(gdp = gapminder$gdpPercap * gapminder$pop)

View(gapminder)
gapminder %>% filter(country == "Kuwait" | country == "Korea, Rep.") %>% 
  mutate(gdp = gdpPercap*pop) %>% 
  ggplot(aes(year, gdp, col = country)) + 
  geom_point() + geom_line()

# 시험에 어떻게 나오냐. -> P.221 단원문제 1번 처럼 문제를 낼거래
# 221페이지 단원문제1-1번 
pop1 <- gapminder %>% filter(year == 1952) %>% 
  select(country, pop) %>% arrange(desc(pop)) %>% 
  head()
pie(pop1$pop, pop1$country)
barplot(pop1$pop, names.arg = pop1$country)

# 7장 모델링과 예측 : 선형 회귀
# 7장에서는 여태 배워온것들을 사용해서 예측을 하는 것임.

# p.229
x1 = c(3.0, 6.0, 9.0, 12.0)
y1 = c(3.0, 4.0, 5.5, 6.5)
m1 = lm(y1 ~ x1)
m1 
summary(m1)

# p.233
plot(x1, y1)
abline(m1, col = 'red')
coef(m1) # 매개변수(계수) 값을 알려줌
fitted(m1) # 훈련 집합에 있는 샘플에 대한 예측값 
residuals(m1) # 잔차를 알려줌
deviance(m1)/length(x1) #진차 제곱합을 평균 제곱 오차로 변환하여 출력

# p.236
nx1 <- data.frame(x1 = c(1.2, 2.0, 20.65))
nx1
predict(m1, newdata = nx1)

# p.237
X = c(10.0, 12.0, 9.5, 22.2, 8.0)
Y = c(360.2, 420.0, 359.5, 679.0, 315.3)
m2 = lm(Y ~ X)
m2 # y = 25.59x + 110.97
coef(m2)
residuals(m2)
deviance(m2)
deviance(m2)/length(X)
newx = data.frame(x = c(10.5, 25.0, 15.0))
predict(m2, newdata = newx)

plot(X, Y)
abline(m2, col = 'red')

# p.238
str(cars)
head(cars)
plot(cars)
car_model = lm(dist~speed, data = cars)
coef(car_model)
abline(car_model, col = 'red')
fitted(car_model)
View(cars)
residuals(car_model)
nx1 <- data.frame(speed = c(30))
predict(car_model, nx1)

# p.241
nx2 = data.frame(speed = c(25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0))
predict(car_model, nx2)
plot(nx2$speed, predict(car_model, nx2), col = 'red', cex = 1.5, pch = 20)
abline(car_model) 

# p.242
plot(cars)
x = seq(0, 25, length.out = 200)
x
m1 = lm(dist ~ speed, data=cars)
predict(m1, data.frame(speed = x))

for(i in 1:4) {
  m = lm(dist ~ poly(speed, i), data = cars)
  assign(paste('m', i, sep = '.'), m)
  lines(x, predict(m, data.frame(speed = x)), col = i)
}

anova(m.1, m.1, m.3, m.4)

# p.245
women
wm = lm(weight ~ height, data = women)
coef(wm)
plot(women)
abline(wm, col = 'red')
summary(wm)

# p.246 연습문제 - 1 
str(women)
w = rbind(women, c(65.5, 121))
m=lm(weight~height, data=w)
plot(w)
abline(m, col = 'red')
summary(m)

# p.246 연습문제 - 2
cars1 <- cars[-c(20, 22, 23), ]
View(cars1)
m3 <- lm(dist~speed, data = cars1)
plot(cars1)
abline(m3, col = "blue")
summary(m3)






















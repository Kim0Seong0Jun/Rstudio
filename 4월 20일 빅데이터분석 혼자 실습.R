getwd()
setwd("F:/bigdate")

library(gapminder)
library(dplyr)
glimpse(gapminder)
View(gapminder)

# gapminder의 세부적인 부분 보기
gapminder[, c("country", "lifeExp")]
gapminder[, c("country", "lifeExp", "year")] 

# gapminder의 1부터 15까지 보기
gapminder[1:15, ]
gapminder[gapminder$country == "Korea, Rep.", c("lifeExp", "pop", 
                                                "year")]
gapminder[gapminder$country == "Korea, Rep." & gapminder$year>2000, 
          c("lifeExp", "pop", "year")]

apply(gapminder[gapminder$country == 
                  "Korea, Rep.", c("lifeExp", "pop",)], 2, mean)


# P.155 연습문제 1번 근데 이거 보류..
apply(gapminder[gapminder$country == "Korea, Rep.", c("pop")]
      , 2, mean)


# P.155 연습문제 2번
apply(gapminder[gapminder$continent == "Asia"&gapminder$year == 2007, 
                c("pop")], 2, sum)

?gapminder

# dplyr를 이용해서 데이터 가공하기
select(gapminder, country, year, lifeExp)
filter(gapminder, country == "Korea, Rep.") # 이런식으로 명령어가 간결해진다.

summarize(gapminder, pop_avg = mean(lifeExp))

summarize(group_by(gapminder, continent), pop_avg = mean(pop))
summarize(group_by(gapminder, continent, country), pop_avg = mean(pop))

gapminder %>% group_by(continent, country) %>% 
  summarize(pop_avg = mean(pop))

gapminder %>% group_by("Korea, Rep.") %>% 
  summarize(pop_avg = mean(pop))

gapminder %>% filter(country == "Korea, Rep.") %>% 
  select(country, year, lifeExp) %>% 
  summarize(lifeExp_avg = mean(lifeExp))

# group_by는 대분류들을 2개 이상 묶을때 사용을 하는것이다.
# filter는 한가지를 세부적으로 필터를 할때 사용하는 것이다. 

# P.160 연습문제 1번
  select(country, gdpPercap, lifeExp, year)
gapminder %>% filter(country == "Korea, Rep.") %>%

gapminder %>% filter(country == "China") %>%
  select(country, gdpPercap, lifeExp, year)

gapminder %>% filter(country == "Japan") %>%
  select(country, gdpPercap, lifeExp, year)

# P.160 연습문제 2번
Q1 <-gapminder %>% filter(continent == "Africa") %>%
  group_by(year) %>% summarize(s=sum(pop))
Q2 <-gapminder %>% filter(continent == "Europe") %>%
  group_by(year) %>% summarize(s=sum(pop))

Q1
Q2

Q1[Q1$s > Q2$s, "year"]



















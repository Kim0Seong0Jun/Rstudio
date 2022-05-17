# 여기서 if, for, while 문들은 기존 함수를 계산하는것이라 
# 데이터를 넣을수 없다.
# R언어에서는 같다 라는 말을 할땐 ==을 사용한다.
# R언어 사용할때는 = 대신에 <- 이걸 사용할것.
# head는 앞에서부터 6개 불러오는 것
# tail은 뒤에서부터 6개 불러오는 것
# ex) tail(x, 3) 하면 뒤에 3개를 불러오는 것 
# a1 <- setdiff(x, y) # x에 대해서 차집합
# setdiff(y, x) # y에 대해서 차집합
# matrix는 행과열 즉 계란한판으로 생각 가로*세로
# 

print("hello world")
str(iris) 

library(ggplot2)
install.packages("dplyr")
install.packages("ggplot2")

library(ggplot2)
library(dplyr)

install.packages("ggplot2")

getwd()

blood.type <- c("A", "B", "O", "AB")
blood.type

initiall_value <- 1
initiall_value

blood.type = factor(c('A', 'B','O', 'AB'))
blood.type
T
F

str = "Hello, world!"
str

x = 1
x

is.integer(1L)

5^2 
5^9

5 >= 10

1:7
7:1

vector(length=100)

c(1:5)
x <- 1:10
x
head(x, 1100)

?tail
tail(x, 3)

head(x)
tail(iris)

x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)
a1 <- union(x,y)
a1 <- union(x,y)
union(x,y)
intersect(x, y)

a2 <- intersect(x, y)
setequal(x, z)

x <- 1:12
x

matrix(x, nrow = 4, byrow=T) 

y <- matrix(1:15, 1:15)
y <- matrix(1:5) 
y <- 1:5
matrix(y, nrow = 5, byrow=T)

v1 <- c(1, 2, 3, 4)
v2 <- c(5,6,7,8)
v3 <- c(9,10,11,12)
b1 <- cbind(v1, v2, v3)
b1
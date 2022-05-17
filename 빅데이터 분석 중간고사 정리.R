# 빅데이터 분석 3장부터 정리.

# 86페이지 벡터
1:7 # 1부터 7까지 1씩증가시켜서 7개인 벡터
7:1 # 7부터 1까지 1씩 감소 시켜서 7개인 벡터
vector(length = 10) # 요소가 n개인 빈 벡터 생성

# 87페이지 : c함수 - 일반 벡터 생성
c(1:5) # 1~5 요소로 구성된 벡터 생성.
c(1, 2, 3, c(4:6)) # 1~3 요소와 4~6  요소를 결합한 요소로 벡터 생성
x <- c(1, 2, 3) # 1~3 요소로 구성된 벡터를 x에 저장
x

y = c()
y = c(y, c(1:3)) #기존 y벡터에 c(1:3) 벡터를 추가해 생성
y

seq(from = 1, to = 10, by = 2) # seq함수 1부터 10까지 2씩 증가
seq(1, 10, by = 2) # 위와 같지만 간단하게 적는 방법임

seq(0, 1, 0.01) 
seq(0, 1, length.out = 11) # 0부터 1까지 요소가 11개인 벡터 생성

rep(c(1:3), times = 2) # (1, 2, 3) 벡터를 2번 반복한 벡터 생성
rep(c(1:3), each = 2) #(1, 2, 3) 벡터의 개별 요소를 2번 반복한 벡터 생성

# 88페이지 - 벡터 연산
x = c(2, 4, 6, 8, 10)
length(x) # x 벡터의 길이(크기)를 구함
x[1] # x 벡터의 1번 요소 값을 구함
x[c(1, 2, 3)] # x벡터의 1,2,3번 요소를 구할 때는 벡터로 묶어야 한다.
x[-c(1, 2, 3)] # x벡터에서 1,2,3번 요소를 제외한 값 출력
x[c(1:3)] # x 벡터에서 1번부터 3번 요소를 출력
# 벡터끼리 연산 수행
a <- c(1, 2, 3, 4)
b <- c(5, 6, 7, 8)
c <- c(3, 4)
d <- c(5, 6, 7)

a + 2 # a 벡터의 개별 요소에 2를 각각 더함
a + b # a 벡터와 b 벡터의 크기가 동일하므로 각 요소별로 더함
a + c # a 벡터가 c 벡터 크기의 정수배인 경우엔 작은 쪽 벡터 요소를 순환하며 더함
a + d # a 와 d의 크기가 정수배가 아니므로 연산 오류가 난다.

# 89페이지 - 벡터 연산에 유용한 함수
x <- 1:10
x > 5 # x 벡터의 요소 값이 5보다 큰지 확인
all(x>5) # x 벡터의 요소 값이 모두 5보다 큰지 확인
any(x>5) # x벡터의 요소 값 중 일부가 5보다 큰지 확인

# 89페이지 - head, tail함수 (데이터 앞, 뒤 일부 요소 추출)
head(x) # 데이터의 앞 6개 요소를 추출 
tail(x) # 데이터의 뒤 6개 요소를 추출
head(x, 3) # 데이터의 앞 3개 요소를 추출 
tail(x, 3) # 데이터의 뒤 3개 요소를 추출 

# 90페이지 - union, intersect, setdiff, setequal 함수.
x = c(1, 2, 3)
y = c(3, 4, 5)
z = c(3, 1, 2)

union(x, y) # 합집합
intersect(x, y) # 교집합
setdiff(x, y) # 차집합(x에서 y와 동일한 요소 제외)
setdiff(y, x) # 차집합(y에서 x와 동일한 요소 제외)
setequal(x ,y) # x와 y가 동일한지 비교
setequal(x, z) # x와 z가 동일한지 비교

# 90페이지 연습문제
x <- c(1:5,c(6:10)) # 연습문제 1번
x[-c(1, 3, 5, 7, 9)] # 연습문제 2번

# 91페이지 
x = array(1:5, c(2, 4)) # 1~5 값을 2x4 행렬에 할당 
x 
x[1, ] # 1행 요소 값 출력
x[, 2] # 2열 요소 값 출력

# 92페이지 
dimnamex = list(c("1st", "2nd"), c("1st", "2nd", "3rd", "4th")) # 행과 열 이름 설정
x = array(1:5, c(2,4), dimnames = dimnamex)
x         
x["1st", ]
x[, "2nd"]

#2차원 배열 생성 (matrix)
x <- 1:12

matrix(x, nrow = 3) # x는 행렬로 구성할 벡터,nrow는 행과 열 수중 하나 결정
matrix(x, nrow = 3, byrow = T) # byrow는 데이터를 행 단위로 배치할지 여부

# 93페이지 (벡터를 묶어 배열 생성)
v1 = c(1:4)
v2 = c(5:8)
v3 = c(9:12)

cbind(v1, v2, v3) # 열 단위로 묶어 배열 생성 ( 세로 )
rbind(v1, v2, v3) # 행 단위로 묶어 배열 생성 ( 가로 )

x = array(1:4, dim = c(2,2))
y = array(5:8, dim = c(2,2))

x + y # 각 자리마다 다 더해버림
x - y # 각 자리마다 다 빼버림
x * y # 각 열별 곱셈
x %*% y # 수학적인 행렬 곱셈(?) -> 이해안됨 
t(x) # x의 전치 행렬


# 95페이지( 배열에 유용한 함수)
# apply 함수 ( 이거 뒤에서도 함 )
x = array(1:12, c(3,4))
x
apply(x, 1, mean) # 가운데 값이 1이면 함수를 행별로 적용
apply(x, 2, mean) # 가운데 값이 2이면 함수를 열별로 적용

#dim 함수 : 배열의 크기(차원의 수)
dim(x) # 3x4함수인데 그 배열의 크기를 알려줌

#sample 함수 : 벡터나 배열에서 샘플 추출
x = array(1:12, c(3,4))
sample(x) # 배열 요소를 임의로 섞어 추출
sample(x, 10) #배열 요소 중 10개를 골라 추출
sample(x, 10, prob = c(1:12)/24) #각 요소별 추출 확률을 달리 할수 있다.
sample(100) # 단순히 숫자만 사용하여 샘플을 만들 수 있음

# 95페이지 연습문제 1번
?Titanic
str(Titanic)
head(Titanic)
apply(Titanic, c(3, 4), sum)
apply(Titanic, c(2, 4), sum)
apply(Titanic, c(1, 4, 3, 2), sum)

# 95페이지 연습문제 2번
# 첫번째 풀이 방법
x = array(1:24, c(4,6))
x 

x1 = dim(x)
x1

x = x[, seq(1, dim(x)[2], 2)]
x

# 두번째 풀이 방법
v1 = c(1, 2, 3, 4)
v2 = c(9, 10, 11, 12)
v3 = c(17, 18, 19, 20)
cbind(v1, v2, v3)

# 97페이지 - 데이터 프레임 생성
name = c("아이폰", "아이패드", "맥북")
age = c(2, 1, 7)
gender = factor(c("M", "F", "M"))
blood.type = factor(c("A", "O", "B"))
# 데이터 프레임 생성하기
patinets = data.frame(name, age, gender, blood.type)
patinets
# 데이터 프레임 같이 한 행으로 작성 할수 있음
A1 = data.frame(name = c("철수", "춘향", "길동"), age = c(22, 20, 25), 
                gender = factor(c("M", "F", "M")), blood.type = factor(c(
                  "A", "B", "O" )))
A1

# 98페이지 - 데이터 프레임 요소에 접근
patinets$name # name 속성 값 출력
patinets[1, ] # 1행 값 출력
patinets[, 2] # 2열 값 출력
patinets[3, 1] # 3행 1열 값 출력
patinets[patinets$name=="아이패드", ] # 이름중 아이패드의 값을 불러옴
patinets[patinets$name=="아이패드", c("name", "age")] # 아이패드 이름과 나이 정보만 추출

# 99페이지 - 데이터 프레임에 유용한 함수
head(cars)
attach(cars) # attach 함수를 통해 cars의 각 속성을 변수로 이용하게 함
speed # speed라는 변수명을 직접 이용할 수 있음
detach(cars) # detach 함수를 통해 cars의 각 속성을 변수로 사용하는 것을 해제함

# 100 페이지 - with함수 - 데이터 프레임에 다양한 함수 적용
mean(cars$speed) # 데이터 속성을 이용해 함수 적용
max(cars$speed) 

with(cars, mean(speed)) # with 함수를 이용해서 함수 적용
with(cars, max(speed))

# subset 함수 - 데이터 프레임에서 일부 데이터만 추출
subset(cars, speed > 20) # 속도가 20 초과인 데이터만 추출
# 속도가 20 초과인 dist 데이터만 추출, 여러 열 선택은 c()안을 , 구분
subset(cars, speed > 20, select = c(dist))
subset(cars, speed > 20, select = -c(dist)) # dist를 제외한 데이터만 추출

# 101페이지 - na.omit 함수 (데이터 프레임의 결측값 제거)
head(airquality)
head(na.omit(airquality)) # 데이터 결측값 제거 (NA값 제거)

# 102페이지 merge 부터 하면됨 미래의 나 화이팅 ^^..



























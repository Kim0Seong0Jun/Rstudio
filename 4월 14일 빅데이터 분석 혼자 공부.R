# 혼자 연습 부분임 
# 시발 존ㄴ ㅏ오렵네 
f1 <- function(x) {
  if (x == 1) {
    return(1)
  } else if (x > 1){
    return (x * f1(x-1))
  }
}

f1(3)
i = 1
repeat {
  if (i > 10) {
    break
  } else {
    print(i)
    i = i+1
  }
}

i = 5
while(i<=200) {
  print(i)
  i = i*5
}

a = 1
while(a <= 10) {
  print(a)
  a = a+1
}

# 구구단 만들기
i = 1
while(i<10) {
  print(paste(3, "X", i, "=", 3*i))
  i=i+1
}

#for 문으로 1부터 10까지 수 증가
for (i in 1:20) {
  print(i)
}

#for 문으로 구구단 만들기
for (i in 1:9) {
  print(paste(13, "X", i, "=", 13*i))
}

for(i in 2:9) {
  for(j in 1:9){
    print(paste(i, "X", j, "=", i*j))
  }
}

# 1부터 10까지의 수 중 짝수만 출력하기
for(i in 1:10) {
  if(i%%2==0) {
    print(i)
  }
}

for(i in 1:100) {
  check = 0
  for(j in 1:i) {
    if(i%%j ==0) {
      check = check+1
    }
  }
  if(check ==2) {
    print(i)
  }
}

# p.131 연습문제 풀이
# 연습문제 1번
total = 0
for (i in c(1:10)) {
  if(i%%2==0)
  total = total+i
}
total

# 연습문제 2번
for (i in 1:10) {
  if(i%%2==1)
    print(i)
}

# 연습문제 3번

for(i in 1:10) {
  check = 0
  for(j in 1:i) {
    if(i%%j ==0) {
      check = check+1
    }
  }
  if(check ==2) {
    print(i)
  }
}

# 팩토리얼 함수
d1 = function(x){
  fa = 1
  while(x>1) {
    fa = fa*x
    x = x-1
  }
  return(fa)
}
d1(3)

b <- function(x) {
  table(is.na(x))
}


b(airquality) 

table(is.na(airquality))

b1 <- function(x) {
  if (x == 1)
    return(1)
  else if (x > 1){
    return(x * b1(x-1))
  }
}
b1(3)

f1 <- function(i) {
  inc = 0
  for (j in 1:i) {
    if (i %% j == 0) {
      inc = inc + 1
    }
  }
  if (inc== 2) {
    return("소수")
  } else {
    return("소수 아님")
  }
}

f1(3)
f1(9)
























#factorial of a number

num <- readline(prompt = "Enter a number to find the factorial ")
num <- as.integer(num)

fact <- 1

while(num>=1){
  fact<-fact*num
  num<-num-1
}
print(fact)
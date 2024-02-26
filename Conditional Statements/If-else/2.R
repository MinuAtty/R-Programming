marks <- readline(prompt = "Enter your marks ")
marks <- as.integer(marks)

if(marks>=75){
  print("A")
}else if(marks>=65){
  print("B")
}else if(marks>=55){
  print("C")
}else if(marks>=40){
  print("S")
}else{
  print("F")
}

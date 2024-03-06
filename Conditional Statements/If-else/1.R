marks <- readline(prompt = "Enter your marks ")
marks <- as.integer(marks)

if(marks>=40){
  print("You Passed the module")
}else{
  print("You Failed the module")
}

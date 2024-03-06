dataset <- mtcars

View(dataset)

x <- mtcars$wt
y <- mtcars$mpg

plot(x,y, main = "Main title",
     xlab = "Weight", ylab = "Mpg",
     pch = 20)

abline(lm(y ~x, data = mtcars), col = "blue")

lines(lowess(x, y), col = "red")

#Create a density plot for mpg with a blue line
plot(density(mtcars$wt), col = "blue", main = "Density Plots")

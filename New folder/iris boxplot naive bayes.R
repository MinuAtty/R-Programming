install.packages("rpart")
library(ggplot2)
library(e1071) 
library(caret) 
library(caTools) 
library(rpart.plot)
library(tidyverse)
library(skimr)
library(cluster)

data("iris")
iris
summary(iris)
View(iris)
head(iris)
tail(iris)
?iris

# Scatter plot
plot(iris) 

plot(iris$Species) 
plot(iris$Petal.Length) 
plot(iris$Species, iris$Petal.Width) 
plot(iris$Petal.Length, iris$Petal.Width) 
plot(iris) 

plot(iris$Petal.Length, iris$Petal.Width,
     col = "red",
     pch = 19,       
     main = "Iris: Petal Length vs. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width")

plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

plot(dnorm, -3, +3,
     col = "blue",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-scores",
     ylab = "probability density function")

# Boxplot
boxplot(iris$Species)
boxplot(iris$Species,
        main = "Iris Plant",
        xlab = "Length & Width",
        ylab = "Species",
        col = "red",
        border = "black",
        horizontal = TRUE,
        notch = TRUE
)
boxplot(Sepal.Length ~ Petal.Length,
        data = iris,
        main = "Different boxplots for each Petal.Length",
        xlab = "Length",
        ylab = "Sepal.Length",
        col = "brown",
        border = "black"
)

# Histogram
#Sepal Length
ggplot(data=iris,aes(x=iris$Sepal.Length))+ 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Sepal Length")+
  ylab("Frequency")+
  ggtitle("Sepal Length Distribution")

#Sepal Width
ggplot(data=iris,aes(x=iris$Sepal.Width))+ 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Sepal Width")+
  ylab("Frequency")+
  ggtitle("Sepal Width Distribution")                 

#Petal Length
ggplot(data=iris,aes(x=iris$Petal.Length))+ 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Petal Length")+
  ylab("Frequency")+
  ggtitle("Petal Length Distribution")

#Petal Width
ggplot(data=iris,aes(x=iris$Petal.Width))+ 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Petal Width")+
  ylab("Frequency")+
  ggtitle("Petal Width Distribution")

# Naive Bayes
split_ratio <- sample.split(iris,SplitRatio = 0.75)

training_dataset <- subset(iris,split_ratio=="TRUE")
dim(training_dataset)

testing_dataset <- subset(iris,split_ratio=="FALSE")
dim(testing_dataset)

summary(testing_dataset)

training_dataset1 <- scale(training_dataset[,1:4])
testing_dataset1  <- scale(testing_dataset[,1:4])

set.seed(100)
model <- naiveBayes(Species~., data = training_dataset)

summary(testing_dataset)
predicted_results <- predict(model,newdata = testing_dataset)
table(predicted_results)

matrix <- table(testing_dataset$Species,predicted_results)
confusionMatrix(matrix)

# Decision Tree
skim_to_wide(iris)

splitt <- createDataPartition(y= iris$Species, p = 0.75, list = FALSE)
train <- iris[splitt, ]
test <- iris[-splitt, ]

dim(train)
dim(test)

set.seed(100)

dec_tree <- rpart(formula = Species ~.,
                  data = train,
                  method = "class",
                  xval = 10
)

rpart.plot(dec_tree, yesno = TRUE)

# Clustering
#Sepal Distribution
ggplot(data, aes(Sepal.Length,Sepal.Width))+geom_point(aes(col=Species),size=3)

#Petal Distribution
ggplot(data, aes(Petal.Length,Petal.Width))+geom_point(aes(col=Species),size=3)

set.seed(150)
cluster_results <- kmeans(data[,1:4], centers = 3, nstart = 25) #centers = 3 means, we get 3 flowers
cluster_results

table(cluster_results$cluster, data$Species)
clusplot(iris, cluster_results$cluster, color = T, shade = T, labels = 0, lines = 0)



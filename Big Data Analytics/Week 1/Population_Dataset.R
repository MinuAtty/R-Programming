# Time Series Analysis

# Loading to project
library(ggplot2) # for graphs
library(forecast) # model to predict future

# Loading the dataset
data2 <- read.csv("C://Users//Minusha Attygala//Downloads//Week 1//Population_Dataset.csv")

str(data2)

# Data pre processing Date variable to date format
data2$Date <- as.Date(data2$Date)

# Creating the time series
Popu_t_s <- ts(data2$Population, start = c(2005,1),frequency = 12)

# Plot the time series
plot(Popu_t_s, 
     main = "Population Time Series",
     xlab ="Year", 
     ylab="Population", 
     col= "darkblue")

# Future predictions
model <- auto.arima(Popu_t_s)
predict <- forecast(model, h = 24)
plot(predict)

# Time Series Analysis

# Loading to project
library(ggplot2) # for graphs
library(forecast) # model to predict future

# Loading the dataset
data3 <- read.csv("C://Users//Minusha Attygala//Downloads//Week 1//Rice_Prices_Dataset.csv")

str(data3)

# Data pre processing Date variable to date format
data3$Date <- as.Date(data3$Date)

# Creating the time series
Rice_Prices_t_s <- ts(data3$Rice_Prices, start = c(2005,1),frequency = 12)

# Plot the time series
plot(Rice_Prices_t_s, 
     main = "Rice Prices Time Series",
     xlab ="Year", 
     ylab="Rice Prices", 
     col= "darkblue")

# Future predictions
model <- auto.arima(Rice_Prices_t_s)
predict <- forecast(model, h = 24)
plot(predict)

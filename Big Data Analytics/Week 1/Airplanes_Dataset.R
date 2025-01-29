# Loading to project
library(ggplot2) # for graphs
library(forecast) # model to predict future

# Loading the dataset
data1 <- read.csv("C://Users//Minusha Attygala//Downloads//Week 1//Airplanes_Dataset.csv")

str(data1)

# Data pre processing Date variable to date format
data1$Date <- as.Date(data1$Date)

# Creating the time series
Airplane_t_s <- ts(data1$Airplanes, start = c(2005,1),frequency = 12)

# Plot the time series
plot(Airplane_t_s, 
     main = "Airplanes Time Series",
     xlab ="Year", 
     ylab="Airplanes", 
     col= "darkblue")

# Future predictions
model <- auto.arima(Airplane_t_s)
predict <- forecast(model, h = 24)
plot(predict)
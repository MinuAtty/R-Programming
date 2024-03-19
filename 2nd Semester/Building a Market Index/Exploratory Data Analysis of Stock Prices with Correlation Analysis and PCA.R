# For data visualization
library('ggplot2')

# Read the stock prices data from a CSV file into a dataframe 'prices'
prices <- read.csv(file.path("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\2nd Semester\\Building a Market Index\\stock_prices.csv"), stringsAsFactors = FALSE)

# Display the first row of the dataframe 'prices'
prices[1,]

# For handling dates
library('lubridate')

# Convert the 'Date' column in 'prices' dataframe to Date format using ymd() function from lubridate
prices <- transform(prices, Date = ymd(Date))

# Display the first six rows of the transformed 'prices' dataframe
head(prices)

# For data manipulation
library('reshape')

# Reshape the 'prices' dataframe into a matrix where rows represent dates and columns represent stocks, with 'Close' prices as values
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close')

# Display the first six rows of the reshaped matrix
head(date.stock.matrix)

# Display the dimensions of the reshaped matrix
dim(date.stock.matrix)

# Print a summary of the reshaped matrix
summary(date.stock.matrix)

# CAST includes functions to improve spatial or spatial-temporal modelling tasks using 'caret'
library(CAST)

# Subset the 'prices' dataframe to remove rows with Date '2002-02-01' and Stock 'DDR'
prices <- subset(prices, Date != ymd('2002-02-01'))
prices <- subset(prices, Stock != 'DDR')

# Reshape the subsetted 'prices' dataframe into a matrix similar to before
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close')

# Calculate the correlation matrix of the stock prices
cor.matrix <- cor(date.stock.matrix[, 2:ncol(date.stock.matrix)])

# Convert the correlation matrix into a vector of correlations
correlations <- as.numeric(cor.matrix)

# Create a density plot of the correlations
ggplot(data.frame(Correlation = correlations), aes(x = Correlation, fill = 1)) + 
  geom_density() +  
  theme(legend.position = 'none')

# Perform Principal Component Analysis (PCA) on the stock prices matrix
pca <- princomp(date.stock.matrix[, 2:ncol(date.stock.matrix)])

# Display the results of PCA
pca 

# Display the first six rows of the PCA results
head(pca)

# Extract the loadings (coefficients) of the first principal component
principal.component <- pca$loadings[, 1]

# Convert the loadings into a numeric vector
loadings <- as.numeric(principal.component)

# Create a density plot of the loadings
ggplot(data.frame(Loading = loadings), aes(x = Loading, fill = 1)) + 
  geom_density() +  
  theme(legend.position = 'none')

# Predict the first principal component scores as the market index
market.index <- predict(pca)[, 1]  

# Display the market index values
market.index  

# Read the DJI (Dow Jones Industrial Average) data from a CSV file into a data frame
dji.prices <- read.csv(file.path("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\2nd Semester\\Building a Market Index\\DJI.csv"), stringsAsFactors = FALSE)  

# Convert the 'Date' column in the DJI data frame to a date format using the ymd() function
dji.prices <- transform(dji.prices, Date = ymd(Date))  

# Filter out rows where the Date is before '2002-02-01' in the DJI data
dji.prices <- subset(dji.prices, Date > ymd('2001-12-31')) 
dji.prices <- subset(dji.prices, Date != ymd('2002-02-01')) 

dji <- with(dji.prices, rev(Close))  # Reverse the 'Close' prices of DJI
dates <- with(dji.prices, rev(Date))  # Reverse the dates of DJI

# Create a data frame for comparison with columns: Date, MarketIndex, and DJI
comparison <- data.frame(Date = dates,  
                         MarketIndex = market.index, 
                         DJI = dji)  

# Plot a scatter plot comparing MarketIndex and DJI, with a linear regression line
ggplot(comparison, aes(x = MarketIndex, y = DJI))+  
  geom_point()+ 
  geom_smooth(method ='lm', se = FALSE) 

# Invert the MarketIndex values
comparison <- transform(comparison, MarketIndex = -1 * MarketIndex)  

# Plot a scatter plot comparing inverted MarketIndex and DJI, with a linear regression line
ggplot(comparison, aes(x = MarketIndex, y = DJI))+ 
  geom_point()+  
  geom_smooth(method = 'lm', se = FALSE) 

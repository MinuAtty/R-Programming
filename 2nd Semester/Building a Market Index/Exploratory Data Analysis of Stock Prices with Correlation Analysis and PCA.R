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


# Required libraries for text analysis and visualization
install.packages("tidyverse")
install.packages("tidytext")
install.packages("reshape2")
install.packages("textdata")
install.packages("knitr")
install.packages("tm")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("SnowballC")

# Loading required libraries
library(tidyverse)    # Provides a cohesive framework for data manipulation, visualization, and analysis
library(tidytext)     # An extension of the tidyverse for text mining and analysis
library(reshape2)     # Reshaping data
library(textdata)     # Text mining utilities
library(knitr)        # Provides support for dynamic report generation with R
library(tm)           # Provides functions for text mining
library(ggplot2)      # Data visualization package
library(wordcloud)    # Create word clouds
library(SnowballC)    # Stemming algorithms for text analysis

# Read text data from a file
data <- read_lines("C:\\Users\\Minusha Attygala\\Downloads\\speech.txt")
print(data)

# Create a corpus from the text data
corpus <- Corpus(VectorSource(data))
corpus

# Inspect the corpus (shows basic information about the corpus)
inspect(corpus)

# Data preprocessing:
# Convert all words to lowercase
cleaned_corpus <- tm_map(corpus, content_transformer(tolower))
# Remove all numbers
cleaned_corpus <- tm_map(cleaned_corpus, removeNumbers)
# Remove all punctuations
cleaned_corpus <- tm_map(cleaned_corpus, removePunctuation)
# Remove the word 'the'
cleaned_corpus <- tm_map(cleaned_corpus, removeWords, c("the"))

# Inspect the cleaned corpus
inspect(cleaned_corpus)

# Create a term-document matrix (word frequency index)
wfi <- TermDocumentMatrix(cleaned_corpus)
wfi2 <- as.matrix(wfi)
words <- sort(rowSums(wfi2), decreasing = TRUE)
df <- data.frame(word = names(words), frequency = words)

# Display the top words with their frequencies
head(df)

# Generate a word cloud
set.seed(150)
wordcloud(cleaned_corpus,
          scale = c(6,0.5),
          max.words = 150,
          random.order = FALSE,
          rot.per = 0.2,
          use.r.layout = FALSE,
          colors = brewer.pal(8,"Dark2")
)

# Find terms related to the term "you" and plot them
you <- data.frame(findAssocs(wfi, "you", 0.40))  # Find terms related to "you" with a threshold of 0.40
title <- expression(paste("Words related to 'you'", bold("you")))
you %>% 
  rownames_to_column() %>%   # Add rownames as a column
  ggplot(aes(x = reorder(rowname, you), y = you)) +   # Create ggplot
  geom_point(shape = 15, size = 2)   # Add points to the plot

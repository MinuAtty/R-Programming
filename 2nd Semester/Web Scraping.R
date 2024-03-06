# Required libraries for web scraping
install.packages("rvest")
install.packages("xml2")
library(rvest)   # For web scraping
library(xml2)    # For working with XML and HTML content

# The URL of the website to scrape
web <- "https://kellyfelder.com/"

# Read the HTML content of the webpage
content <- read_html(web)

# Analyze the content:

# Extract all text within <h1> tags
h1_topics <- html_nodes(content, 'h1') %>% html_text()
print(h1_topics)

# Extract text of all hyperlinks (<a> tags)
hyp <- html_nodes(content, 'a') %>% html_text()
print(hyp)

# Extract text of all images (<img> tags)
img <- html_nodes(content, 'img') %>% html_text()
print(img)

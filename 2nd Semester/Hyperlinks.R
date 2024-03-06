# Method 1

# Load necessary libraries
library(rvest)   # For web scraping
library(xml2)    # For working with XML and HTML

# Define the URL of the website to scrape
web <- "https://www.levi.com/US/en_US/"

# Read the HTML content of the webpage
content <- read_html(web)

# Extract all the text from the <a> (anchor) tags on the webpage
hyp <- html_nodes(content, 'a') %>% html_text()

# Print the extracted text
print(hyp)



# Method 2

# Install and load the 'magrittr' package 
install.packages("magrittr")
library(magrittr)    # For piping operations
library(rvest)       # For web scraping

# Re-define the URL of the website to scrape
site <- "https://www.levi.com/US/en_US/"

# Read the HTML content of the webpage
webpage <- read_html(site)

# Extract the 'href' attribute (links) from all the <a> tags on the webpage
links <- webpage %>%
  html_nodes("a") %>%
  html_attr("href")

# Print the extracted links
print(links)

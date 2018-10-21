#libraries.
library(URLencode)
library(rvest)

#load data
d <-read.csv("\Book1.csv")
c <- as.character(d$Company.Name)

# Function for getting website.
getWebsite <- function(name)
{
  url = URLencode(paste0("https://www.google.com/search?q=",name))
  
  page <- read_html(url)
  
  results <- page %>% 
    html_nodes("cite") %>% # Get all notes of type cite. You can change this to grab other node types.
    html_text()
  
  result <- results[1]
  
  return(as.character(result)) # Return results if you want to see them all.
}

# Apply the function to a list of company names.
websites <- data.frame(Website = sapply(c,getWebsite))]
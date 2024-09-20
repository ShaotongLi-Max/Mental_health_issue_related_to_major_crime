# Load necessary libraries
library(dplyr)
library(httr)

# Define the URLs for the datasets
mha_url <- "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/mental-health-apprehensions/resource/4a92540b-6504-4b25-827d-4511b8b9f3d9/download/mental-health-apprehensions.csv"
mci_url <- "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/major-crime-indicators/resource/863bbdfb-a932-48b7-8a59-bf6585ef0563/download/major-crime-indicators.csv"

# Download the datasets
mha_data <- GET(mha_url)
mci_data <- GET(mci_url)

# Check if the download was successful
if (status_code(mha_data) == 200) {
  write.csv(content(mha_data, "text"), 
            "/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mha.csv", 
            row.names = FALSE)
} else {
  stop("Failed to download MHA data")
}

if (status_code(mci_data) == 200) {
  write.csv(content(mci_data, "text"), 
            "/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mci.csv", 
            row.names = FALSE)
} else {
  stop("Failed to download MCI data")
}

# Print a message indicating that the data has been downloaded
cat("Data downloaded successfully and saved to the specified locations.\n")

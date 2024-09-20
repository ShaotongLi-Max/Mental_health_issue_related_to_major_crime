# Load necessary libraries
library(dplyr)

# Read in the raw data
mha_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mha.csv")
mci_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mci.csv")

# Summarize the number of MHA reports by district (using DIVISION as district)
mha_summary <- mha_data %>%
  group_by(DIVISION) %>%
  summarise(num_mha_reports = n())

# Summarize the number of crimes by district (using DIVISION as district)
mci_summary <- mci_data %>%
  group_by(DIVISION) %>%
  summarise(num_crimes = n())

# Merge the two summaries by District (DIVISION)
clean_data <- merge(mci_summary, mha_summary, by = "DIVISION", all = TRUE)

# Save the cleaned data to a CSV file
write.csv(clean_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv", row.names = FALSE)

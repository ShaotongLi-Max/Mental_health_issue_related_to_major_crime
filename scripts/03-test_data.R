# Load necessary libraries
library(dplyr)

# Read in the cleaned data
clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")

# Basic structure and summary of the data
cat("Structure of the cleaned data:\n")
str(clean_data)

cat("\nSummary of the cleaned data:\n")
summary(clean_data)

# Check for missing values
cat("\nChecking for missing values:\n")
missing_values <- sum(is.na(clean_data))
cat("Total missing values:", missing_values, "\n")

# Check unique districts
cat("\nUnique districts in the dataset:\n")
unique_districts <- unique(clean_data$DIVISION)
print(unique_districts)

# Basic statistics
cat("\nBasic statistics for number of crimes and MHA reports:\n")
crime_stats <- clean_data %>%
  summarise(
    avg_crimes = mean(num_crimes, na.rm = TRUE),
    median_crimes = median(num_crimes, na.rm = TRUE),
    sd_crimes = sd(num_crimes, na.rm = TRUE),
    avg_mha_reports = mean(num_mha_reports, na.rm = TRUE),
    median_mha_reports = median(num_mha_reports, na.rm = TRUE),
    sd_mha_reports = sd(num_mha_reports, na.rm = TRUE)
  )
print(crime_stats)

# Visualize the data (optional, requires ggplot2)
library(ggplot2)

# Plot the number of crimes and MHA reports by district
ggplot(clean_data, aes(x = reorder(DIVISION, -num_crimes), y = num_crimes)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Number of Crimes by District",
       x = "District",
       y = "Number of Crimes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(clean_data, aes(x = reorder(DIVISION, -num_mha_reports), y = num_mha_reports)) +
  geom_bar(stat = "identity", fill = "salmon") +
  labs(title = "Number of MHA Reports by District",
       x = "District",
       y = "Number of MHA Reports") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print a message indicating that the tests are complete
cat("\nData testing complete. Check the output above for details.\n")


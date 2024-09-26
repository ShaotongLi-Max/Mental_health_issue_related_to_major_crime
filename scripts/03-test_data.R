library(dplyr)

clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")

cat("Structure of the cleaned data:\n")
str(clean_data)

cat("\nSummary of the cleaned data:\n")
summary(clean_data)

cat("\nChecking for missing values:\n")
missing_values <- sum(is.na(clean_data))
cat("Total missing values:", missing_values, "\n")

cat("\nUnique districts in the dataset:\n")
unique_districts <- unique(clean_data$DIVISION)
print(unique_districts)

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

library("ggplot2")
model <- lm(num_crimes ~ num_mha_reports, data = clean_data)
clean_data$predicted_crimes <- predict(model, newdata = clean_data)
ggplot(clean_data, aes(x = num_mha_reports, y = num_crimes)) +
  geom_point(color = "#A9CCE3") +  
  geom_line(aes(y = predicted_crimes), color = "#F1948A") + 
  labs(title = "Number of Crimes vs. Number of MHA Reports",
       x = "Number of MHA Reports",
       y = "Number of Crimes") +
  theme_minimal()

cat("\nData testing complete. Check the output above for details.\n")


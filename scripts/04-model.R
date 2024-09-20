# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read in the cleaned data
clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")

# Fit a linear regression model
model <- lm(num_crimes ~ num_mha_reports, data = clean_data)

# Summary of the model
cat("Model Summary:\n")
summary(model)

# Check residuals
par(mfrow = c(2, 2))
plot(model)

# Predicting number of crimes based on MHA reports
clean_data$predicted_crimes <- predict(model, newdata = clean_data)

# Visualizing the relationship
ggplot(clean_data, aes(x = num_mha_reports, y = num_crimes)) +
  geom_point(color = "blue") +
  geom_line(aes(y = predicted_crimes), color = "red") +
  labs(title = "Number of Crimes vs. Number of MHA Reports",
       x = "Number of MHA Reports",
       y = "Number of Crimes") +
  theme_minimal()

# Create directory for model if it doesn't exist
if (!dir.exists("/home/rstudio/STA304_Paper_1_MaxLI/model/")) {
  dir.create("/home/rstudio/STA304_Paper_1_MaxLI/model/", recursive = TRUE)
}

# Save the model as an RDS file
saveRDS(model, "/home/rstudio/STA304_Paper_1_MaxLI/model/crime_model.rds")

# Save the model summary to a text file
sink("/home/rstudio/STA304_Paper_1_MaxLI/model/model_summary.txt")
summary(model)
sink()

# Print a message indicating that the modeling is complete
cat("\nModeling complete. Check the output above for details.\n")

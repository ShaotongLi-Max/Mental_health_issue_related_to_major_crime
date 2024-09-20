# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read in the cleaned data
clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")

# Load the saved model
model <- readRDS("/home/rstudio/STA304_Paper_1_MaxLI/model/crime_model.rds")

# Generate predictions using the loaded model and round them to the nearest integer
clean_data$predicted_crimes <- round(predict(model, newdata = clean_data))

# Check the first few rows of the data with predictions
cat("First few rows of the cleaned data with predictions:\n")
head(clean_data)

# Visualizing the predicted vs actual number of crimes
ggplot(clean_data, aes(x = num_mha_reports)) +
  geom_point(aes(y = num_crimes), color = "blue", alpha = 0.6, size = 2) +
  geom_line(aes(y = predicted_crimes), color = "red") +
  labs(title = "Actual vs Predicted Number of Crimes",
       x = "Number of MHA Reports",
       y = "Number of Crimes") +
  theme_minimal()

# Calculate residuals
clean_data$residuals <- clean_data$num_crimes - clean_data$predicted_crimes

# Summary of residuals
cat("\nSummary of residuals:\n")
summary(clean_data$residuals)

# Create directory for replication results if it doesn't exist
if (!dir.exists("/home/rstudio/STA304_Paper_1_MaxLI/data/replication/")) {
  dir.create("/home/rstudio/STA304_Paper_1_MaxLI/data/replication/", recursive = TRUE)
}

# Save the results with predictions to a CSV file
write.csv(clean_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/replication/clean_data_with_predictions.csv", row.names = FALSE)

# Print a message indicating that the replication is complete
cat("\nReplication complete. Check the output above for details.\n")


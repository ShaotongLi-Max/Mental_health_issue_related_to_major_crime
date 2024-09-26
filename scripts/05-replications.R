library(dplyr)
library(ggplot2)

clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")
model <- readRDS("/home/rstudio/STA304_Paper_1_MaxLI/model/crime_model.rds")
clean_data$predicted_crimes <- round(predict(model, newdata = clean_data))

cat("First few rows of the cleaned data with predictions:\n")
head(clean_data)

clean_data$residuals <- clean_data$num_crimes - clean_data$predicted_crimes

cat("\nSummary of residuals:\n")
summary(clean_data$residuals)

if (!dir.exists("/home/rstudio/STA304_Paper_1_MaxLI/data/replication/")) {
  dir.create("/home/rstudio/STA304_Paper_1_MaxLI/data/replication/", recursive = TRUE)
}

write.csv(clean_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/replication/clean_data_with_predictions.csv", row.names = FALSE)

cat("\nReplication complete. Check the output above for details.\n")


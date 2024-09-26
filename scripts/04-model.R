library(dplyr)
library(ggplot2)

clean_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv")

model <- lm(num_crimes ~ num_mha_reports, data = clean_data)

cat("Model Summary:\n")
summary(model)

par(mfrow = c(2, 2))
plot(model)

clean_data$predicted_crimes <- predict(model, newdata = clean_data)

if (!dir.exists("/home/rstudio/STA304_Paper_1_MaxLI/model/")) {
  dir.create("/home/rstudio/STA304_Paper_1_MaxLI/model/", recursive = TRUE)
}

saveRDS(model, "/home/rstudio/STA304_Paper_1_MaxLI/model/crime_model.rds")

sink("/home/rstudio/STA304_Paper_1_MaxLI/model/model_summary.txt")
summary(model)
sink()

cat("\nModeling complete. Check the output above for details.\n")

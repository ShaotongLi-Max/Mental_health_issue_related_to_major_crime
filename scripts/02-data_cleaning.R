library(dplyr)

mha_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mha.csv")
mci_data <- read.csv("/home/rstudio/STA304_Paper_1_MaxLI/data/raw_data/raw_data_mci.csv")

mha_summary <- mha_data %>%
  group_by(DIVISION) %>%
  summarise(num_mha_reports = n())

mci_summary <- mci_data %>%
  group_by(DIVISION) %>%
  summarise(num_crimes = n())

clean_data <- merge(mci_summary, mha_summary, by = "DIVISION", all = TRUE)

write.csv(clean_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/analysis_data/clean_data.csv", row.names = FALSE)

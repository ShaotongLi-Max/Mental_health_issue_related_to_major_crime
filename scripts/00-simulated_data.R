library(dplyr)
set.seed(123)

districts <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33", "D41", 
               "D42", "D43", "D51", "D52", "D53", "D54", "D55", "NSA")

num_mha_reports <- sample(1000:15000, length(districts), replace = TRUE)

intercept <- 6748.2438
slope <- 2.4509

num_crimes <- intercept + slope * num_mha_reports

residual_std_error <- 4835
num_crimes <- num_crimes + rnorm(length(districts), mean = 0, sd = residual_std_error)

num_crimes <- pmax(num_crimes, 0)

simulated_data <- data.frame(District = districts, 
                             num_crimes = round(num_crimes), 
                             num_mha_reports = num_mha_reports)

write.csv(simulated_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/simulated_data/simulated_data.csv", row.names = FALSE)

# Load necessary libraries
library(dplyr)

# Set seed for reproducibility
set.seed(123)

# Use the actual list of districts from your clean data
districts <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33", "D41", 
               "D42", "D43", "D51", "D52", "D53", "D54", "D55", "NSA")

# Simulate the number of MHA reports based on the range you specified earlier
num_mha_reports <- sample(1000:15000, length(districts), replace = TRUE)

# Coefficients from the linear model
intercept <- 6748.2438
slope <- 2.4509

# Calculate the expected number of crimes based on the linear model
num_crimes <- intercept + slope * num_mha_reports

# Add normally distributed noise to the number of crimes
# Use the residual standard error from the model
residual_std_error <- 4835
num_crimes <- num_crimes + rnorm(length(districts), mean = 0, sd = residual_std_error)

# Ensure the number of crimes is non-negative
num_crimes <- pmax(num_crimes, 0)

# Combine into a data frame
simulated_data <- data.frame(District = districts, 
                             num_crimes = round(num_crimes), 
                             num_mha_reports = num_mha_reports)

# Save the simulated data to a CSV file
write.csv(simulated_data, "/home/rstudio/STA304_Paper_1_MaxLI/data/simulated_data/simulated_data.csv", row.names = FALSE)

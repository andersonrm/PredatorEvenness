
# Load the ggplot2 library
library(ggplot2)

# Generate some example data
set.seed(123)
eveness <- 1:10
prey <- 100 * exp(-0.1 * eveness) + (20) + 
  rnorm(10, mean = 0, sd = 5)

prey
# Define the model function
exp_decay <- function(t, a, k, b, c0) {
  a * exp(-k * t) + (b * t + c0)
}

# Fit the model to the data
fit <- nls(prey ~ exp_decay(eveness, a, k, b, c0),
           start = list(a = 100, k = 0.05, b = 0.1, c0 = 20))

# Extract the coefficients
a <- coef(fit)[1]
k <- coef(fit)[2]
b <- coef(fit)[3]
c0 <- coef(fit)[4]

# Create a data frame for plotting the fitted curve
fitted_data <- data.frame(eveness = eveness,
                          fitted_values = exp_decay(eveness, a, k, b, c0))

# Create a data frame for the original data
original_data <- data.frame(eveness = eveness, prey = prey)

# Plot the data and the fitted curve using ggplot2
ggplot() +
  geom_point(data = original_data,
             aes(x = eveness, y = prey),
             color = "blue", shape = 1) +
  geom_line(data = fitted_data,
            aes(x = eveness, y = fitted_values),
            color = "red") +
  labs(title = "Exponential Decay with Variable Asymptote",
       x = "Eveness", y = "Prey") +
  theme_minimal()




#####################################
# Load the ggplot2 library
library(ggplot2)

# Generate example data with four different asymptotes
set.seed(123)
time <- rep(1:25, each = 4)  # Create time points for four sets of data
asymptotes <- c(20, 30, 25, 35)  # Different asymptotes for each set
data <- rep(50, times = length(time)) * 
  exp(-0.05 * time) + (0.1 * time + asymptotes) + rnorm(100, mean = 0, sd = 5)

# Define the model function with a variable vertical position of the asymptote
exp_decay_with_variable_asymptote <- function(t, a, k, c0) {
  a * exp(-k * t) + c0
}

# Fit the model to the data
fit <- nls(data ~ exp_decay_with_variable_asymptote(time, a, k, c0),
           start = list(a = 50, k = 0.05, c0 = 20))

# Extract the coefficients
a <- coef(fit)[1]
k <- coef(fit)[2]
c0 <- coef(fit)[3]

# Create a data frame for plotting the fitted curve
fitted_data <- data.frame(time = time,
                          fitted_values = exp_decay_with_variable_asymptote(time, a, k, c0))

# Create a data frame for the original data
original_data <- data.frame(time = time, data = data)

# Plot the data and the fitted curve using ggplot2
ggplot() +
  geom_point(data = original_data, aes(x = time, y = data), color = "blue", shape = 1) +
  geom_line(data = fitted_data, aes(x = time, y = fitted_values), color = "red") +
  labs(title = "Exponential Decay with Variable Vertical Position of Asymptote",
       x = "Time", y = "Data") +
  theme_minimal()



####################################
# Load necessary libraries
library(tidyverse)
library(nls.multstart)

# Generate example data
set.seed(123)
evenness <- seq(0, 1, length.out = 100)
richness <- sample(1:5, 100, replace = TRUE)
prey <- 80 * exp(-10 * evenness) + 5 * richness + rnorm(100, mean = 0, sd = 5)

# Create a data frame
data <- data.frame(evenness = evenness, richness = richness, prey = prey)

# Define the model function
exp_decay_with_richness <- function(evenness, a, b, c, richness) {
  a * exp(-b * evenness) + c * richness
}

# Fit the model to the data
fit <- nls_multstart(
  prey ~ exp_decay_with_richness(evenness, a, b, c, richness),
                     data = data,
                     iter = 100,
                     start = list(a = 80, b = 2, c = 5),
                     start_lower = c(0, 0, 0),
                     upper = c(100, Inf, 10))

summary(fit)

# Extract the coefficients
a <- coef(fit)[1]
b <- coef(fit)[2]
c <- coef(fit)[3]

# Create a data frame for plotting the fitted curve
fitted_data <- data.frame(evenness = evenness, richness = richness,
          fitted_values = exp_decay_with_richness(evenness, a, b, c, richness))

data <- data %>% 
  mutate(fitted_values = fitted_data$fitted_values)

# Plot the data and the fitted curve using ggplot2
ggplot(data) +
  geom_point(aes(x = evenness, y = prey, color = factor(richness)), shape = 1) +
  geom_smooth(aes(x = evenness,
                  y = fitted_values,
                  fill = factor(richness)),
              color = "red",
              stat = "identity") +
  labs(x = "Evenness", y = "Prey") +
  theme_minimal()



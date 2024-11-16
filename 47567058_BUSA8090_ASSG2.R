# Clear the R environment
rm(list = ls())

# Load the library
library(readr)
library(ggplot2)
library(maps)
library(dplyr)
library(tidyr)

# Import the data and quick data exploration
data <- read_csv("earthquakes.csv")
names(data)
# Missing values
sapply(data, function(x) sum(is.na(x)))
# Duplication
unique(data$continent)

# 1) Time series for the Magnitude
ggplot(data, aes(x = date, y = magnitude)) +
  geom_line(color = "lightblue") +              
  geom_point(color = "red") +              
  labs(title = "Magnitude Time Series",
       x = "Date",
       y = "Magnitude") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# 2) World Map of the Earthquake Magnitude
world.map <- map_data("world")
ggplot() +
  geom_polygon(data = world.map, aes(x = long, y = lat, group = group), fill = "white", alpha = 0.2) +  # World map
  theme_classic() +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    plot.margin = unit(c(3, 0, 0, 0), "mm"),
    panel.background = element_rect(fill = 'black'),
    plot.title = element_text(hjust = 0.5),
  ) +
  geom_point(aes(x = longitude, y = latitude, color = magnitude), data = data, alpha = 0.7) +  
  scale_color_gradient(low = "yellow", high = "red") +  # Color gradient for magnitude
  coord_fixed(ylim = c(-90, 90), xlim = c(-190, 190))+  # Choose range > min,max to shows inside the map
  theme(legend.position = "bottom", axis.title.y = element_blank(), axis.title.x = element_blank()) +
  labs(title = "Earthquakes Around the World", color = "Magnitude")

# 3) Scatter Plot for Latitude
ggplot(data, aes(x = latitude, y = magnitude)) +
  geom_point(color = "darkorange") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add smooth line
  labs(title = "Magnitude vs Latitude",
       x = "Latitude",
       y = "Magnitude") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# 4) Scatter Plot for Longitude
ggplot(data, aes(x = longitude, y = magnitude)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Magnitude vs Longitude",
       x = "Longitude",
       y = "Magnitude") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# 5) Correlation matrix
dt <- data %>%
  select(where(is.numeric), -c(time, updated, timezone, postcode, tsunami))
cor_matrix <- cor(dt)

# Reshape the correlation matrix into a long format  & Rename columns
cor_matrix_long <- as.data.frame(as.table(cor_matrix))
colnames(cor_matrix_long) <- c("Variable1", "Variable2", "Correlation")

ggplot(cor_matrix_long, aes(x = Variable1, y = Variable2, fill = Correlation)) +
  geom_tile(color = "white") +  
  scale_fill_gradient2(low = "lightblue", mid = "white", high = "orange", 
                       midpoint = 0, limit = c(-1, 1), 
                       name = "Correlation") +
  geom_text(aes(label = round(Correlation, 2)), color = "black", size = 2) +  
  labs(title = "Correlation Matrix Heatmap",
       x = "Variables",
       y = "Variables") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),  
        text = element_text(size = 7),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

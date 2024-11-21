Objective

By analyzing earthquake magnitudes over time and other contributed factors such as their geographical distribution, tsunami existence, etc. the goal is to identify key trends and insights that could help improve earthquake forecasting models.

Data Overview

The dataset used for this analysis contains earthquake-related data, including variables like the magnitude, latitude, longitude, and other numerical factors related to seismic activity as well as categorical variables such as address, country, continent. The dataset has some missing values and duplications but those columns are not used, thus I don't perform data cleaning.

Visualization & Insights

Figure 1: Time Series of Earthquake Magnitude

A time series plot was generated to show the trend of earthquake magnitudes over time. It reveals that while the number of earthquakes recorded has increased over time, most recent earthquakes have lower magnitudes. 

The surge in low-magnitude earthquakes highlights the need for enhanced seismic monitoring networks to capture smaller events.

Environmental changes, such as climate and geological shifts, might contribute to the decreasing magnitude of recent earthquakes.

Figure 2: World Map of Earthquake Magnitude

This world map visualizes the geographical distribution of earthquake magnitudes, using longitude and latitude for the positioning of earthquakes. 

The map clearly shows that earthquake magnitudes are higher in Asia and South America, while North America and Oceania have relatively fewer severe events. Europe and Africa generally experience lower magnitudes.

Targeting high-risk regions for further research could improve earthquake prediction accuracy and resource allocation.

Figure 3 & 4 : Plot of Latitude vs Earthquake Magnitude and Longitude vs Earthquake Magnitude

For plot between latitude and earthquake magnitude, it shows a negative correlation, meaning that higher-magnitude earthquakes tend to occur closer to the equator.
For plot longitude versus earthquake magnitude, it reveals a positive correlation. As we move from the western part of the world to the east, earthquake magnitude increases.

Figure 5: Heatmap of Numerical Variables

The heatmap shows the correlation between earthquake magnitude and other numerical variables such as "longitude", "latitude", "rms", "dmin", "nst", and "sig". It highlights which variables are strongly correlated with earthquake magnitude, providing insights into which factors should be prioritized for predictive modeling.

Variables like "longitude", "latitude", "rms", and "dmin" show strong correlations with magnitude, suggesting they are key factors to consider when predicting earthquake size which should incoperate when develop a predictive models.

FUTHER MODELLING

Building supervised machine learning models to predict the earthquake magnitudes with time and location in the future. We can train and test various models (such as linearn regression, GLM, or trees, ensembled methods for tree, neural networks which does not requires many pre-assumption about specific distribution of target variable)

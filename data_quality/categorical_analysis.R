# Loading necessary packages
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)
library(naniar)
library(stringr)
library(tidyr)

# Loading 'iris' dataset and creating NA data for demo
data("iris")
set.seed(1234) # For reproductability

# Inputing NA values into column 'Species'
iris$Species[sample(51:150, 25)] <- NA

# Class balance analysis with 'tabyl' from 'janitor'
iris_tabyl <- iris |>
  janitor::tabyl(Species)

# Showing analysis
iris_tabyl
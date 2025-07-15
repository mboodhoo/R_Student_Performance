# Cleaning data and split into training and test sets

# Loading required packages
library(tidyverse)
library(skimr)
library(GGally)
library(corrplot)
library(psych)
library(gridExtra)
library(MASS)
library(car)
library(broom)
library(car)

# Reading in Student Performance data
performance.data = read_csv('Student_Performance.csv')

# Structure of data frame
glimpse(performance.data)
# Broad overview of data frame
skim(performance.data)
# Finding the number of duplicate rows
sum(duplicated(performance.data))

# Assign "No" to 0 and "Yes" to 1 for the Extracurricular Activities column
for (i in 1:10000) {
  if (performance.data$`Extracurricular Activities`[i] == "No") {
    performance.data$`Extracurricular Activities`[i] = 0
  } else {
    performance.data$`Extracurricular Activities`[i] = 1
  }
}
performance.data$`Extracurricular Activities` = 
  as.numeric(performance.data$`Extracurricular Activities`)


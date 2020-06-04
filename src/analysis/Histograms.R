library(data.table)
library(ggplot2)
library(tidyverse)
library(forcats)

# read final data
dt <- fread('../../gen/analysis/temp/preclean.csv')

# Load different datasets 
Before <- fread("../../gen/data-preparation/output/dataset_before.csv") %>% as_tibble() %>% 
  # met mutate voeg je een kolom toe, waarde voor kolom moment = voor 
    mutate(moment = "Before")

During <- fread("../../gen/data-preparation/output/dataset_during.csv") %>% as_tibble() %>% 
  mutate(moment = "During")

After <- fread("../../gen/data-preparation/output/dataset_after.csv") %>% as_tibble() %>% 
    mutate(moment = "After")


# read final data
# Merge data
# Start with "Before" 
Dataset <- Before %>% 
  # 'Bind rows' to add rows. Only possible when all columns are equal, therefore, we called every column 'moment'
  bind_rows(During) %>% 
  bind_rows(After) %>% 
  # 'mutate' creates another new column
  # 'case when' is a if_else function, but for multiple conditions
  mutate(Eigen_polarity = case_when(
    polarity > 0 ~   "Positive",
    polarity < 0 ~  "Negative",
    #?case_when
    # Should end with TRUE ~value, this is a function of 'case_when'
    TRUE ~ "Neutral"
  ))

Dataset %>% 
  # Over here we relevel the variable 'moment',
  # this becomes possible when we made 'moment' into a factor
  # str(Dataset$mutate) # factor
  # fct_relevel = factor_relevel
  mutate(moment = moment %>% as_factor(),
         moment = moment %>% fct_relevel("Before", "During", "After")) %>% 
  
  # Remove Neutral plot 
  filter(Eigen_polarity != "Neutral") %>% 
  # ggplot is the functie to make a plot
  # x = polarity, no y variables because geom_histogram does this itself (counts rows)
  ggplot(aes(x = polarity, fill = moment)) +
  # number of bins = 5, eventually adjust. Default = 30
  geom_histogram(bins = 10) +
  # scales = free makes sure the x-as en y-as are scaled freely 
  # free_x scales all y-as equal
  facet_wrap(Eigen_polarity ~ moment, scales = "free_x")


g

#install.packages("scales")


Dataset %>% 
  # Over here we relevel the variable 'moment',
  # this becomes possible when we made 'moment' into a factor
  # str(Dataset$mutate) # factor
  # fct_relevel = factor_relevel
  mutate(moment = moment %>% as_factor(),
         moment = moment %>% fct_relevel("Before", "During", "After")) %>% 
  
  # Remove Neutral plot 
  filter(Eigen_polarity != "Neutral") %>% 
  # ggplot is the function to make a plot
  # x = polarity, no y variables because geom_histogram does this itself (counts rows)
  ggplot(aes(x = polarity, fill = moment)) +
  # number of bins = 10, eventually adjust. Default = 30
  geom_histogram(bins = 10) +
  # scales = free makes sure the x-as en y-as are scaled freely 
  # free_x scales all y-as equal
  facet_wrap(Eigen_polarity ~ moment, scales = "free_x")
#facet_wrap(Eigen_polarity ~ moment, scales = "free")

## Tabladen {.tabset .tabset-fade}


# Data manipulatie -> dplyr = %>% pipe operator 
## ggplot + 
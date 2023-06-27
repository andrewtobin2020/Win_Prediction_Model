if (!requireNamespace('devtools', quietly = TRUE)){
  install.packages('devtools')
}
devtools::install_github("andreweatherman/toRvik") 
library(toRvik)
library(dplyr)

yr23 = bart_game_box(year = 2023)
yr22 = bart_game_box(year = 2022)
yr21 = bart_game_box(year = 2021)
yr20 = bart_game_box(year = 2020)
yr19 = bart_game_box(year = 2019)
yr18 = bart_game_box(year = 2018)
yr17 = bart_game_box(year = 2017)
yr16 = bart_game_box(year = 2016)
yr15 = bart_game_box(year = 2015)
yr14 = bart_game_box(year = 2014)
yr13 = bart_game_box(year = 2013)
yr12 = bart_game_box(year = 2012)
yr11 = bart_game_box(year = 2011)
yr10 = bart_game_box(year = 2010)
yr09 = bart_game_box(year = 2009)
yr08 = bart_game_box(year = 2008)

library(tidyverse)
install.packages("tidyverse")
install.packages("plyr")
library(plyr)

#put all data frames into list
yr_list <- list(yr23,yr22,yr21,yr20,yr19,yr18,yr17,yr16,yr15,yr14,yr13,yr12,yr11,yr10,yr09,yr08)      

#merge all data frames together
yr_list %>% reduce(full_join, by='date')
View(yr_list)

df = plyr::ldply(yr_list, rbind)
View(df)
write_csv(df,"toRvik_dfs.csv")


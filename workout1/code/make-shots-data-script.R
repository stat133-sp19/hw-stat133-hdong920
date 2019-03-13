## title: Making shots-data
## 
## description: This script takes the five players (Iguodala, Green, Durant, Thompson, and Curry)
## and their raw data to adjust the shot_made_flag category add minute variable. Then, it combines 
## them all into shots-data.csv. 
## 
## inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
## 
## output: andre-iguodala-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt, 
## klay-thompson-summary.txt, stephen-curry-summary.txt, shots-data-summary.txt, shots-data.csv

library(dplyr)

iguodala = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green = read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson = read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)


#Adding a name column
iguodala = mutate(iguodala, name = "Andre Iguodala")
green = mutate(green, name = "Draymond Green")
durant = mutate(durant, name = "Kevin Durant")
thompson = mutate(thompson, name = "Klay Thompson")
curry = mutate(curry, name = "Stephen Curry")


#Changing shot_made_flag values to 'shot_no' and 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no'


#Adding minutes column
iguodala = mutate(iguodala, minute = period * 12 - minutes_remaining)
green = mutate(green, minute = period * 12 - minutes_remaining)
durant = mutate(durant, minute = period * 12 - minutes_remaining)
thompson = mutate(thompson, minute = period * 12 - minutes_remaining)
curry = mutate(curry, minute = period * 12 - minutes_remaining)


#Recording outputs of summary statistics
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()


#Stacking tables
shots_data = rbind(iguodala, green, durant, thompson, curry)


#Exporting stacked tables
write.csv(x = shots_data, file = '../data/shots-data.csv')


#Recording output of stacked tables summary statistics
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()





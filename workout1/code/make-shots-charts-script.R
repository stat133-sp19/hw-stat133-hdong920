## title: Making Shot Charts
## 
## description: This script creates shot charts for each player and a faceted shot chart, comparing
## each player with each other. These charts are outputted to the images folder. 
## 
## input: iguodala, green, durant, thompson, curry, and shot_data data frames; nba-court.jpg
##
## output: andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf
## klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png

library(ggplot2)
library(jpeg)
library(grid)

court_file = "../images/nba-court.jpg"

court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)


#Shot chart for each player
iguodala_shot_chart = ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
green_shot_chart = ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
durant_shot_chart = ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
thompson_shot_chart = ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
curry_shot_chart = ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()

pdf(file = "../images/andre-iguodala-shot-chart.pdf")
iguodala_shot_chart
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf")
green_shot_chart
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf")
durant_shot_chart
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf")
thompson_shot_chart
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf")
curry_shot_chart
dev.off()


#Faceted shot chart
gsw_shot_charts = ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.6) +
  ylim(-50, 420) +
  ggtitle("Shot Charts: GSW (2016 season)") +
  theme_minimal() +
  facet_wrap( ~ name) +
  theme(legend.position="top")

pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_charts
dev.off()

png(filename = "../images/gsw-shot-charts.png", units = 'in', res = 400, width = 8, height = 7)
gsw_shot_charts
dev.off()

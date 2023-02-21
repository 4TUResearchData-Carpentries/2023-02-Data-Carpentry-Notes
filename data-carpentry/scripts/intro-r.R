dir.create("data")
dir.create("data_output")
dir.create("fig_output")
dir.create("scripts")
download.file("https://ndownloader.figshare.com/files/11492171", "data/SAFI_clean.csv", mode = "wb")
install.packages("tidyverse")

area_hectares <- 1.0 # assign 1.0 to an object called area_hectares

2.47 * area_hectares
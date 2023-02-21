dir.create("data")
dir.create("data_output")
dir.create("fig_output")
dir.create("scripts")
download.file("https://ndownloader.figshare.com/files/11492171", "data/SAFI_clean.csv", mode = "wb")
install.packages("tidyverse")

area_hectares <- 1.0 # assign 1.0 to an object called area_hectares

2.47 * area_hectares

area_hectares <- 2.5 # overwrite existing object

area_acres <- 2.47 * area_hectares

area_hectares <- 50

print(area_acres) # print area_acres
area_acres # also print area_acres

# Exercise 1

r_length <- 6
r_width <- 7
r_area <- r_length * r_width

# Functions

round(3.14159) # run the round function with pi as an argument

args(round) # check arguments of the round function
?round

round(3.14159, digits = 2) # round to 2 decimal points using the digits argument

round(3.14159, 2) # can remove the names of the arguments if we use the right order

round(digits = 2, x = 3.14159) # can flip the arguments as long as you name them



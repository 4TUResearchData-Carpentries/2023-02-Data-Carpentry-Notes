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

# Vectors and data types

hh_members <- c(3, 7, 10, 6) # create a vector with four values

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")

length(hh_members) # length of the hh_members vector
length(respondent_wall_type)

typeof(respondent_wall_type) # what type of object is respondent_wall_type?
str(hh_members) # see the structure of an object

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone")
possessions <- c("car", possessions)

# Exercise

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

# Subsetting

hh_members[c(TRUE, FALSE, TRUE, TRUE)]

hh_members > 5 # show value positions that satisfy condition x > 5

hh_members[hh_members > 5] # show all values greater than 5



library(tidyverse)
install.packages("here")
library(here)

interviews <- read_csv(
  here("data", "SAFI_clean.csv"),
  na = "NULL"
)

interviews
class(interviews)

# inspect the interviews data frame using some functions
dim(interviews) # vector with number of rows and columns
nrow(interviews) # number of rows
ncol(interviews) # number of columns
# content information
head(interviews) # first 6 rows
tail(interviews) # last 6 rows
head(interviews, n = 20) # first 20 rows
names(interviews) # prints column names
# summary information
str(interviews) # structure and info about class, length, content
summary(interviews) # summary statistics for each column
glimpse(interviews)

# indexing and subsetting data frames > to extract bits of data
interviews[1, 1] # first element in the first column [row, column]
interviews[7, 9] # seventh element in the 9th column
interviews[1] # first column of the tibble
interviews[[1]] # first column of the tibble as a vector
interviews[1:4, 7] # first 4 elements of the 7th column
1:10 # creates numeric vector from 1 to 10
interviews[3, ] # the 3rd row of the tibble

interviews[, -1] # exclude the first column


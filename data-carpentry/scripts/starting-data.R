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





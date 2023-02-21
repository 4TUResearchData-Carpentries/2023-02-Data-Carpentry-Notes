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



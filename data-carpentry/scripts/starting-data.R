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
interviews[-c(7:131), ] # equivalent of head(interviews)

# subsetting using column names
interviews["village"] # a tibble of the village column
interviews[6, "village"] # row 6 of the village column
interviews[["village"]] # a vector of the village column
names(interviews)
interviews$months_lack_food # a vector of the months_lack_food column

#### EXERCISE
# 1.
interviews_100 <- interviews[100, ]
# 2.
n_rows <- nrow(interviews)
interviews_last <- interviews[n_rows, ]
# 3.
# 1 option without nrow
middle <- median(1:131)
interviews_middle <- interviews[middle, ]
interviews_middle
# 1 option with nrow
median_row <- median(1:(n_rows-1))
interview_middle_alternative <- interviews[round(median_row), ]
interview_middle_alternative
# other option with nrow
interviews_middle2 <- interviews[median(1:n_rows), ]
interviews_middle2
# 4.
interview_head <- interviews[-(7:n_rows), ]
interview_head
# alternative solution without nrow()
rows1_6 <- interviews[-c(7:131), ]
rows1_6

#### FACTORS

# let's create a short factor:
respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))
# R will assign 1 to "cement" and 2 to "earth" (alphabetically)
# let's have a look:
levels(respondent_floor_type)
respondent_floor_type
respondent_floor_type <- factor(respondent_floor_type,
                                levels = c("earth", "cement")) # reordering levels
respondent_floor_type # after re-ordering
respondent_floor_type <- fct_recode(respondent_floor_type,
                                    brick = "cement") # recode "cement" to "brick"
respondent_floor_type # after renaming
# factor is unordered, but we can make an ordinal variable out of it
respondent_floor_type_ordered <- factor(respondent_floor_type,
                                        ordered = TRUE)
respondent_floor_type_ordered # after setting as ordered factor

## Converting factors
as.character(respondent_floor_type) # convert to character vector
# converting factors to numeric vectors should be done in steps:
year_fct <- factor(c(2023, 1986, 2015, 1994, 1974)) # create a factor with years
year_fct
as.numeric(year_fct) # look at our output > it is not what we want!
as.numeric(as.character(year_fct)) # first convert to character, then to numeric
as.numeric(levels(year_fct))[year_fct]  # the recommended way > first obtain factor levels using levels() function
                                        # then we convert these levels into numeric values using as.numeric
                                        # finally we access these numeric values using the integers inside the square brackets

## Renaming factors
memb_assoc <- interviews$memb_assoc # create a vector from the "memb_assoc column in the interviews data frame
memb_assoc <- as.factor(memb_assoc) # convert it into a factor
memb_assoc # have a look
plot(memb_assoc) # bar plot of respondents who were members of an irrigation association

memb_assoc <- interviews$memb_assoc
memb_assoc[is.na(memb_assoc)] <- "undetermined" # replace missing data with "undetermined"
memb_assoc <- as.factor(memb_assoc) # convert into factor
plot(memb_assoc) # bar plot with NA / undetermined respondents

#### EXERCISE
# 1.
memb_assoc <- fct_recode(memb_assoc, 
                         Yes = "yes", No = "no", 
                         Undetermined = "undetermined")
plot(memb_assoc)
# 2.
memb_assoc <- factor(memb_assoc, 
                     levels = c("No", "Yes", "Undetermined"))
plot(memb_assoc)

#### FORMATTING DATES
library(lubridate)
dates <- interviews$interview_date # extract the interview_date column
str(dates)

interviews$day <- day(dates) # create day column from dates
interviews$month <- month(dates) # create month column from dates



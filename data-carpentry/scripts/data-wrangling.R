## load the tidyverse
library(tidyverse)
library(here)

# If you haven't downloaded the file:
#download.file("https://ndownloader.figshare.com/files/11492171",
#              "data/SAFI_clean.csv", mode = "wb")


# Assign data to the object
interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL")

# preview the data
# view(interviews)

# Subsetting by columns ----

# select subset of columns
select(interviews, village, no_membrs, months_lack_food)


# do the same with subsetting 
interviews[c("village", "no_membrs", "months_lack_food")]

# select a series of columns placed next to each other
select(interviews, village:respondent_wall_type)

# Subsetting by rows ----

#keep only observations from village Chirodzo
filter(interviews, village == "Chirodzo")

# filter with AND statement 
filter(interviews, village == "Chirodzo" &
         rooms > 1 &
         no_meals > 2)

# filter with OR statement
filter(interviews, village == "Chirodzo" |
         rooms > 1 |
         no_meals > 2)

# Subsetting by rows and columns -----

# Use intermediate steps 
interviews_temp <- filter(interviews, village == "Chirodzo")
interviews_ch <- select(interviews_temp, village:respondent_wall_type )

# Nest functions 

interviews_ch <- select(filter(interviews, village == "Chirodzo") ,
                        village:respondent_wall_type)

# pipe
interviews_ch <- interviews %>%
  filter(village == "Chirodzo") %>%
  select(village:respondent_wall_type)
  


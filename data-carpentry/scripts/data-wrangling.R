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
  

# Exercise 1: ⌚ 5 mins
# subset the interviews data to include interviews where respondents 
# were members of an irrigation association (memb_assoc);
# retain only the columns affect_conflicts, liv_count, and no_meals;

# Solution
interviews_exc1 <- interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

interviews_ex <- interviews %>% filter(memb_assoc == "yes") %>% 
  select(c(affect_conflicts, liv_count, no_meals))


# create new columns ----

# average number of household members per room 
interviews %>%
  mutate(people_per_room = no_membrs / rooms ) %>%
  select(people_per_room)


# Exercise 2: 🕧 5 mins
# Create a new dataframe from the interviews data that:
#   
#   contains only the village column and a new column called total_meals, standing for total number of meals served in the household per day on average (no_membrs times no_meals).
# Only the rows where total_meals is greater than 20 should be shown in the final dataframe
# 

# solution 

interviews_exc2 <- interviews %>%
  mutate(total_meals = no_membrs * no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)


# split - apply - combine -----


# average household size by village 
interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs) )

# average household size by village and irrigation society (memb_assoc)
interviews %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs))

# filter out NAs
interviews %>%
  filter( !is.na(memb_assoc) ) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs),
            min_rooms = min(rooms)
  )

# Exercise 3

# 1. How many households in the survey have an average of two meals per day?

interviews %>%
  count(no_meals)
# 2. Find the mean, min, and max number of household members for each village. 
# Add the number of observations. 

interviews %>% 
  group_by(village) %>% 
  summarise(mean_membrs = mean(no_membrs),
            min_membrs = min(no_membrs),
            max_membrs = max(no_membrs),
            n = n())


interviews %>%
  count(village)

# Transforming between long and wide formaT ----

# Long to wide 

interviews_wide <- interviews %>%
  mutate(wall_type_logical = TRUE) %>%
  pivot_wider(names_from = respondent_wall_type,
              values_from = wall_type_logical, 
              values_fill = FALSE )
view(interviews_wide)

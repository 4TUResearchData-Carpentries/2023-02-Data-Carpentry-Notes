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



# Dataset for plotting
interviews_plotting <- interviews %>%
  ## pivot wider by items_owned
  separate_rows(items_owned, sep = ";") %>%
  ## if there were no items listed, changing NA to no_listed_items
  replace_na(list(items_owned = "no_listed_items")) %>%
  mutate(items_owned_logical = TRUE) %>%
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE)) %>%
  ## pivot wider by months_lack_food
  separate_rows(months_lack_food, sep = ";") %>%
  mutate(months_lack_food_logical = TRUE) %>%
  pivot_wider(names_from = months_lack_food,
              values_from = months_lack_food_logical,
              values_fill = list(months_lack_food_logical = FALSE)) %>%
  ## add some summary columns
  mutate(number_months_lack_food = rowSums(select(., Jan:May))) %>%
  mutate(number_items = rowSums(select(., bicycle:car)))

## save the dataframe to our data_output directory
write_csv(interviews_plotting, file = here("data_output/interviews_plotting.csv")) 

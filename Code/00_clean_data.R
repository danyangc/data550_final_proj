here::i_am(
  "Code/00_clean_data.R"
)

library(dplyr)
library(lubridate)

data_clean <- data %>%
  filter(!is.na(Year), !is.na(Month), #remove rows with missing month and year
         State != "United States") %>%  #remove the overall counts for the US
  mutate(Date = make_date(Year, Month), #create new date column 
         COVID.19.Deaths = as.numeric(COVID.19.Deaths)) %>% #make column numeric 
  select(State, Place.of.Death, COVID.19.Deaths, Date)

write.csv(data_clean, "Derived_data/cleaned_data.csv", row.names = FALSE)

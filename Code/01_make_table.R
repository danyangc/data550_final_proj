here::i_am(
  "Code/01_make_table.R"
)

library(webshot2)
library(gt)

data_clean <- read.csv(
  file = here::here("Derived_data/cleaned_data.csv")
)

total_death_data <- data_clean %>%
  filter(Place.of.Death == "Total - All Places of Death") #only show the total number of death

monthly_deaths <- total_death_data %>%
  arrange(desc(COVID.19.Deaths)) %>% #arrange to see the top 5 states
  head(5)

#create formatted table
monthly_deaths_table <- monthly_deaths %>%
  gt() %>%
  tab_header(
    title = "Top 5 Monthly COVID-19 Death Toll by State"
  ) %>%
  cols_label(
    State = "State",
    Date = "Date",
    COVID.19.Deaths = "COVID-19 Death Toll",
    Place.of.Death = "Place of Death"
  )

gtsave(monthly_deaths_table, "Output/monthly_deaths_table.png")



here::i_am(
  "Code/01_make_table.R"
)  

library(webshot2)
library(gt)
library(dplyr)
library(knitr)
library(kableExtra)

data_clean <- read.csv(
  file = here::here("Derived_data/cleaned_data.csv")
)

names(data_clean)
total_death_data <- data_clean %>%
  filter(Place.of.Death == "Total - All Places of Death") #only show the total number of death

monthly_deaths <- total_death_data %>%
  arrange(desc(COVID.19.Deaths)) %>% #arrange to see the top 5 states
  head(5)

write.csv(total_death_data, "Derived_data/total_death_data.csv", row.names = FALSE)

#create formatted table






# Generate a kable table
monthly_deaths_kable <- monthly_deaths %>%
  kable(
    format = "html",  # Format can be 'html', 'markdown', or 'latex'
    col.names = c("State", "Date", "COVID-19 Death Toll", "Place of Death"),
    caption = "Top 5 Monthly COVID-19 Death Toll by State"
  ) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = FALSE
  )

# Save as an HTML file
save_kable(monthly_deaths_kable, file = "Output/monthly_deaths_table.html")

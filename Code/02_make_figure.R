here::i_am(
  "Code/02_make_figure.R"
)

library(ggplot2)

total_death_data_viz <- total_death_data %>%
  filter(State %in% c("North Carolina", "New York", "Georgia", "Wisconsin", "Florida"), # select top 5 states
         !is.na(COVID.19.Deaths)) # remove NAs


total_death_line <- ggplot(total_death_data_viz, aes(x = Date, y = COVID.19.Deaths, color = State, group = State)) +
  geom_line() +
  labs(
    title = "COVID-19 Death Toll Over Time by State",
    x = "Date",
    y = "Death Toll"
  ) +
  theme_minimal()

saveRDS(
  total_death_line,
  file = here::here("Output/total_death_line.rds")
)

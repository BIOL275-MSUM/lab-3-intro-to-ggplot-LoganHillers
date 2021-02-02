
# load packages -----------------------------------------------------------

library(tidyverse)

# firefly spermatophore masses ----------------------------------

firefly_mass <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

firefly_mass
ggplot(data = firefly_mass)

ggplot(data = firefly_mass) +
  geom_histogram(mapping = aes(x = spermatophoreMass))
#> `stat_bin()` using `bins = 50`. Pick better value with `binwidth`.

ggplot(data = firefly_mass) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.01,
                 boundary = 0, closed = "left")

ggplot(data = firefly_mass) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.01,
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Spermatophore Mass", y = "Frequency (number of fireflies)") +
  scale_y_continuous(breaks = seq(0, 30, 5), limits = c(0, 12), 
                     expand = expansion(mult = 0)) +
  scale_x_continuous(breaks = seq(0, 600, 100)) +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )

# birds -------------------------------------------------------------------

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Order", y = "Frequency (number of species)") +
  scale_y_continuous(limits = c(0, 6500), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )


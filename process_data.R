library(tidyverse)
library(fs)

x <- read_csv("mt_2_results.csv")

download.file("https://goo.gl/ZRCBda", "master.zip", quiet =  TRUE, mode = "wb")

unzip("master.zip")


file_delete("master.zip")

y <- dir_ls("2018-live-poll-results-master/data/")

y <- map_dfr(y, read_csv, .id = "source")

y %>% 
  filter(!(str_detect(source, pattern = "sen"))) %>% 
  filter(!(str_detect(source, pattern = "gov"))) %>% 
  select(source) %>% 
  View()


View(x)



x %>% 
  filter(district == "sen" & district == "gov")

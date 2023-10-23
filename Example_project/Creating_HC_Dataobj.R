library(rjson)
library(tidyverse)

# Color palette
class_color_palette<- c(Druid	= "#FF7C0A",
                        Hunter	= "#AAD372",
                        Mage	= "#3FC7EB",
                        Paladin	= "#F48CBA",
                        Priest = "#FFFFFF",
                        Rogue	= "#FFF468",
                        Shaman	= "#0070DD",
                        Warlock	= "#8788EE",
                        Warrior =	"#C69B6D")

# ClassID KEY
# 1	Warrior	WARRIOR	
# 2	Paladin	PALADIN	
# 3	Hunter	HUNTER	
# 4	Rogue	ROGUE	
# 5	Priest	PRIEST	
# 7	Shaman	SHAMAN	
# 8	Mage	MAGE	
# 9	Warlock	WARLOCK	
# 11 Druid	DRUID	



# Load data
data_HC <- fromJSON(file = "./raw_data/db.json", simplify = TRUE)
data_HC <- plyr::ldply(data_HC, data.frame) # unroll list to dataframe
data_HC$map_pos <- NULL # Remove map position X/Y
data_HC <- distinct(data_HC) # Cut to unique rows (i.e. one entry per death logged)

# Sanity check
summary(data_HC)
data_HC$map_id <- as.factor(data_HC$map_id)

# Convert class numbers to class names and factorize
data_HC <- data_HC %>% mutate(class_id = fct_recode(as.factor(class_id), 
                                       Warrior = "1",
                                       Paladin = "2",
                                       Hunter = "3",
                                       Rogue = "4",
                                       Priest = "5",
                                       Shaman = "7",
                                       Mage = "8",
                                       Warlock = "9",
                                       Druid = "11",))
# Class plot
ggplot(data_HC, aes(x = class_id, y = level, fill = class_id, group = class_id)) +
  geom_violin(color = "black") +
  scale_fill_manual(name = "Class", values = class_color_palette) +
  scale_y_continuous(name = "Level", breaks = seq(0, 60, by = 5)) +
  theme_bw() +
  theme(axis.title.x = element_blank())

# top 10 zones by deaths

zone_by_level <- data_HC %>%
  group_by(map_id) %>%
  dplyr::summarise(across(where(is.numeric), sum), .groups = 'drop')

zone_by_level[zone_by_level$level > 30000,]


ggplot(zone_by_level[zone_by_level$level > 30000,], aes(x = map_id, y = level)) +
  geom_col()



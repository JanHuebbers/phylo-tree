#Set theme for ggplot objects
#Theme
theme_set(
  theme_light(
    base_size = 8, 
    base_family = "Arial"))
# Update theme
theme_update(
  rect = element_rect(fill = "transparent"),
  plot.background = element_blank(),
  panel.grid = element_blank(),
  panel.border = element_blank(),
  panel.background = element_rect(fill = "transparent", color = NA),
  legend.background = element_rect(fill = "transparent", linetype = "blank"),
  legend.box.background = element_rect(fill = "transparent", linetype = "blank"),
  legend.title = element_blank(),
  legend.text.align = 0,
  legend.key = element_rect(colour = "transparent", fill = "white"),
  legend.position = "bottom",
  axis.title.x = element_text(
    size = 8, face = "bold", family = "Arial", color = "black", vjust = 0.5, hjust = 0.5),
  axis.title.y = element_text(
    size = 8, face = "bold", family = "Arial", color = "black", vjust = 0.5, hjust = 0.5),
  axis.text.x = element_text(
    size = 6, family = "Arial", hjust = 1.0, angle = 45),
  axis.text.y = element_text(
    size = 7, family = "Arial", face = "plain"),
  axis.line = element_line(
    color = "black", lineend = "round", linetype = "solid", linewidth = 0.5),
  axis.ticks = element_line(
    color = "black", linewidth = 0.5, lineend = "round")
)
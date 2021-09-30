##### Preamble -----

rm(list = ls())

# Working Directory
setwd("/Users/dominiklawetzky/Documents/GitHub/juniorwahl-wk178")

## PACKAGE NAMEN
packages <- c("ggplot2", "readxl", "dplyr", "multcomp", "tidyr", "knitr", "car", "psych", "tidyverse", "lmtest", "ggpubr", "ggstatsplot", "jsonlite", "pander", "abind", "RColorBrewer", "rococo", "shiny", "gvlma", "emmeans", "ez")



## PACKETE INSTALLIEREN, WENN NICHT INSTALLIERT
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(ggthemes)


## PAKETE LADEN
invisible(lapply(packages, library, character.only = TRUE))


##### Daten eingeben -----

erststimme <- data.frame(Partei = c("Grüne", "SPD", "FDP", "Sonstige"),
                         Ergebnis = c(.25, .244, .197, .309))

zweitstimme <- data.frame(Partei = c("Grüne", "SPD", "FDP", "Sonstige", "CDU", "Linke"),
                         Ergebnis = c(.216, .176, .233, .178, .125, .071))

colors <- c("CDU" = "#000000",
            "SPD" = "#e2001a",
            "Grüne" = "#1ca42c",
            "FDP" = "#fbeb04", 
            "AfD" = "#019ee3",
            "Linke" = "#bd3076", 
            "Freie Wähler" = "#2596be",
            "Die Basis" = "#f49404",
            "NPD" = "#e40424",
            "Sonstige" = "#7c7c7c")

level_order <- c("CDU", "SPD", "Grüne", "FDP", "AfD", "Linke", "Freie Wähler", "Die Basis", "NPD", "Sonstige")


##### Plot 1: Erststimme -----

plot1 <- ggplot(data = erststimme, aes(x = factor(Partei, levels = level_order), y = Ergebnis, color = Partei, fill = Partei, label = scales::percent(Ergebnis))) +
                geom_bar(stat = "identity") +
                geom_text(size = 5, position = position_stack(vjust = 1.1)) +
                labs(title = "Juniorwahl: Erststimmen-Ergebnis", 
                     subtitle = "Wahlkreis 178 (Rheingau-Taunus — Limburg)",
                     y = "Prozent",
                     x = "",
                     caption = "www.juniorwahl.de/juniorwahl-btw-2021.html") +
                scale_color_manual(name = "Parteien", values = colors, guide = "none") +
                scale_fill_manual(name = "Parteien", values = colors, guide = "none") +
                scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
                theme_hc() +
                theme(axis.text.x = element_text(size=rel(1.2), 
                                                 angle=0, 
                                                 margin = margin(b = 10, t = 5)),
                      axis.text.y = element_text(size=rel(1.2)), 
                      legend.text = element_text(size=rel(1)),
                      legend.title = element_text(size=rel(1)),
                      plot.subtitle = element_text(size=rel(1.2))) +
                theme(plot.title = element_text(size = 18, 
                                                face = "bold",
                                                hjust = 0)) +
                theme(legend.position="bottom")

plot1

ggsave(file="plot1.png", plot=plot1, width=6, height=4.5)


##### Plot 2: Zweitstimme -----

plot2 <- ggplot(data = zweitstimme, aes(x = factor(Partei, levels = level_order), y = Ergebnis, color = Partei, fill = Partei, label = scales::percent(Ergebnis))) +
                geom_bar(stat = "identity") +
                geom_text(size = 5, position = position_stack(vjust = 1.1)) +
                labs(title = "Juniorwahl: Zweitstimmen-Ergebnis", 
                     subtitle = "Wahlkreis 178 (Rheingau-Taunus — Limburg)",
                     y = "Prozent",
                     x = "",
                     caption = "www.juniorwahl.de/juniorwahl-btw-2021.html") +
                scale_color_manual(name = "Parteien", values = colors, guide = "none") +
                scale_fill_manual(name = "Parteien", values = colors, guide = "none") +
                scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
                theme_hc() +
                theme(axis.text.x = element_text(size=rel(1.2), 
                                                 angle=0, 
                                                 margin = margin(b = 10, t = 5)),
                      axis.text.y = element_text(size=rel(1.2)), 
                      legend.text = element_text(size=rel(1)),
                      legend.title = element_text(size=rel(1)),
                      plot.subtitle = element_text(size=rel(1.2))) +
                theme(plot.title = element_text(size = 18, 
                                                face = "bold",
                                                hjust = 0)) +
                theme(legend.position="bottom")

plot2

ggsave(file="plot2.png", plot=plot2, width=6, height=4.5)

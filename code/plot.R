## simple plotting
library(ggplot2)

# cleaning up
value <- read.csv('data/value.csv')
value$period <- ifelse(value$period == '2005-2006', 2005, as.character(value$period))
value$period <- ifelse(value$period == '2007-2008', 2007, as.character(value$period))
value$period <- ifelse(value$period == '2009-2010', 2009, as.character(value$period))
value$value <- as.numeric(value$value)

# bar plot for countries 
plot1 <- ggplot(value, aes(period, value, fill = region)) + theme_bw() +
    geom_bar(stat = 'identity', size = 1, position = "dodge") +
#     facet_wrap(~ region, scale = 'free') +
    theme(panel.border = element_rect(linetype = 0),
          strip.background = element_rect(colour = "white", fill = "white"),
          #          strip.text = element_text(angle = 90, size = 10, hjust = 0.5, vjust = 0.5),
          panel.background = element_rect(colour = "white"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.text.x = element_text(angle = 90, size = 8, face = 'bold'),
          axis.text.y = element_blank(),
          axis.ticks = element_blank()) +
    ylab("") + xlab("")

# bar plot for admin1
plot2 <- ggplot(value, aes(admin1, value, fill = region)) + theme_bw() +
    geom_bar(stat = 'identity', size = 1, position = "dodge") +
    #     facet_wrap(~ region, scale = 'free') +
    theme(panel.border = element_rect(linetype = 0),
          strip.background = element_rect(colour = "white", fill = "white"),
          #          strip.text = element_text(angle = 90, size = 10, hjust = 0.5, vjust = 0.5),
          panel.background = element_rect(colour = "white"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank()) +
    ylab("") + xlab("")

# bar plot for admin2
value <- value[value$admin2 != 'NA', ]
value <- na.omit(value)
plot3 <- ggplot(value, aes(admin2, value, fill = region)) + theme_bw() +
    geom_bar(stat = 'identity', size = 1, position = "dodge") +
    #     facet_wrap(~ region, scale = 'free') +
    theme(panel.border = element_rect(linetype = 0),
          strip.background = element_rect(colour = "white", fill = "white"),
          #          strip.text = element_text(angle = 90, size = 10, hjust = 0.5, vjust = 0.5),
          panel.background = element_rect(colour = "white"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.text.x = element_text(angle = 90, size = 8, face = 'bold'),
          axis.text.y = element_blank(),
          axis.ticks = element_blank()) +
    ylab("") + xlab("")


# saving plot
ggsave(plot = plot1, 'plot1.png', height = 3, width = 11.21, units = 'in')
ggsave(plot = plot2, 'plot2.png', height = 3, width = 11.21, units = 'in')
ggsave(plot = plot3, 'plot3.png', height = 3, width = 11.21, units = 'in')

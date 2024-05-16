# analysis.R

library(tidyverse)

setwd("C:/Users/77tys/OneDrive/Documents/Work/Balance of Nature/BON/call_center_analysis")
load("data/the_data.RData")
View(data)

by_hour <- data %>% 
  group_by(hour) %>% 
  summarise(avg_active = mean(active_agents), 
            avg_calls = mean(on_calls), 
            avg_ready = mean(ready_for_calls), 
            avg_notrdy = mean(not_ready))
plot(avg_active ~ hour, data = by_hour, pch = 16, col = "navy")
plot(avg_notrdy ~ hour, data = by_hour, pch = 16, col = "navy")
plot(avg_calls ~ hour, data = by_hour, pch = 16, col = "navy")


# Make the summarized data long so we can view all 4 variables in one plot
lng_hr <- by_hour %>% 
  pivot_longer(cols = c(avg_active, avg_calls, avg_ready, avg_notrdy))

plot(value ~ hour, data = lng_hr, pch = 16, 
     col = c("blue", "darkgreen", "gold", "red"),
     xlim = c(7,20), ylim = c(0, 150))
legend(16.8, 147, legend = c("Active", "On Calls", "Ready", "Not Ready"), 
       fill = c("blue", "darkgreen", "gold", "red"))


#line plot attempt
plot(value ~ hour, data = lng_hr, type = "b", pch = 16, 
     col = c("blue", "darkgreen", "gold", "red"),
     xlim = c(7,20), ylim = c(0, 150))
legend(16.8, 147, legend = c("Active", "On Calls", "Ready", "Not Ready"), 
       fill = c("blue", "darkgreen", "gold", "red"))

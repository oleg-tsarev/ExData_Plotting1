# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_1")
rm(list=ls())
library(sqldf)

# === processing === #
df <- read.csv2.sql("./household_power_consumption_.txt",sep=";",
      'select * from file where Date = "1/2/2007" or Date = "2/2/2007" ')
par(mfrow=c(1,1))
hist(df$Global_active_power,col="red",main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)")

# === write to file === #
dev.copy(png, file = "plot1.png")
dev.off()

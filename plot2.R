#Exploratory Data Analysis
#Course Project 1
#Plot 2

#Commented Out ------
#source('~/Documents/Learnings/MOOC/DataScience/Exploratory/Projects/ExploratoryProject01/plot2.R')
#setwd("~/Documents/Learnings/MOOC/DataScience/Exploratory/Projects/ExploratoryProject01/")
#tempurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url = tempurl,destfile = "pwr_cnsmp.zip", method = "curl")
#unzip(zipfile = "pwr_cnsmp.zip")
#Commented Out ------


df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"))
#str(df)
df$Time <-paste(df$Date, df$Time)
df$Time <-strptime(df$Time, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
sub.df = subset(df, df$Date >='2007-02-01' & df$Date <= '2007-02-02')
library(datasets)
png("plot2.png", width=480, height=480)
plot(sub.df$Time, sub.df$Global_active_power,  type="l", main="", xlab = "" , ylab="Global Active Power (kilowatts)") 
dev.off()
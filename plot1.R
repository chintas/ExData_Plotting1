#Exploratory Data Analysis
#Course Project 1
#Plot 1

#Commented Out ------
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
#str(df)
sub.df = subset(df, df$Date >='2007-02-01' & df$Date <= '2007-02-02')
library(datasets)
png("plot1.png", width=480, height=480)
hist(sub.df$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col = 'red')
dev.off()
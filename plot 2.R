## Read the file
power_consumption<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## change the date format
date <- as.Date(power_consumption$Date,"%d/%m/%Y" )
power_consumption$Date <- date

## grap only date 2007-02-01 and 2007-02-02
data<-subset(power_consumption, power_consumption$Date == "2007-02-01" | power_consumption$Date == "2007-02-02")

## combine date and time and format them
datetime<-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## convert Global_active_power from character to numeric
globalactivepower <- as.numeric(data$Global_active_power)

## plotted the datetime, globalactivepower
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
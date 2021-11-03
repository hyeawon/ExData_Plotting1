## Read the file
power_consumption<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## change the date format
date <- as.Date(power_consumption$Date,"%d/%m/%Y" )
power_consumption$Date <- date

## grap only date 2007-02-01 and 2007-02-02
data<-subset(power_consumption, power_consumption$Date == "2007-02-01" | power_consumption$Date == "2007-02-02")

## combine date and time and format them
datetime<-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

## convert sub_metering from character to numeric
metering1 <- as.numeric(data$Sub_metering_1)
metering2 <- as.numeric(data$Sub_metering_2)
metering3 <- as.numeric(data$Sub_metering_3)

## plotting the first graph
plot(datetime, metering1, type="l", xlab="", ylab="Energy Sub Metering", col = "black")
par(new=TRUE)
## plotting the second graph
lines(datetime, metering2, type="l", col = "red")
par(new=TRUE)
## plotting the third graph
lines(datetime, metering3, type="l", col = "blue")

## draw the legend
legend("topright",legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("black", "red", "blue"),lwd = 2)

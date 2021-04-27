#Import Datase
library(readr)
Household <- read_delim("~/Desktop/Programas_R/Course_4/household_power_consumption.txt", ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

#Create a superior and inferior limit.
Inferior <- as.numeric(as.Date("2007-02-01"))
Superior <- as.numeric(as.Date("2007-02-02"))
Filtrado <- Household[(as.numeric(Household$Date)>=Inferior) & (as.numeric(Household$Date)<=Superior),]

#First Histogram
png("plot1.png",width = 480, height = 480)
hist(Filtrado$Global_active_power, xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power",ylim=c(0,1200))
dev.off()

#Second Histogram.
png("plot2.png",width = 480, height = 480)
plot(1:length(Filtrado[,1]),Filtrado$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)", xaxt="n")
axis(1,labels = c("Thu","Fri","Sat"), at=c(1,1440,2800))
dev.off()

#Third Histogram.
png("plot3.png",width = 480, height = 480)
plot(x=1:length(Filtrado[,1]),Filtrado$Sub_metering_1,type = "l", xlab = "",ylab = "Energy Sub metering", xaxt="n", col="darkgrey")
points(x=1:length(Filtrado[,1]),Filtrado$Sub_metering_2,type = "l", xlab = "", xaxt="n", col="red")
points(x=1:length(Filtrado[,1]),Filtrado$Sub_metering_3,type = "l", xlab = "", xaxt="n", col="blue")
axis(1,labels = c("Thu","Fri","Sat"), at=c(1,1440,2800))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("darkgrey","red","blue"),lty=1)
dev.off()



#Last histogram










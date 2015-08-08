## load data
mydata<-read.table("household_power_consumption.txt",header=TRUE,  sep=";",na.strings="?")
mydata$Time<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"))
final.data<-subset(mydata, mydata$Date %in% dates)

## Plot 4
png("plot4.png", width=400, height=400)
par(mfrow=c(2,2))
plot(final.data$Time,final.data$Global_active_power,type="l",ylab="Global Active  Power",xlab="")
 plot(final.data$Time,final.data$Voltage,type="l",ylab="Voltage",xlab="datatime")
 plot(final.data$Time, final.data$Sub_metering_1,type="l",col="black",xlab="",  ylab="Energy sub metering")
lines(final.data$Time, final.data$Sub_metering_2,type="l",col="red")
lines(final.data$Time, final.data$Sub_metering_3,type="l",col="blue")
#legend("topright", c ("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd=0,col=c ("black","red","blue"),lty=1,text.font=2)
legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1,
           box.lwd=0,bty = "n",text.font=1)
 plot(final.data$Time,final.data $Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()

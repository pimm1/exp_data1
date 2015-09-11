# first we extract the data from the file
data<-read.table("household_power_consumption.txt",sep=";")
# we add the names as needed
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering")
# we subset to get the data from the days we need
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
# this is to put the language in Englih
Sys.setlocale("LC_ALL","English")
# to print graphics in the correct position
par(mfrow=c(2,2))
# we print the graphics 
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Global_active_power)),type="l",ylab="Global Active Power",xlab="")
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Voltage)),type="l",xlab="datetime",ylab="Voltage")
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering_1)),type="l",xlab="",ylab="Energy Sub metering")
points(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering_2)),type="l",xlab="",col="Red")
points(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering)),type="l",xlab="",col="Blue") 
par(cex=0.5)    
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","blue","Red"),lty=c(1,1),xpd=NA,bty="n")
par(cex=0.85)
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Global_reactive_power)),type="l",ylab="Global_reactive_power",ylim=c(0.1, 0.5),xlab="datetime")
dev.copy(png,file="Plot4.png")
dev.off()
# first we extract the data from the file
data<-read.table("household_power_consumption.txt",sep=";")
# we add the names as needed
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering")
# we subset to get the data from the days we need
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
# this is to put the language in Englih
Sys.setlocale("LC_ALL","English")
# we plot the first graphic and add the points later , colors etc
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering_1)),type="l",xlab="",ylab="Energy Sub metering (kilowatts)")
points(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering_2)),type="l",xlab="",col="Red")
points(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Sub_metering)),type="l",xlab="",col="Blue")     
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","blue","Red"),lty=c(1,1))
dev.copy(png,file="Plot3.png")
dev.off()
# first we extract the data from the file
data<-read.table("household_power_consumption.txt",sep=";")
# we add the names as needed
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering")
# we subset to get the data from the days we need
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
# we plot the hist with the correct xlab, ylab, color and main
hist(as.numeric(as.character(data2$Global_active_power)),xlab="Global Active Power (kilowatts)",col="Red",main="Global Active Power")
dev.copy(png,file="Plot1.png")
dev.off()


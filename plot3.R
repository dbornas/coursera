data<-read.table("household_power_consumption.txt",sep=";", header = TRUE)

# We merge date and time and converte to date & time format with strptime
data$date_time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Selection of the interval of work. The rest is dropped
data<-data[data$date_time<"2007-02-03 00:00:00" & data$date_time>"2007-01-31 23:59:59",]
data<-data[c(1:2880),3:10]

# Conversion of text fields to numeric
data[,1:7]<-sapply(data[,1:7], as.numeric)

# Initial exploratory work
head(data,10)
str(data)
dim(data)
table(data$Date)
summary(data)

# plot3.R
par(mfrow=c(1,1))
plot(data$date_time, data$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
lines(data$date_time, data$Sub_metering_2,  type="l", col="red")
lines(data$date_time, data$Sub_metering_3,  type="l", col="blue")
legend("topright",legend=c("data$Sub_metering_1","data$Sub_metering_2","data$Sub_metering_3"), 
       pch=c("-","-","-"), 
       col=c("black","red","blue"),
       lwd=4)
dev.copy(png,file="plot3.png")
dev.off()
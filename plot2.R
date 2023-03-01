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

# plot2.R
par(mfrow=c(1,1))
plot(data$date_time, data$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

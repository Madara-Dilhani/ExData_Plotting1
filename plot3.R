##########################################################################################################

## Coursera Exploratory Data Analysis Course Project 1

# plot3.R File

##########################################################################################################


## Reading full dataset
data_all <- read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(data$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(data$Datetime, subMetering2, type="l", col="red")
lines(data$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

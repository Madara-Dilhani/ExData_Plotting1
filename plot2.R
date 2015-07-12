##########################################################################################################

## Coursera Exploratory Data Analysis Course Project 1

# plot2.R File

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

## Plot 2
png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
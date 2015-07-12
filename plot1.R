##########################################################################################################

## Coursera Exploratory Data Analysis Course Project 1

# plot1.R File

##########################################################################################################


## Reading full dataset
data_all <- read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Creating Plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
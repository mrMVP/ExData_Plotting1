## Getting full dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259, 
                   check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting required data
data_r <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data_r$Date), data_r$Time)
data_r$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data_r$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Saving to PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480, bg = "transparent")
dev.off()
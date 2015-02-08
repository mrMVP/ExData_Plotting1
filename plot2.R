Sys.setlocale("LC_TIME", "English")

## Getting full dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", nrows = 2075259, 
                   check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting required data
data_r <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data_r$Date), data_r$Time)
data_r$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data_r$Global_active_power ~ data_r$Datetime, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Saving to PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480, bg = "transparent")
dev.off()

Sys.getlocale("LC_TIME")
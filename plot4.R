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

## Plot 4
par(mfrow = c(2,2), mar = c(4,5,2,1), oma = c(0,0,2,0))
with(data_r, {
    plot(Global_active_power ~ Datetime, type = "l", 
         xlab = "", ylab = "Global Active Power")
    plot(Voltage ~ Datetime, type = "l", 
         xlab = "datetime", ylab = "Voltage")
    plot(Sub_metering_1 ~ Datetime, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, cex = .9, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type = "l", xlab = "datetime")
})

## Saving to PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480, bg = "transparent")
dev.off()

Sys.getlocale("LC_TIME")
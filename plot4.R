## Plot Number 4

## set the working directory to take data from and save images to
setwd("C:/Users/803181111/Documents/R/Coursera")

## read in the data
data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                      nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## create a subset of data by date required
sub_data <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))

## format the date and time
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## opens graphical device
png("plot4.png", height = 480, width = 480)

## sets the parameters for the graphical device plot
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), xpd = TRUE)

## define what needs plotting and the formatting of the plot
with(sub_data, {
    plot(
        Global_active_power~Datetime, 
        type = "l", 
        ylab = "Global Active Power", 
        xlab = ""
    )
    plot(
        Voltage~Datetime, 
        type = "l", 
        ylab = "Voltage", 
        xlab = "datetime"
    )
    plot(
        Sub_metering_1~Datetime, 
        type = "l", 
        ylab = "Energy Sub Metering", 
        xlab = ""
    )
    lines(Sub_metering_2~Datetime, col = 'Red')
    lines(Sub_metering_3~Datetime, col = 'Blue')
    legend(
        "topright", 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"), 
        lty = 1, 
        lwd = 2, 
        bty = "n"
    )
    plot(
        Global_reactive_power~Datetime, 
        type = "l", 
        ylab = "Global Reactive Power",
        xlab = "datetime"
    )
}
)
## closes the graphical device
dev.off()
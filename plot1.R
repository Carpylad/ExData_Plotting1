## Plot Number 1

## set the working directory to take data from and save images to
setwd("C:/Users/803181111/Documents/R/Coursera")

## read in the data
data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                      nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## create a subset of data by date required
sub_data <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))

## format the date
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")

## opens graphical device and assigns the file name and size
png("plot1.png", height = 480, width = 480)

## sets the parameters for the graphical device plot
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2))  

## define what needs plotting and the formatting of the plot
hist(sub_data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "Red")

## closes the graphical device
dev.off()
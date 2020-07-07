## reading data into a table
data1 <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subsetting data to two required dates
main_data <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")

main_data$Time <- paste(main_data$Date, main_data$Time, sep = " ")

## Conversion of Date and Time to Date/Time Class
main_data$Date <- as.Date(main_data$Date, "%d/%m/%Y")
main_data$Time <- strptime(main_data$Time, "%d/%m/%Y %H:%M:%S")

## opening a png graphic device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Plotting the graph
plot(main_data$Time, main_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## returning to screen
dev.off()
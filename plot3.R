## reading data into a table
data1 <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subsetting data to two required dates
main_data <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")

main_data$Time <- paste(main_data$Date, main_data$Time, sep = " ")

## Conversion of Date and Time to Date/Time Class
main_data$Date <- as.Date(main_data$Date, "%d/%m/%Y")
main_data$Time <- strptime(main_data$Time, "%d/%m/%Y %H:%M:%S")

## opening a png graphic device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Plotting the graph
plot(main_data$Time, main_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(main_data$Time ,main_data$Sub_metering_2, col = "red")
lines(main_data$Time ,main_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1 )

## returning to screen
dev.off()
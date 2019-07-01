### Plot 4 ### 

### Reading and selecting data for plot 4

setwd("C:/Users/santiago.sandoval/Documents/courseraR/exdata_data_household_power_consumption")
data <-  read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
objective_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

### Formating variables as date and time
objective_data$Date <- as.Date(objective_data$Date,format =  "%d/%m/%Y")
objective_data$Time <- strptime(objective_data$Time, format = "%H:%M:%S")
objective_data[1:1440,"Time"] <- format(objective_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
objective_data[1441:2880,"Time"] <- format(objective_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

### Ploting four graphs and exporting them as .png

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(objective_data$Time, as.numeric(objective_data$Global_active_power), type="l", col="black", ylab = "Global Active Power (kilowatts)", xlab="")

plot(objective_data$Time, as.numeric(objective_data$Voltage), type="l", col="black", ylab = "Voltage", xlab="datetime")

plot(objective_data$Time, as.numeric(objective_data$Sub_metering_1), type="n", ylab = "Energy sub metering", xlab="")
with(objective_data, lines(Time, as.numeric(objective_data$Sub_metering_1), col="black"))
with(objective_data, lines(Time, as.numeric(objective_data$Sub_metering_2), col="red"))
with(objective_data, lines(Time, as.numeric(objective_data$Sub_metering_3), col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)

plot(objective_data$Time, as.numeric(objective_data$Global_reactive_power), type="l", col="black", ylab = "Global_reactive_power", xlab="datetime")

dev.off()

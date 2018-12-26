rm(list=ls())

# Read data file
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
# Subset data between 1/2/2007 and 2/2/2007 for 2-day analysis
data_subset <- subset(data, Date %in% c('1/2/2007','2/2/2007'))
# Set date format
data_subset$Date <- as.Date(data_subset$Date, format=c('%d/%m/%Y'))
data_subset$datetime <- paste(data_subset$Date, data_subset$Time)
data_subset$datetime <- as.POSIXct(data_subset$datetime)

# Save as a 480x480 png file
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
# Create line graph with sub metering
with(data_subset, {
  plot(Global_active_power ~ datetime, type='l', ylab = 'Global Active Power', xlab = '')
  plot(Voltage ~ datetime, type='l', ylab = 'Voltage', xlab = '')
  plot(Sub_metering_1 ~ datetime, type='l', ylab = 'Energy sub metering', xlab = '')
  lines(Sub_metering_2 ~ datetime, col = 'Red')
  lines(Sub_metering_3 ~ datetime, col = 'Blue')
  legend('topright', lty=1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(Global_reactive_power ~ datetime, type='l', ylab = 'Global_reactive_power', xlab = 'datetime')
  })
dev.off()

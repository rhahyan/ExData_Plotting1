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
png('plot2.png', width=480, height=480)
# Create line graph
with(data_subset,
  plot(Global_active_power ~ datetime, type='l',
       ylab='Global Active Power (kilowatts)', xlab=''))
dev.off()

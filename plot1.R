rm(list=ls())

# Read data file
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
# Subset data between 1/2/2007 and 2/2/2007 for 2-day analysis
data_subset1 <- subset(data, Date %in% c('1/2/2007','2/2/2007'))
# Set date format
data_subset1$Date <- as.Date(data_subset1$Date, format=c('%d/%m/%Y'))

# Save as a 480x480 png file
png('plot1.png', width=480, height=480)
# Create histogram
hist(data_subset1$Global_active_power, main ='Global Active Power',
     xlab = 'Global Active Power (kilowatts)', col = 'Red')
dev.off()

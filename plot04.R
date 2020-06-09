# plot 2

db <- read.table('household_power_consumption.txt', header = T, sep = ';') # reading data

db$Date <- as.Date(db$Date, ' %d/%m/%Y') # recode date
db <- db %>% filter(Date >= '2007-02-01')
db <- db %>% filter(Date <= '2007-02-02') 
db$DateTime <- as.POSIXct(paste(db$Date, db$Time))


png(file = 'plot4.png', width = 490, height = 480)
par(mfcol = c(2, 2))

with(db, plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'line'))

with(db, plot(DateTime, Sub_metering_1, 
              xlab = '', ylab = 'Energy sub metering', 'n'
))
with(db, points(DateTime, Sub_metering_1, type = 'line', col = 'black'))

with(db, points(DateTime, Sub_metering_2, type = 'line', col = 'red'))

with(db, points(DateTime, Sub_metering_3, type = 'line', col = 'blue'))

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2',
                              'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = c(1, 1, 1))


with(db, plot(DateTime, Voltage, type = 'line',
              xlab = 'datetime'))

with(db, plot(DateTime, Global_reactive_power, type = 'line',
              xlab = 'datetime'))

dev.off()
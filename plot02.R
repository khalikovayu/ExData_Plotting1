# plot 2

db <- read.table('household_power_consumption.txt', header = T, sep = ';') # reading data

db$Date <- as.Date(db$Date, ' %d/%m/%Y') # recode date
db <- db %>% filter(Date >= '2007-02-01')
db <- db %>% filter(Date <= '2007-02-02') 
db$DateTime <- as.POSIXct(paste(db$Date, db$Time))


png(file = 'plot2.png', width = 480, height = 480)
with(db, plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'line'))
dev.off()
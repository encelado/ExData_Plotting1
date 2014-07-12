#
# Coursera: Exploratory Data Analysis, 
#           by Roger D. Peng,
#           Bloomberg School of Public Health
#
# Peer Assessment 1
#
# File: plot3.R
#

# read the dataset
filename <- "household_power_consumption.subset.txt"

if(!file.exists(filename)) {
  source("load_dataset.R")
  dataset <- loadDataset()
}

if(!exists('dataset')) {
  dataset <- read.table(
    filename, 
    header=TRUE, 
    sep=";", 
    colClasses=c('POSIXct', rep('character',2), rep('numeric',7)) )
}

# plot and save the figure
png(filename="plot3.png", width=480, height=480)

with(dataset, {
  plot(datetime, sub_metering_1, 
       xlab="",
       ylab="Energy sub metering",
       type="n")
  lines(datetime, sub_metering_1, col='black') #,type="l")
  lines(datetime, sub_metering_2, col='red')
  lines(datetime, sub_metering_3, col='blue')
  
  legend('topright', 
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
         col=c('black','blue','red'),
         lty=1)
})

dev.off()
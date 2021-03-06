#
# Coursera: Exploratory Data Analysis, 
#           by Roger D. Peng,
#           Bloomberg School of Public Health
#
# Peer Assessment 1
#
# File: plot2.R
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
png(filename="plot2.png", width=480, height=480)

with(dataset, {
  plot(datetime, global_active_power, 
       xlab="",
       ylab="Global Active Power [kilowatts]",
       type='l')
})

dev.off()
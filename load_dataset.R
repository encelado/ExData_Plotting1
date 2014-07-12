#
# Coursera: Exploratory Data Analysis, 
#           by Roger D. Peng,
#           Bloomberg School of Public Health
#
# Peer Assessment 1
#
# File: load_dataset.R
#

loadDataset <- function() {
  # read dataset
  filename <- "household_power_consumption.txt"
  
  dataset <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=';')
  colnames(dataset) <-names(read.table(filename, header=TRUE, sep=";", nrows=1))
  
  # clean data
  names(dataset) <- tolower(names(dataset))
  dataset$date <- as.Date(dataset$date, "%d/%m/%Y")
  
  # add datetime var to the dataset for plot 2 and 4
  datetime <- strptime(paste(dataset$date, dataset$time), "%Y-%m-%d %H:%M:%S")
  dataset <- cbind(datetime, dataset)
  
  write.table(dataset, "household_power_consumption.subset.txt", row.names=FALSE, sep=";")
  
  dataset
}

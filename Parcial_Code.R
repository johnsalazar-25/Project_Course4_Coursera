#Import Datase
library(readr)
Household <- read_delim("~/Desktop/Programas_R/Course_4/household_power_consumption.txt", ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

#Create a superior and inferior limit.
Inferior <- as.numeric(as.Date("2007-02-01"))
Superior <- as.numeric(as.Date("2007-02-02"))
install.packages("pacman")
install.packages("rvest")
install.packages("stringr")
install.packages("RJSONIO")

install.packages("jsonlite")



library(jsonlite)
rates <- fromJSON("https://api.eremit.com.my/EremitService.svc/GetExchangeRates")
rates_df <- subset(data.frame(rates), select = c(2,4,5))
System_Time <- Sys.time()
st_df <- data.frame(System_Time)

filename1 <- paste(getwd(),"/summ_PHP.txt",sep = "")
summ <- read.table(filename1, header = T, sep = "\t")

rate_PHP <- cbind(rates_df[9,],System_Time)
filename2 <- paste(getwd(),"/today_PHP.txt",sep = "")
write.table(rate_PHP, file=filename2, row.names = FALSE, sep = '\t')

today <- read.table(filename2, header = T, sep = "\t")
summ <- rbind(summ, today)
write.table(summ, file=filename1, row.names = FALSE, sep = '\t')



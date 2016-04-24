library(plyr)
df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE) ##read file
df_filter <- subset(df,Date=="1/2/2007" | Date =="2/2/2007")  ##get nedded data
df_filter <- mutate(df_filter, Datetime = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")) ##prepare data for plotting
df_filter <-mutate(df_filter,Global_active_power = as.numeric(as.character(Global_active_power)))
png("plot2.png")  ##create file for plot
with(df_filter,plot(Datetime,Global_active_power,type = 'l', ylab = "Global active power (kilowwats)",main = ""))  ##draw plot
dev.off() ##close connection
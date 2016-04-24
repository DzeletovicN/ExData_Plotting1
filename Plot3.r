library(plyr)
df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE) ##read file with data
df_filter <- subset(df,Date=="1/2/2007" | Date =="2/2/2007") ##get needed data
df_filter <- mutate(df_filter, Datetime = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S")) ##prepare data for plot
df_filter <-mutate(df_filter,Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
df_filter <-mutate(df_filter,Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
png("plot3.png") ##create file fo plot drawing
##drawing plot
with(df_filter,plot(Datetime,Sub_metering_1,type = "l",main = "", ylab = "Energy dub metering", xlab = ""))
with(df_filter,points(Datetime,Sub_metering_2,type = "l", col  = "red"))
with(df_filter,points(Datetime,Sub_metering_3,type = "l", col  = "blue"))
legend("topright",pch = "-", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() ##close connection
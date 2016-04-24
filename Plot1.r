library(plyr)
df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE) ##readfile
df_filter <- subset(df,Date=="1/2/2007" | Date =="2/2/2007") ##get nedded data
df_filter <-mutate(df_filter,Global_active_power = as.numeric(as.character(Global_active_power))) ##prepare data for plotting
png("plot1.png") ##create plot file
hist(df_filter$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power(kilowatts)") ##drawplot
dev.off()  ##close connecction


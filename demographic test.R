
#get csv file
getwd()
setwd("C:\\ÎÄµµ\\ÓïÑÔ\\¼ÆËã»ú\\R\\data frame")
data <- read.csv("P2-Section5-Homework-Data.csv")
head(data)
tail(data)

#split the data into 1930 and 2013

table1960 <- data[data$Year == "1960",]
table2013 <- data[data$Year == "2013",]
head(table1960)
tail(table1960)
head(table2013)
tail(table2013)

#get vector file and rename col

mydf <- data.frame(Country_Code,Life_Expectancy_At_Birth_1960,Life_Expectancy_At_Birth_2013)
colnames(mydf) <- c("Country_Code","Life_1960","Life_2013")
head(mydf)

#merge data 1960

merged1960 <- merge(table1960, mydf, by.x = "Country.Code", by.y = "Country_Code")
merged1960$Life_2013 <- NULL
merged1960$Year <- NULL
head(merged1960)

#merge data 2013

merged2013 <- merge(table2013, mydf, by.x = "Country.Code", by.y = "Country_Code")
head(merged2013)
merged2013$Life_1960 <- NULL
merged2013$Year <- NULL
head(merged2013)

#qplot1960

qplot(data = merged1960, x = Fertility.Rate, y = Life_1960,
      color = Region, size = I(4),
      alpha = I(0.6))

#qplot2013

qplot(data = merged2013, x = Fertility.Rate, y = Life_2013,
      color = Region, size = I(4),
      alpha = I(0.6))









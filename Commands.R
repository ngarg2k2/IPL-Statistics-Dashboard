Table1<-read.csv(file.choose(), header=T)
str(Table1)
Table2<-read.csv(file.choose(), header=T)
str(Table2)
Table3<-read.csv(file.choose(), header=T)
str(Table3)
Table4<-merge(Table1,Table2)
str(Table4)
Table5<-merge(Table3,Table4)
str(Table5)


ipl_data <- read.csv(file.choose(), header=T)
head(ipl_data)
dim(ipl_data)

complete.cases(ipl_data)
ipl_data_cleaned<-complete.cases(ipl_data)

ipl_data<-ipl_data[ipl_data_cleaned,]
head(ipl_data)
complete.cases(ipl_data)
dim(ipl_data)

str(ipl_data)

sum(is.na(ipl_data$Runs))
ipl_data<-ipl_data[1:ncol(ipl_data)-1]
str(ipl_data)


for (i in 1:nrow(ipl_data)) {
  if(!typeof(ipl_data$BattingAverage[i])=='double')
  {
    print('Value wrong at=')
    print(i)
  }
}

for (i in 1:nrow(ipl_data)) {
  if(!typeof(ipl_data$Fifties[i])=='double')
  {
    print('Value wrong at=')
    print(i)
  }
}


for (i in 1:nrow(ipl_data)) {
  if(!typeof(ipl_data$Runs[i])=='integer')
  {
    print('Value wrong at=')
    print(i)
  }
}


df<-read.csv(file.choose(), header=T)
head(df)


#1
summary(df)

#2
ans<-factor(df$PlayerName)
table(ans)

ans<-factor(df$TeamName)
table(ans)


library(dplyr)
#3
df %>% group_by(PlayerName) %>% summarise(sum(Runs))

#4
df %>% group_by(TeamName) %>% summarise(sum(Fours))
df %>% group_by(TeamName) %>% summarise(sum(Sixes))

#5
df %>% group_by(Season) %>% summarise(sum(Catches)+sum(Stumping))

#6
ans<-subset(df,BattingAverage==0 & BowlingAverage==0 & Fours==0 & Sixes==0,select=c(PlayerName,TeamName,Season))
ans

library(ggplot2)
library(readr)
library(gridExtra)
library(grid)
library(plyr)

iris=read.csv('/home/kunal/Documents/DS/Iris/iris/Iris.csv')
data(iris)
summary(iris)
iris[sample(nrow(iris),10),]

HisSl <- ggplot(data=iris,aes(x=SepalLengthCm))+geom_histogram(binwidth = 0.2,color="black",aes(fill=Species))+
                                                                  xlab("Sepal Lenght (cm)") +
                                                                  ylab("Frequency")+
                                                                  theme(legend.position ="none")+
                                                                  ggtitle("Histogram of Sepal Length")+
                                                                  geom_vline(data=iris,aes(xintercept= mean(SepalLengthCm)),
                                                                             linetype="dashed",color="red")+
                                                                 geom_vline(data=iris,aes(xintercept= median(SepalLengthCm)),
                                                                           linetype="dashed",color="blue")
            
HisSl
                                                                 
HistSw <- ggplot(data=iris,aes(x=SepalWidthCm)) +
  geom_histogram(binwidth = 0.2,color="black",aes(fill=Species)) +
  
  xlab("Sepal Width (cm)") +
  ylab("Frequency") +
  theme(legend.position = "none") +
  ggtitle("Histogram of Sepal Width") +
  geom_vline(data=iris,aes(xintercept=mean(SepalWidthCm)),linetype="dashed",color="red")

HistPl <- ggplot(data=iris,aes(x=PetalLengthCm)) +
  geom_histogram(binwidth = 0.2,color="black",aes(fill=Species)) +
  xlab("Petal Length (cm)") +
  ylab("Frequency") +
  theme(legend.position = "none") +
  ggtitle("Histogram of Petal Length") +
  geom_vline(data=iris,aes(xintercept=mean(PetalLengthCm)),
             linetype="dashed",color="red")

HistPw <- ggplot(data=iris,aes(PetalWidthCm)) +
  geom_histogram(binwidth = 0.2,color="black",aes(fill=Species)) +
  xlab("Petal Width (cm)") +
  ylab("Frequency") +
  theme(legend.position = "none") +
  ggtitle("Histogram of Petal Width") +
  geom_vline(data=iris,aes(xintercept=mean(PetalWidthCm)),
             linetype="dashed",color="red")


grid.arrange(HisSl+ggtitle(""),
             HistSw+ggtitle(""),
             HistPl+ggtitle(""),
             HistPw+ggtitle(""),
             nrow=2,
             top=textGrob("Iris Frequency Histogram Table",gp=gpar(fontsize=15)))                                                              

plot(iris)       

names(iris) <- tolower(names(iris))
data(iris)
summary(iris)

library(dplyr)
virginica <- filter(iris,iris$Species == "virginica")

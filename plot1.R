## plot the PM emissions by year.
scc<-readRDS('summarySCC_PM25.rds')
ye2<-aggregate(Emissions~year,scc,sum)
png('plot1.png')
plot(ye2,type='l',xlab='Year',ylab='Emissions (tons)')
dev.off()
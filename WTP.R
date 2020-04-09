# Load packages

setwd("C:/WTP")
require("mlogit")
DataWTP_R <-read.csv("DataWTP_R.csv")
DataWTP <- mlogit.data(DataWTP_R, choice = "Choice", shape = "long", chid.var="Experiment", alt.var = "Project")

#MNL
ml.Project<-mlogit(Choice ~ Cost + Satisfaction | -1, DataWTP)
summary(ml.Project)
coef(ml.Project)[-1]/coef(ml.Project)[1]

z <- with(DataWTP, data.frame(Cost = tapply(Cost, index(m)$alt, mean),
                           Satisfaction = tapply(Satisfaction, index(m)$alt, mean)))


#Nested Logit
nl.Project<-mlogit(Choice ~ Cost + Satisfaction, DataWTP, nests=list(Current="0", Improved=c("1","2","3")), unscaled=TRUE) 
summary(nl.Project)
lrtest(nl.Project)
waldtest(nl.Project)
scoretest (nl.Project, nests=list(Current="0", Improved=c("1","2","3")))

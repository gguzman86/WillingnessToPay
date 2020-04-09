# Load packages

setwd("C:/Users/qproject-hp/Desktop/Proyectos/El Piojo/Informe 1 Rev B/ANEXO Encuestas/Análisis")
require("mlogit")
DataDAP_R <-read.csv("DataDAP_R.csv")
DataDAP <- mlogit.data(DataDAP_R, choice = "Choice", shape = "long", chid.var="Experiment", alt.var = "Project")

#MNL
ml.Project<-mlogit(Choice ~ Cost + Satisfaction | -1, DataDAP)
summary(ml.Project)
coef(ml.Project)[-1]/coef(ml.Project)[1]

z <- with(DataDAP, data.frame(Cost = tapply(Cost, index(m)$alt, mean),
                           Satisfaction = tapply(Satisfaction, index(m)$alt, mean)))


#Nested Logit
nl.Project<-mlogit(Choice ~ Cost + Satisfaction, DataDAP, nests=list(Actual="0", Mejorado=c("1","2","3")), unscaled=TRUE) 
summary(nl.Project)
lrtest(nl.Project)
waldtest(nl.Project)
scoretest (nl.Project, nests=list(Actual="0", Mejorado=c("1","2","3")))
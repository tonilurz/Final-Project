library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("psych")
library("Hmisc")

# Data Wrangle and Transformation
summary(ChicagoPublicSchools)

#New Data Set for Analysis
ChiData1 <- subset(ChicagoPublicSchools,select = c(`School ID`, `ZIP Code`, `CPS Performance Policy Level`, `Supportive Environment`,`Effective Leaders`,`Ambitious Instruction`, `Safe`, `School Community`,`Quality of Facilities`,
             `NWEA Math Growth Percentile All Grades`, `NWEA Reading Growth Percentile All Grades`,`NWEA Math Attainment Percentile All Grades`, `NWEA Reading Attainment Percentile All Grades`,`Suspensions Per 100 students 2013`,`Student Attendance Percentage 2013`,
             `Grade 3-8 On-Track Percentage 2013`))
# Preparing Data for Regression Models
str(ChiData1)
ChiData1$`CPS Performance Policy Level`= as.numeric(ChiData1$`CPS Performance Policy Level`)
ChiData1$`Supportive Environment`= as.numeric(ChiData1$`Supportive Environment`)
ChiData1$`Effective Leaders` = as.numeric(ChiData1$`Effective Leaders`)
ChiData1$`Ambitious Instruction`= as.numeric(ChiData1$`Ambitious Instruction`)
ChiData1$`Safe`= as.numeric(ChiData1$`Safe`)
ChiData1$`School Community`= as.numeric(ChiData1$`School Community`)
ChiData1$`Quality of Facilities`= as.numeric(ChiData1$`Quality of Facilities`)
str(ChiData1)
na.omit(ChiData1)

# Backwards Stepwise Regression Model
FitAll = lm(`CPS Performance Policy Level` ~ ., data = ChiData1)
summary(FitAll)






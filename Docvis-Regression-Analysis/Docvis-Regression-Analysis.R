install.packages("devtools")
library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)

data(rwm88, package = "POE5Rdata")
View(rwm88)

mod1 <- lm(docvis ~ female + hhkids + married + self + educ2 + hhninc2 + public / (female + hhkids + married + self + educ2 + hhninc2), data = rwm88)
(smod1 <- summary(mod1))

library(car)
Hnull <- c("public=0", "female:public=0")
linearHypothesis(mod1, Hnull, signif = F)

Hnull <- c("public=0", "female:public=0", "hhkids:public=0", "married:public=0", "self:public=0", "educ2:public=0")
linearHypothesis(mod1, Hnull, signif = F)

mod1 <- lm(docvis ~ female + hhkids + married + self + educ2 + hhninc2 + public, data = rwm88)
(smod1 <- summary(mod1))

mod2 <- lm(docvis ~ female + hhkids + married + self + educ2 + hhninc2 + public / (married), data = rwm88)
(smod1 <- summary(mod2))

mod2 <- lm(docvis ~ female + hhkids + married + self + educ2 + hhninc2, data = rwm88)
(smod1 <- summary(mod2))

mod3 <- lm(docvis ~ female + hhkids + married + self + educ2 + hhninc2 + public / (hhninc2), data = rwm88)
(smod1 <- summary(mod3))

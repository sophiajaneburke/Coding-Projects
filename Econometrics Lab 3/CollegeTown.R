library(POE5Rdata)
data(collegetown)
View(collegetown)
summary(collegetown)

#1: log liniear

mod1<- lm(log(price) ~ sqft, data=collegetown) 
b1<-coef(mod1)[1]
b2<-coef(mod1)[2]
(smod1 <- summary(mod1))
#Confidence Interval
confint(mod1)
#ii generalized R2 for regression 1
priceh1 <- exp(mod1$fitted.values) 
(genR21 <- cor(priceh1,collegetown$price)^2) #this gives you the value of sqft or R^2
#iii: plots of fitted values and residuals to show what's wrong with lines

plot(collegetown$sqft, collegetown$price, xlab="Square Feet in hundreds", ylab = "Price in Thousands")
curve(exp(b1+b2*x), add=TRUE)
#plot residuals
ehat1 <- mod1$residuals
plot(collegetown$sqft, ehat1, ylab="Residuals Log-Linear")
abline(0,0)
#iv histograms of residuals
hist(ehat1, freq=FALSE, ylab="density", xlab="ehat1")
curve(dnorm(x,mean(ehat1), sd(ehat1)), add=TRUE)

#2: linear model

mod2 <- lm(price ~ sqft, data=collegetown)
d1<-coef(mod2)[1]
d2<-coef(mod2)[2]
(smod2 <- summary(mod2))

#Confidence Interval 
confint(mod2)

#ii generalized R2 for regression 1
priceh2 <- mod2$fitted.values 
(genR22 <- cor(priceh2,collegetown$price)^2) #this gives you the value of sqft or R^2
#iii: plots of fitted values and residuals to show what's wrong with lines
plot(collegetown$sqft, collegetown$price, xlab="Square Feet in Hundreds", ylab = "Price in Thousands")
curve(d1+d2*x, add=TRUE)
#plot residuals
ehat2 <- mod2$residuals
plot(collegetown$sqft, ehat2, ylab="Residuals Linear")
abline(0,0)
#iv histograms of residuals
hist(ehat2, freq=FALSE, ylab="density", xlab="ehat2")
curve(dnorm(x,mean(ehat2), sd(ehat2)), add=TRUE)

#3: log-log model
mod3 <- lm(log(price) ~ log(sqft), data = collegetown)
summary(mod3)

#confidence interval for β2
confint(mod3)

# ii generalized R2
priceh3 <- exp(mod3$fitted.values)
(genR23 <- cor(priceh3, collegetown$price)^2)

# plot data and regression curve
plot(log(collegetown$sqft), log(collegetown$price),
     xlab="log(Square Feet)", ylab="log(Price)")
abline(mod3, col="blue", lwd=2)

# iii residual plot
ehat3 <- mod3$residuals
plot(log(collegetown$sqft), ehat3, ylab="Residuals (Log-Log)")
abline(0,0)

# iv histogram of residuals
hist(ehat3, freq=FALSE, main="Residuals: Log-Log Model", xlab="ehat3")
curve(dnorm(x, mean(ehat3), sd(ehat3)), add=TRUE, col="blue")

#4: quadratic model
mod4 <- lm(price ~ sqft + I(sqft^2), data = collegetown)
summary(mod4)

#Confidence intervals for β2 (sqft^2 term)
confint(mod4)

# plot data and regression curve
plot(collegetown$sqft, collegetown$price,
     xlab="Square Feet (hundreds)", ylab="Price (Thousands)")
curve(coef(mod4)[1] + coef(mod4)[2]*x + coef(mod4)[3]*x^2, add=TRUE, col="red", lwd=2)

# iii residual plot
ehat4 <- mod4$residuals
plot(collegetown$sqft, ehat4, ylab="Residuals Quadratic")
abline(0,0)

# iv histogram of residuals
hist(ehat4, freq=FALSE, main="Residuals: Quadratic Model", xlab="ehat4")
curve(dnorm(x, mean(ehat4), sd(ehat4)), add=TRUE, col="red")



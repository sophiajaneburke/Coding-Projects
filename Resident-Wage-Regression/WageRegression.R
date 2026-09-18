install.packages("devtools")
library(devtools)
install_github("ccolonescu/POE5Rdata")
library(POE5Rdata)

# Load data
data(cps5, package = "POE5Rdata")

par(mar = c(4, 4, 2, 1))   # Reset default margins

# Quick histograms
hist(cps5$educ, main = "Education Distribution", xlab = "Years of Education")
hist(cps5$exper, main = "Experience Distribution", xlab = "Years of Experience")
hist(cps5$wage, freq = FALSE, main = "Wage Distribution")
hist(log(cps5$wage), freq = FALSE, main = "Log Wage Distribution")

# Run the regression
mod1 <- lm(log(wage) ~ educ + I(educ^2) + exper + I(exper^2) + I(educ * exper), data = cps5)
summary(mod1)

# Store coefficients
b <- coef(mod1)
b1 <- b[1]; b2 <- b[2]; b3 <- b[3]; b4 <- b[4]; b5 <- b[5]; b6 <- b[6]

# 2. Marginal Effects
MEeduc <- b2 + 2*b3*cps5$educ + b6*cps5$exper
summary(MEeduc)
hist(MEeduc, main = "Marginal Effect of Education", xlab = "ME_educ")

MExper <- b4 + 2*b5*cps5$exper + b6*cps5$educ
summary(MExper)
hist(MExper, main = "Marginal Effect of Experience", xlab = "ME_exper")

# ME of education at educ = 13 and exper = 5, 6, 7
ME_13_5 <- b2 + 2*b3*13 + b6*5
ME_13_6 <- b2 + 2*b3*13 + b6*6
ME_13_7 <- b2 + 2*b3*13 + b6*7

ME_13_5
ME_13_6
ME_13_7

# Change in ME as experience increases (Should equal b6)
ME_13_6 - ME_13_5
ME_13_7 - ME_13_6
b6  # confirms that the change equals the interaction coefficient

# 4. Check diminishing returns to experience
b5  # If negative → ME of experience decreases as experience increases

# 5. Hypothesis test: MEeduc at (educ=15, exper=2) >= 0.10
ME_test <- b2 + 2*b3*15 + b6*2

vc <- vcov(mod1)
a <- 1       # coefficient on b2
d <- 2*15    # coefficient on b3
c <- 2       # coefficient on b6

var_ME <- a^2*vc[2,2] + c^2*vc[6,6] + d^2*vc[3,3] + 
  2*a*d*vc[2,3] + 2*a*c*vc[2,6] + 2*c*d*vc[3,6]

t_stat <- (ME_test - 0.10) / sqrt(var_ME)
t_stat

# Re-run marginal effects (if needed)
MEeduc <- b2 + 2*b3*cps5$educ + b6*cps5$exper
summary(MEeduc)
hist(MEeduc)

MExper <- b4 + 2*b5*cps5$exper + b6*cps5$educ
summary(MExper)
hist(MExper)
## =========================
## LAB — using your mod1 on cps5
## =========================

# ---- 1) Joint relevance test for experience (matches lab’s “3 in the null”) ----
# H0: β_exper = β_{exper^2} = β_{educ·exper} = 0
# HA: at least one ≠ 0
if (!requireNamespace("car", quietly = TRUE)) install.packages("car")
library(car)

cat("\n=== Joint F-test: exper relevance (exper, exper^2, educ×exper) ===\n")
lh_out <- linearHypothesis(
  mod1,
  c("exper = 0", "I(exper^2) = 0", "I(educ * exper) = 0"),
  test = "F"
)
print(lh_out)
# Conclude based on the p-value: p < .05 → reject H0 (experience matters)

# ---- 2) Restricted regression and manual F (should match linearHypothesis) ----
# Restricted model drops exper, exper^2, and the interaction
mod0 <- lm(log(wage) ~ educ + I(educ^2), data = cps5)

SSR_u <- sum(resid(mod1)^2)     # unrestricted SSR
SSR_r <- sum(resid(mod0)^2)     # restricted SSR
n     <- nobs(mod1)
k_u   <- length(coef(mod1))     # #params in unrestricted (incl intercept)
q     <- 3                      # number of restrictions

F_manual <- ((SSR_r - SSR_u) / q) / (SSR_u / (n - k_u))
p_manual <- pf(F_manual, df1 = q, df2 = (n - k_u), lower.tail = FALSE)

cat("\n=== Manual F (restricted vs unrestricted) ===\n")
cat(sprintf("F = %.6f, df1 = %d, df2 = %d, p-value = %.6g\n",
            F_manual, q, n - k_u, p_manual))
cat("→ This should match the F from linearHypothesis (up to rounding).\n")

# ---- 3) AIC/BIC model selection: full mod1 vs restricted mod0 ----
cat("\n=== AIC comparison ===\n"); print(AIC(mod1, mod0))
cat("\n=== BIC comparison ===\n"); print(BIC(mod1, mod0))
# Lower AIC/BIC → preferred model

# (Optional) One-sided p-value for your ME test at (educ=15, exper=2)
# You computed t_stat = (ME - 0.10)/SE; for H0: ME >= 0.10 vs HA: ME < 0.10:
df_t <- n - k_u
p_one_sided <- pt(t_stat, df = df_t, lower.tail = TRUE)
cat(sprintf("\nOne-sided p-value for ME_educ(15,2) ≥ 0.10 test: %.6g (df = %d)\n",
            p_one_sided, df_t))

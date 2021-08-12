#Simulation of MA(1) process
sigma2 <- 1.0
alpha1 <- 0.5
y0 <- 0.0
T <-100
y <- rep(y0, T)
epsilon <- rnorm(T)*sqrt(sigma2)
for (t in 2:T) {
  y[t] <- alpha1*epsilon[t-1] + epsilon[t] }
plot(y, type="l")

#Simulation of AR(1) process
T <- 100
sigma2 <- 1.0
theta1 <- 0.5
y0 <- 0.0
y <- rep(y0, T)
epsilon <- rnorm(T)*sqrt(sigma2)
for (t in 2:T) {
  y[t] <- theta1*y[t-1] + epsilon[t] }
plot(y, type = "l")

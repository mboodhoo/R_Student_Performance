# Multiple Linear Regression

# creating vectors for fit testing on the training data
x1.tr = as.vector(performance.data.training$`Hours Studied`)
x2.tr = as.vector(performance.data.training$`Previous Scores`)
x3.tr = as.vector(performance.data.training$`Extracurricular Activities`)
x4.tr = as.vector(performance.data.training$`Sleep Hours`)
x5.tr = as.vector(performance.data.training$`Sample Question Papers Practiced`)
y.tr = as.vector(performance.data.training$`Performance Index`)
f.x3.tr = as.factor(x3.tr)

# creating vectors for prediction testing on the test data
x1.te = as.vector(performance.data.test$`Hours Studied`)
x2.te = as.vector(performance.data.test$`Previous Scores`)
x3.te = as.vector(performance.data.test$`Extracurricular Activities`)
x4.te = as.vector(performance.data.test$`Sleep Hours`)
x5.te = as.vector(performance.data.test$`Sample Question Papers Practiced`)
y.te = as.vector(performance.data.test$`Performance Index`)
f.x3.te = as.factor(x3.te)

df.tr = data.frame(Y = y.tr, X1 = x1.tr, X2 = x2.tr, X3 = f.x3.tr,
                   X4 = x4.tr, X5 = x5.tr)
df.te = data.frame(Y = y.te, X1 = x1.te, X2 = x2.te, X3 = f.x3.te,
                   X4 = x4.te, X5 = x5.te)

# Multiple linear regression model
model1 = lm(Y ~., data = df.tr)
summary(model1)

# Variable selection using AIC
step_model = stepAIC(model1, direction = "both", trace = TRUE)

# Variance inflation factor to check for multicollinearity
vif(model1)

# Reduced model with only highly correlated variables
model2 = lm(Y ~ X1 + X2, data = df.tr)
summary(model2)

# Analysis of Variance Table comparing both models
anova(model2, model1)
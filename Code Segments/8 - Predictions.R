# Predictive Accuracy

# Obtaining the predicted values using the test set for both models
pre1 = predict(model1, newdata = df.te)
pre2 = predict(model2, newdata = df.te)

# Creating functions to calculate Root Mean Square Error (RMSE),
# Mean Absolute Error (MAE), and Mean Absolute Percentage Error (MAPE)

RMSE = function(obs, pred) {
  se = (obs - pred)^2
  mse = mean(se)
  rmse = sqrt(mse)
  return(round(rmse, 3))
}

MAE = function(obs, pred) {
  ae = abs(obs - pred)
  mae = mean(ae)
  return(round(mae, 3))
}

MAPE = function(obs, pred) {
  ape = abs((obs - pred)/obs)
  mape = mean(ape) * 100
  paste0(round(mape, 3), '%')
}

rmse1 = RMSE(df.te$Y, pre1)
rmse2 = RMSE(df.te$Y, pre2)

mae1 = MAE(df.te$Y, pre1)
mae2 = MAE(df.te$Y, pre2)

mape1 = MAPE(df.te$Y, pre1)
mape2 = MAPE(df.te$Y, pre2)

# Table of values of prediction criteria for both models
data.frame(model1 = c(rmse1, mae1, mape1), model2 = c(rmse2, mae2, mape2),
           row.names = c('RMSE', 'MAE', 'MAPE'))

# Using full model to predict score based on new data
newdata = data.frame(X1 = 5, X2 = 78, X3 = as.factor(0), X4 = 6, X5 = 3)
pre.new = predict(model1, newdata = newdata, interval = 'prediction')
pre.new
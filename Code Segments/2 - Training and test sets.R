# Creating training and test sets
set.seed(6)
index = sample(1:10000, 9000)
index = sort(index)
performance.data.training = performance.data[index,]
performance.data.test = performance.data[-index,]

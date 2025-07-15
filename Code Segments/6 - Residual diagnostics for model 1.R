# Residual Diagnostics for Model 1

# Normality

df.1 = data.frame(res1, fitted1)

# Histogram of residuals 
fig1 = ggplot(df.1, aes(x=res1)) +
  geom_histogram(aes(y = after_stat(density)), color = 'black', fill = 'white') +
  geom_density(color = 'red', fill = 'blue', alpha = 0.2) +
  labs(title = 'Histogram of Residuals with Density Overlay', x = 'Residuals') +
  theme(plot.title = element_text(size = 9))

# Normal Q-Q plot of residuals
fig2 = ggplot(df.1, aes(sample = res1)) +
  geom_qq() + geom_qq_line(color = 'blue') +
  labs(title = 'Normal Q-Q Plot', x = 'Theoretical Normal Quantiles',
       y = 'Sample Residual Quantiles')

grid.arrange(fig1, fig2, ncol=2)

# Mean of Zero

# Scatterplot of Residuals vs Index
index = 1:length(res1)
df.1$index = index
ggplot(df.1, aes(x = index, y = res1)) +
  geom_point() +
  geom_smooth(method = 'loess', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Residuals vs Index', x = 'Index', y = 'Residuals')

mean(res1)

# Constant Variance

# Residuals vs Fitted Values
ggplot(df.1, aes(x = fitted1, y = res1)) +
  geom_point() +
  geom_smooth(method = 'loess', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Residuals vs Fitted Values', x = 'Fitted Values',
       y = 'Residuals')

# Independence

data.frame(cor(x = res1, y = performance.data.training[,1:5]), row.names = c('res1'))

randtests::difference.sign.test(res1)
randtests::runs.test(res1)
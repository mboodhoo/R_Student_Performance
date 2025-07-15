# Residual Diagnostics for Model 2

# Normality

df.2 = data.frame(res2, fitted2)

# Histogram of residuals 
fig3 = ggplot(df.2, aes(x=res2)) +
  geom_histogram(aes(y = after_stat(density)), color = 'black', fill = 'white') +
  geom_density(color = 'red', fill = 'blue', alpha = 0.2) +
  labs(title = 'Histogram of Residuals with Density Overlay', x = 'Residuals') +
  theme(plot.title = element_text(size = 9))

# Normal Q-Q plot of residuals
fig4 = ggplot(df.2, aes(sample = res2)) +
  geom_qq() + geom_qq_line(color = 'blue') +
  labs(title = 'Normal Q-Q Plot', x = 'Theoretical Normal Quantiles',
       y = 'Sample Residual Quantiles')

grid.arrange(fig3, fig4, ncol=2)

# Mean of Zero

# Scatterplot of Residuals vs Index
index = 1:length(res2)
df.2$index = index
ggplot(df.2, aes(x = index, y = res2)) +
  geom_point() +
  geom_smooth(method = 'loess', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Residuals vs Index', x = 'Index', y = 'Residuals')

mean(res2)

# Constant Variance

# Residuals vs Fitted Values
ggplot(df.2, aes(x = fitted2, y = res2)) +
  geom_point() +
  geom_smooth(method = 'loess', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Residuals vs Fitted Values', x = 'Fitted Values',
       y = 'Residuals')

# Independence

data.frame(cor(x = res2, y = performance.data.training[,1:2]), row.names = c('res2'))

randtests::difference.sign.test(res2)
randtests::runs.test(res2)

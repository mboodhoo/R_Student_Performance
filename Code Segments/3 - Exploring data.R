# Correlation matrix
corrplot(cor(performance.data.training), method = 'circle', addCoef.col = 'red', 
         tl.col = 'black', tl.cex = 0.7, number.cex = 0.7, cl.cex = 0.7,
         bg = 'lightgrey')

# Scatterplot of Performance Index vs Hours Studied
x1 = performance.data.training$`Hours Studied`
y = performance.data.training$`Performance Index`

plot1 = ggplot(data = performance.data.training, aes(x=x1, y=y)) +
  geom_point(shape = 16) +
  geom_smooth(method = 'lm', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Performance vs Hours Studied', x = 'Hours Studied',
       y = 'Performance') +
  scale_x_continuous(breaks = seq(min(x1), max(x1), 1))

# Scatterplot of Performance Index vs Previous Scores
x2 = performance.data.training$`Previous Scores`
y = performance.data.training$`Performance Index`

plot2 = ggplot(data = performance.data.training, aes(x=x2, y=y)) +
  geom_point(shape = 16) +
  geom_smooth(method = 'lm', se = FALSE, colour = 'red', linewidth = 0.5) +
  labs(title = 'Scatterplot of Performance vs Previous Scores', x = 'Previous Scores',
       y = 'Performance')

grid.arrange(plot1, plot2, nrow = 2)

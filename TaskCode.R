#Date:July 31st, 2023
#Author:Stephanie Rosen
#Title: Research Assistant Imperial College

library(ggplot2)

#Creating dataframe ----

#Creating dataframe of staff from Imperial College. Column 1 will be 0 if they own a dog(group A), and 1 if they do not own a dog (group B). The following columns will be the individual's self-reported kindness on a scale of 1 to 100. The response variable will be a person's salary.)

dog = rbinom(100, 1, 0.7)
kindness =rnorm(100,70,10)
error=rnorm(100,0,150)

#Here will we simulate a dataset where the salary is a 100,000 pounds with a 4,000 pound increase if one has a dog and an extra 200 pounds for every point an individual gives themselves for kindness. We also add in an error term.

#declare dog as factor
dog <- as.factor(dog)

salary=100000+(4000*dog)+(200*kindness)+error


StaffData<- data.frame(
  dog,
  kindness,
  salary
)

remove(dog,kindness,salary)

#Investigating with statistical test

#Creating a pairs plot to investigate relationship

ggplot(StaffData, aes(x=dog, y = salary)) + geom_boxplot(fill = 'lightblue')



#Based on our pairs plot, we can assume a linear relationship. Let's use the lm function to assess the relationship and estimate the effects.
mod1 <- lm(salary~dog + kindness)
summary(mod1)


#scatterplot with regression line
ggplot(data = StaffData, aes(x = kindness, y = kindness)) +
  geom_point(aes(color = "blue")) +
  geom_smooth(method = "lm") 

#Note, we should also check the linear model assumptions before we can take these results

#We can also use a statistical test to look at the salary differences between dog owners and staff that do not have dogs.




ФИО = c("Иванов", "Петров", "Светлова")
возраст = c(17, 16, 18)
поступление = c(TRUE, FALSE, TRUE)


v = 1:15

mat = matrix(v, nrow = 3, ncol = 5)

mat = matrix(v, nrow = 3, ncol = 5, byrow = TRUE)


cbind(ФИО, возраст)

rbind(ФИО, возраст)


номер = 1:3


students = data.frame(номер, ФИО, возраст)

students = cbind(students, поступление)

students$поступление

library(readxl)
index <- read_excel("C:/GitHub/Chemezov_diary_Topic_Modeling/index.xls")
View(index)

i = index

summary(i)

sd(i$UK)

sd(i$UK) / mean(i$UK) * 100

install.packages("Hmisc")
library(Hmisc)

# корреляция

cor(i)

cor(i$UK, i$France)

cor.test(i$UK, i$France)

# удаляем столбец
i1 = i[ ,-1]

# корреляция имеет значение если показатель меньше 0.05
res = rcorr(as.matrix(i))
res
res$r

install.packages("corrplot")
library(corrplot)

corrplot(res$r, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)


corrplot(res$r, method = "number", type = "full", order = "hclust", tl.col = "black", tl.srt = 45)



# регрессия

reg = lm(i$UK~i$France + i$Germany)

summary(reg)


plot(i$France, i$Germany, col = "forestgreen", cex = 0.75, pch = 16, main = "Регрессия индексов", xlab = "Париж", ylab = "Берлин")

abline(lm(i$Germany~i$France), col = "red3")


install.packages("ggplot2")
library(ggplot2)

ggplot(i, aes(y = Germany, x = France))+geom_point()+geom_smooth(method = "lm")


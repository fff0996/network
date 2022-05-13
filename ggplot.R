library(ggplot2)
library(grid)
library(gridExtra)
library(dplyr)

#여러 그래프를 안 종이 안에 모두 그리기
rbc_var["pheno"] <- c("Red blood cell count")
tt %>% ggplot(aes(tile10,pheno_var)) + geom_point() + geom_line() + facet_wrap(~pheno)+scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10))
labs(x="Average of Max and Min Price", y="Maximum Horsepower")
#그룹별로 bar plot각각 그리기
ggplot(d,aes(x=factor(Group),y=mres2,fill=factor(subgroup),group=factor(subgroup))) + 
geom_bar(position="dodge", stat="identity",width = 0.7,size =.9 ) +
ylab("Mean Square of errors") + xlab("Decile of GPS") + ggtitle("Acohol-BMI") + scale_fill_brewer(name= "Decile of Alcohol")


ggplot(d,aes(x=factor(Group),y=var.of.res,fill=factor(subgroup),group=factor(subgroup))) +
geom_bar(position="dodge", stat="identity",width = 0.7,size =.9 ) + ylab("Variance of Residuals") + xlab("") + 
ggtitle("Alcohol-BMI") + scale_fill_discrete(name=" ",labels =c("Non-drinker","Moderate drinker","Severe drinker"))




#하나의 plot에 여러개 그리기
ggplot(tt,aes(x=x_seq,y=y_seq,color=Traits)) + geom_line()

ggplot(tt,aes(x=x_seq,y=y_seq,color=Traits)) + geom_line() + ylab("Probability Density") + xlab("Joint effect size")
#Residual plot그리기
mod <- lm(Y~X,data=homo)
ggplot(mod,aes(.fitted,.resid,group=1)) + geom_point()+ geom_hline(yintercept = 0) + labs(x="fitted values",y="residuals")


dd %>% ggplot() +  geom_bar(aes(tile10,dd_delta),position="dodge", stat="identity",width = 0.7,size =.9 ) + geom_point(aes(tile10,raw_G_res),group=1) + geom_line(aes(tile10,raw_G_res)) + scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10))

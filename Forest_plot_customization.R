library(ggplot2)
library(stringr)
library(dplyr)
library(forcats)
library(cowplot)


p1 <- mr2 |> 
mutate(name=fct_reorder(name,group)) |>
ggplot(aes(x=name,y=OR,ymin=ci1,ymax=ci2)) + 
geom_vline(aes(xintercept=name),col="grey95",size=5) +
geom_hline(yintercept = 1,lty=2) + 
geom_point() + 
geom_linerange() +
coord_flip() + 
labs(x=NULL,y=NULL)+
theme(plot.margin = margin(t=5,r=-4,b=9,l=5))




p2 <- mr2 |> 
mutate(name=fct_reorder(name,group),
OR=round(OR,2),
OR=str_pad(OR,width=4,side="right",pad="0"),
group=as.character(group),
#group=str_pad(group,width=4,side="right",pad="0"),
ci1 = round(ci1,2),
ci1 = as.character(ci1),
ci1 = ifelse(ci1 == "1","1.00",ci1),
ci1 = str_pad(ci1,width=4,side="right",pad="0"),
ci2 = round(ci2,2),
ci2 = as.character(ci2),
ci2 = ifelse(ci2 == "1","1.00",ci2),
ci2 = str_pad(ci2,width=4,side="right",pad="0"),
ci = str_c(ci1,", ", ci2))|>
#P = round(P,2),
#P= as.character(P),
#P= str_pad(P, width = 4, side = "right", pad = "0")) |>
ggplot(aes(x=name)) + 
geom_vline(aes(xintercept=name),col="grey95",size=5) + 
geom_text(aes(label=group,y=1))+
geom_text(aes(label=OR,y=1.07))+
geom_text(aes(label=ci,y=1.14))+
geom_text(aes(label=P,y=1.23))+
coord_flip(ylim = c(0.99, 1.3)) +
theme(axis.title = element_blank(),
axis.text = element_blank(),
axis.ticks = element_blank(),
axis.line.y = element_blank(),
panel.border = element_blank(), 
panel.grid = element_blank(), 
plot.background = element_blank(),
plot.margin = margin(t = 5, r = 5, b = 19.3, l = 0))

bottom_row <- plot_grid(p1, p2, nrow = 1, rel_widths = c(0.9, 0.3)) 

top_row <- ggplot(data=tibble()) + 
geom_text(aes(y=1,x=0.02,label="Risk factors"),size=5)+
geom_text(aes(y=1,x=0.80,label="Group"),size=5)+
geom_text(aes(y=1,x=0.855,label="OR"),size=5)+
geom_text(aes(y=1,x=0.91,label="95% CI"),size=5)+
geom_text(aes(y=1,x=0.98,label="P"),size=5)+
coord_cartesian(xlim = c(0, 1)) +
theme_void() +
theme(plot.margin = margin(t = 0, r = 5, b = 10, l = 5),
axis.line.x.bottom = element_line()
pdf("dd.pdf",width=15,height=20)
plot_grid(top_row, bottom_row, ncol = 1, rel_heights = c(0.05, 1))
dev.off()


png("plot.png",width=10000,height=4000,res=500)
plot_grid(top_row, bottom_row, ncol = 1, rel_heights = c(0.05, 1))
dev.off()


#reference : https://bggj.is/posts/forest-plot-table/

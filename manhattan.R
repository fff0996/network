#https://r-graph-gallery.com/101_Manhattan_plot.html
library(qqman)

#> head(notcommongwas)
#  SNP CHR BP P
#  46   1  1 2.635227e-02
#  46   1  2 1.424700e-02
#  46   1  3 9.153470e-09
#  46   1  4 6.921055e-01
#  46   1  5 1.130159e-03
#  46   1  6 4.283618e-01
##In our case, 'SNP' column means 'Risk Factor'


manhattan(notcommongwas,genomewideline= -log10(6.377551e-07),suggestiveline=FALSE)

hl <- c('46','47','23108')

#customize
don <- notcommongwas %>% group_by(CHR) %>% summarise(chr_len=max(BP)) %>% 
mutate(tot=cumsum(chr_len)-chr_len) %>% select(-chr_len) %>%
left_join(notcommongwas,.,by=c("CHR"="CHR")) %>% 
arrange(CHR,BP) %>% 
mutate(Disease = BP+tot) %>%

mutate( is_highlight=ifelse(SNP %in% hl, "yes", "no")) 
#%>% mutate( is_annotate=ifelse(-log10(P)>4, "yes", "no")) 


axisdf = don %>% group_by(CHR) %>% summarize(center=(max(Disease) + min(Disease))/2)


ggplot(don,aes(x=Disease,y=-log10(P)))+
               #shape=rfchapter))+
geom_point(aes(color=as.factor(CHR)),alpha=0.8,size=1.3) + 
scale_color_manual(values=rep(c("grey","black"),20))+
scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
geom_abline(intercept=-log10(6.36845e-07),slope=0,colour="red") +
#scale_shape_manual(values=c(15,16,17,18,21,22,23,24,37,0,1,2,3))+
geom_point(data=subset(don, is_highlight=="yes"), color="#FF0000", size=2) +


# Custom the theme:
     theme_bw() +
    theme( 
       legend.position="none",
       panel.border = element_blank(),
       panel.grid.major.x = element_blank(),
     panel.grid.minor.x = element_blank()
     )

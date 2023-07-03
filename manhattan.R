library(qqman)

#> head(notcommongwas)
#  SNP CHR BP    zscore            P
#  46   1  1 2.2213771 2.635227e-02
#  46   1  2 2.4510741 1.424700e-02
#  46   1  3 5.7455191 9.153470e-09
#  46   1  4 0.3960066 6.921055e-01
#  46   1  5 3.2564858 1.130159e-03
#  46   1  6 0.7915657 4.283618e-01


manhattan(notcommongwas,genomewideline= -log10(6.36845e-07),suggestiveline=FALSE)


#customize
don <- notcommongwas %>% group_by(CHR) %>% summarise(chr_len=max(BP)) %>% 
mutate(tot=cumsum(chr_len)-chr_len) %>% select(-chr_len) %>%
left_join(notcommongwas,.,by=c("CHR"="CHR")) %>% 
arrange(CHR,BP) %>% 
mutate(Disease = BP+tot)


axisdf = don %>% group_by(CHR) %>% summarize(center=(max(Disease) + min(Disease))/2)


ggplot(don,aes(x=Disease,y=-log10(P)))+
geom_point(aes(color=as.factor(CHR)),alpha=0.8,size=1.3) + 
scale_color_manual(values=rep(c("grey","black"),22))+
scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  
# Custom the theme:
     theme_bw() +
    theme( 
       legend.position="none",
       panel.border = element_blank(),
       panel.grid.major.x = element_blank(),
     panel.grid.minor.x = element_blank()
     )

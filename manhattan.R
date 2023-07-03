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

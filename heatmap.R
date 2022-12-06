df <- as.matrix(df)
library(pheatmap)
pheatmap(df,cutree_row=2,cutree_cols=2,color=colorRampPalette(c('#2471A3','white','#C0392B'))(50),border_color='white',show_colnames=T,show_rownames=T)
heatmap(df)

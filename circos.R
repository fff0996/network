library('circlize')

pdf("파일이름.pdf",width=15,height=20)
chordDiagram(as.data.frame(d3), transparency = 0.5,annotationTrack="grid")
circos.track(track.index = 1, panel.fun = function(x, y) {
     circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, 
         facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
 }, bg.border = NA) 
dev.off()

circos.clear()




# Phylogenetic trees will be constructed using the ggtree package (https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html; https://bioconductor.statistik.tu-dortmund.de/packages/3.8/bioc/vignettes/ggtree/inst/doc/treeAnnotation.html), here is another, maybe more comprehensible tutorial: https://yulab-smu.top/treedata-book/chapter4.html
Phylo_test <- function(tree, LayO) {
  # Start with the base ggtree plot, using the phylo object
  p <- ggtree(tree, color = "#646567", size = 1, layout = LayO)+
        geom_tiplab(aes(angle = angle), align = FALSE, alpha = 0.7, color = "#000000", hjust = -0.1, size = 1.8, offset = 0.0, geom = "label"
                )
}

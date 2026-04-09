# Phylogenetic trees will be constructed using the ggtree package (https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html; https://bioconductor.statistik.tu-dortmund.de/packages/3.8/bioc/vignettes/ggtree/inst/doc/treeAnnotation.html), here is another, maybe more comprehensible tutorial: https://yulab-smu.top/treedata-book/chapter4.html
Clado_rect <- function(tree, metadata, color_mapping) {
  # Start with the base ggtree plot, using the phylo object
  p <- ggtree(tree, color = "#646567", size = 0.5, branch.length = "none") +
              geom_tippoint(aes(fill = Node_color), color = "#000000", shape = 22, size = 1, alpha = .75
                            ) +
              geom_tiplab(aes(fill = clade), align = TRUE, alpha = 0.7, color = "#000000", size = 1.5, offset = 0.5, geom = "label"
                          ) +
              geom_nodepoint(aes(fill = Node_color), color = "#000000", shape = 21, size = 1
                             ) + # Add nodes
              scale_color_manual(values = color_mapping
                                 ) + # Apply the predefined color mapping
              scale_fill_manual(values = color_mapping
                                ) + # Apply the predefined color mapping
              guides(color = "none", 
                     fill = "none",
                     size = "none", 
                     shape = "none"
                     ) # Remove all legends
  
  # Add metadata (like clade or MRCA info) to the tree
  p <- p %<+% metadata
  return(p)
}


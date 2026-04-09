# Phylogenetic trees will be constructed using the ggtree package (https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html; https://bioconductor.statistik.tu-dortmund.de/packages/3.8/bioc/vignettes/ggtree/inst/doc/treeAnnotation.html), here is another, maybe more comprehensible tutorial: https://yulab-smu.top/treedata-book/chapter4.html
Clado_circ <- function(tree, metadata, color_mapping) {
  # Start with the base ggtree plot, using the phylo object
  p <- ggtree(tree, color = "#646567", size = 1, branch.length = "none", layout = "circular") +
              geom_tippoint(aes(fill = Node_color, angle = angle), color = "#000000", shape = 22, size = 2, alpha = .75
                            ) +
              geom_tiplab(aes(fill = clade, angle = angle), align = TRUE, alpha = 0.7, color = "#000000", size = 1.8, offset = 1.0, geom = "label"
                          ) +
              geom_nodepoint(aes(fill = Node_color), color = "#000000", shape = 21, size = 2
                             ) + # Add nodes
    
    # scale_x_continuous(limits = c(-0.0, 3.0), breaks = seq(0.0, 2.5, 0.5)) +
              scale_color_manual(values = color_mapping
                                 ) + # Apply the predefined color mapping
              scale_fill_manual(values = color_mapping
                                ) + # Apply the predefined color mapping
              guides(color = "none", fill = "none", size = "none", shape = "none"
                     ) # Remove all legends
  
  # Add metadata (like clade or MRCA info) to the tree
  p <- p %<+% metadata
  
  # Filter out rows with NA in 'clade' or 'mrca_node'
  mrca_nodes <- metadata %>%
    filter(!is.na(mrca_node) & !is.na(clade)) %>% # Exclude NAs
    distinct(mrca_node, clade) %>%
    rename(node = mrca_node, label = clade)
  
  # Add clade labels with colored lines for each MRCA node
  p <- p +
    geom_cladelab(
      data = mrca_nodes,
      mapping = aes(
        node = node,
        label = label,
        color = label   # Map color to the label for clade-specific colors
      ),
      align = FALSE,
      offset = 5,           # Offset for visibility
      offset.text = 0.5,      # Offset for the text
      barsize = 1,          # Size of line
      fontsize = 2,         # Label font size
      fontface = "bold",
      angle = "auto",
      horizontal = FALSE,
      textcolor = "#000000"
    ) +
    scale_color_manual(values = color_mapping)  # Apply color mapping to clade labels
  
  return(p)
}
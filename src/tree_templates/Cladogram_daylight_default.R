#' Daylight phylogram (ggtree)
#' @param tree          phylo
#' @param metadata      tibble with columns: node, Node_color, clade, (optionally) angle
#' @param color_mapping named vector for scale_(fill/color)_manual
#' @param show_legend   logical, show color/fill legends
#' @param use_equal_edges logical, TRUE -> branch.length = "none"
Clado_daylight <- function(tree, metadata, color_mapping,
                           show_legend = FALSE,
                           use_equal_edges = TRUE) {
  # Base tree with version-safe daylight fallback
  p <- tryCatch(
    ggtree::ggtree(
      tree,
      layout = "daylight",
      color  = "#646567",
      size   = 0.5,
      branch.length = if (use_equal_edges) "none" else "branch.length"
    )
  )
  
  # Attach metadata BEFORE layers that use it
  p <- p %<+% metadata
  
  p <- p +
    # tip squares filled by Node_color
    ggtree::geom_tippoint(
      ggplot2::aes(fill = Node_color, angle = angle),
      color = "#000000", shape = 22, size = 1, alpha = 0.9
    ) +
    # internal nodes
    ggtree::geom_nodepoint(
      ggplot2::aes(fill = Node_color),
      shape = 21, size = 1
    ) +
    # tip labels in small boxes, filled by clade (optional aesthetic)
    ggtree::geom_tiplab(
      ggplot2::aes(fill = clade, angle = "angle"),
      align = FALSE,
      color = "#000000",
      hjust = 0.5, size = 1.0, offset = 0.0,
      geom = "label",
      #label.padding = grid::unit(0.25, "lines"),
      #label.r       = grid::unit(0.0,   "lines"),
      label.size    = 0.2
    ) +
    # categorical palettes
    ggplot2::scale_color_manual(values = color_mapping) +
    ggplot2::scale_fill_manual(values = color_mapping)
  
  if (!show_legend) {
    p <- p + ggplot2::guides(color = "none", fill = "none", size = "none", shape = "none")
  }
  
  p
}

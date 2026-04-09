#' Daylight phylogram (ggtree)
#' @param tree           phylo
#' @param metadata       tibble with columns: node, Node_color, clade, (optionally) angle
#' @param color_mapping  named vector for scale_(fill/color)_manual
#' @param labels_to_show named vector for protein names to be shown as tip labels
#' @param show_legend    logical, show color/fill legends
phylo_daylight <- function(tree, metadata, color_mapping, clade_nodes, show_legend = FALSE) {
  # Base tree with version-safe daylight fallback
  p <- tryCatch(
    ggtree::ggtree(
      tree,
      layout = "daylight",
      color  = "#646567",
      size   = 0.75
    )
  )
  
  # Attach metadata BEFORE layers that use it
  p <- p %<+% metadata
  
  # Clades via MRCA nodes, colored by the clade label
  if (!is.null(clade_nodes) && nrow(clade_nodes) > 0) {
    p <- p +
      geom_hilight(
        data = clade_nodes,
        mapping = aes(node = node, fill = label),
        type = "auto",
        expand = 0.0,
        alpha = 0.2,
        to.bottom = TRUE
      )
  }
  
  p <- p +
    # Selected tip squares filled by Species
    ggtree::geom_tippoint(
      data = function(x) dplyr::filter(x, label %in% labels_to_show),
      ggplot2::aes(fill = species), angle = 0, color = "#000000", shape = 21, size = 2, alpha = 0.9
      ) +
    # internal nodes
    # ggtree::geom_nodepoint(ggplot2::aes(fill = Node_color), shape = 21, size = 1) +
    # tip labels in small boxes, filled by clade (optional aesthetic)
    ggtree::geom_tiplab(
      data = function(x) dplyr::filter(x, label %in% labels_to_show),
      ggplot2::aes(label = label, fill = clade),
      alpha = 0.8,
      angle = 0,
      align = FALSE,
      color = "#000000",
      hjust = 0.0, size = 2.0, offset = 0.0, nudge_x = 0.0,
      geom = "label",
      label.padding = grid::unit(0.25, "lines"),
      label.r       = grid::unit(0.0,   "lines"),
      label.size    = 0.3
    ) +
    # categorical palettes
    ggplot2::scale_color_manual(values = color_mapping) +
    ggplot2::scale_fill_manual(values = color_mapping)
  
  if (!show_legend) {
    p <- p + ggplot2::guides(color = "none", fill = "none", size = "none", shape = "none")
  }
  
  p
}

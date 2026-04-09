# Function to get Most Recent Common Ancestor (MRCA) for a clade, ignoring NA labels
get_clade_mrca <- function(clade_data, tree) {
  # Filter out NA labels in the 'label' column
  tips <- na.omit(clade_data$label)
  
  if (length(tips) > 1) {
    # If there are multiple tips, return the MRCA of those tips
    return(getMRCA(tree, tips))
  } else if (length(tips) == 1) {
    # If there is only one tip, return the corresponding node
    return(which(tree$tip.label == tips))
  } else {
    # If no valid tips are found, return NA
    return(NA)
  }
}
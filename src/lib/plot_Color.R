# library(DiagrammeR)
# library(DOT)

buildColorDict <- function(..., colors=c()) { # ... = lists of column names, colors = vector of color strings
  # Returns a named list of nodes to assigned color via natural ordering 
  # Non-specified nodes will remain uncolored, pre-assigned max number of colors is 7.
  # If more given lists than colors, error and return 0. 
  
  stack <- list(...)
  if (length(colors) == 0) {
    colors <- c("lightcoral","chocolate2","lightyellow","lightgreen","lightblue","purple","seashell")
    # Colors from http://sape.inf.usi.ch/quick-reference/ggplot2/colour
  }
  
  # throw error if len(...) < len(colors)
  if (length(stack) > length(colors)) {
    err_message <- "There are more PCA groups than provided colors."
    stop(err_message)
  }
  
  out <- list()
  i <- 1
  for (pca_group in stack) {
    for (node in pca_group) {
      out[[node]] <- colors[i]
    }
    i <- i + 1
  }
  return(out)
}

convertNELtoStr <- function(dag, colorNodes=list(),edgeColors=list(),layout="") { # dag: Formal graphNEL, colorNodes: List[node=color]
  # Converts a graphNEL object to a DOT language string
  # Assigns nodes and edges a color
  # https://graphviz.org/docs/layouts/
  
  # TODO: Add EdgeColors
  
  nodes <- dag@nodes
  if (length(layout) <= 0) {
    layout <- "dot"
  } 
  
  ans <- paste0('digraph { graph[layout=',layout,']')
  
  
  # Add nodes
  for (node in nodes) {
    if (exists(node, where = colorNodes)) {
      ans <- paste0(ans,'"',node,'" [fillcolor=', colorNodes[[node]], ', style=filled];')
    } else {
      ans <- paste0(ans,'"',node,'";')
    }
  }
  
  # Add edges
  for (node in nodes) {
    for (out_node_index in dag@edgeL[[node]]$edges) {
      ans <- paste0(ans,'"', node,'" -> "', nodes[out_node_index], '";')
    }
  }
  ans <- paste0(ans,'}')
  
  return(ans)
}

plot_dag2 <- function (graphNELobj, colors=c(), return=FALSE) {
  # Build graph using graphNELobj and colors
  # Return grViz graph to display in R notebook
  # Save graph to full_out/title.svg 
  
  dot_string <- convertNELtoStr(graph, ColoredNodes)
  file_name <- paste0(DOT_OUT_PATH,title,".svg")
  dot(dot_string,file=file_name)
  if (return) {
    return (grViz(dot_string))
  }
  return()  
}




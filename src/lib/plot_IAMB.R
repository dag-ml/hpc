# Graphviz plot attributes
graph_attrs <- list(rankdir = "BT", size = "5,5", bgcolor = "white")
node_attrs <- list(fontcolor = "black", shape = "circle", style = "filled", fillcolor = "lightyellow")
node_attrs <- list ()
edge_attrs <- list(color = "black")

# Plot the DAG
plot_dag <- function(graph, algo){
    plot_title <- paste0(algo, " ")
    plot(graph, attrs = list(graph = graph_attrs, node = node_attrs, edge = edge_attrs))
    title(plot_title, line = -1, cex.main = 2)
}

width <- 4800  # Width in pixels
height <- 4800  # Height in pixels
png(filename = paste0(FULL_OUT_PATH, title,".png"), width = width, height = height, units = "px", res = 500) 
graph <- as.graphNEL(dag)
plot_dag(graph, title)
dev.off()


# Graphviz plot attributes
graph_attrs <- list(rankdir = "BT", size = "5,5", bgcolor = "white")
# node_attrs <- list(fontcolor = "black", shape = "circle", style = "filled", fillcolor = "lightyellow")
node_attrs <- list ()
edge_attrs <- list(color = "black")

# Plot the DAG
plot_dag <- function(graph, algo){
    plot_title <- paste0(algo, " ")
    plot(graph, attrs = list(graph = graph_attrs, node = node_attrs, edge = edge_attrs))
    title(plot_title, line = -1, cex.main = 2)
}

# par(mfrow = c(2,2))



# Assuming 'my_plot' is your base R plot
# png(filename = paste0(title,".png"))


dag <- h2pc(dsub_set)
graph <- as.graphNEL(dag)
plot_dag(graph, "H2PC")


# dev.off()



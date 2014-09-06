library("igraph")
library("qgraph")

edge <- read.csv(file = "edge.csv",header = TRUE, stringsAsFactors = FALSE, encoding = 'utf-8')
vec <- read.csv(file = "sup.csv", header = TRUE, stringsAsFactors = FALSE)

edge <- edge[edge$Pro_ctgry!="",]

g <- graph.data.frame(edge, directed = TRUE, vertices = vec)

V(g)$size <- ifelse(V(g)$Category == "Sup", V(g)$Stock, degree(g,mode = "in")/2)
V(g)$shape <- ifelse(V(g)$Category == "Sup", "circle", "square")
V(g)$color <- ifelse(V(g)$Category == "Sup", "pink", "lightblue")
V(g)$label.color <- ifelse(V(g)$Category == "Sup", "red", "blue")
#V(g)$label.cex <- ifelse(V(g)$Category == "Sup", 1, 1)
V(g)$label.font <- ifelse(V(g)$Category == "Sup", 1, 2)
V(g)$label.cex <- log10(V(g)$size)




plot(g, layout=layout.kamada.kawai,
     vertex.label.family="Kaiti TC", 
     edge.arrow.size = 0.2)





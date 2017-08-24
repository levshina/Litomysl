#install packages: igraph

library(igraph)

#Colexification of causatives: weighted graphs
colex_graph <- graph_from_edgelist(as.matrix(colex[, -1]), directed = FALSE)
plot(colex_graph)
colex_adj <- as_adj(colex_graph)
colex_graph1 <- graph_from_adjacency_matrix(colex_adj, mode = "undirected", weighted = TRUE)
E(colex_graph1)#get the edges
E(colex_graph1)$weight #get the weights (frequencies)
plot(colex_graph1)
plot(colex_graph1, edge.width = E(colex_graph1)$weight^1.2, edge.color = "lightgreen", vertex.label.cex = 1, vertex.size = 5, vertex.label.color = "black", vertex.label.family = "sans", vertex.color = "red", vertex.label.dist = 1.5)


#Undirected graph: Datives from Haspelmath 2003
dat_graph <- make_graph(~ purpose - direction - recipient - beneficiary -  judicantis, experiencer - recipient - predicative_possessor - external_possessor - beneficiary)
plot(dat_graph)
plot(dat_graph)
plot(dat_graph, layout = layout_with_kk) #Kamada-Kawai layout

#from graph to adjacency matrix
dat_adj <- as_adj(dat_graph)
#from adjacency matrix to graph
dat_graph_new <- graph_from_adjacency_matrix(dat_adj, mode = "undirected")
plot(dat_graph_new)

#interactive editing (need tclkt package)
tkplot(dat_graph)
xy <- tk_coords(4)
plot(dat_graph, layout = xy)
plot(dat_graph, layout = xy, vertex.size = 0) #no vertex symbols

#Bybee et al. 1994: grammaticalization of tense and aspect expressions
ta_graph <- make_directed_graph(c("AUX_Part", "Resultative", "Resultative", "Anterior", "Anterior",  "Perfective_or_Past", "Finish", "Completive", "Completive",  "Anterior", "Movement_from", "Anterior"))
plot(ta_graph)
#interactive editing
tkplot(ta_graph)
tk_coords(2) #or another id of the device
xy <- tk_coords(2)
plot(ta_graph, layout = xy)
plot(ta_graph, layout = xy, vertex.size = 5, vertex.label.dist = -1.5, edge.arrow.size= 1.2, vertex.color = "red")

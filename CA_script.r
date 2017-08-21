#add-on packages: ca, FactoMineR, rgl
head(speak)
#Simple Correspondence Analysis
library(ca)
speak.ca <- ca(speak)
plot(speak.ca) #the first two dimensions, by default
plot(speak.ca, dim = 2:3) #dimensions 2 and 3 
plot3d.ca(speak.ca) #interactive 3D plot
summary(speak.ca)

#Multiple Correspondence Analysis
library(FactoMineR) 
chairs.ca <- MCA(chairs[, -c(1:3)], graph = FALSE)
plot(chairs.ca, cex = 0.7, col.var = "black", col.ind = "grey")
dimdesc(chairs.ca) #description of dimensions
chairs.ca1 <- MCA(chairs[, -c(1:2)], quali.sup = 1, graph = FALSE) #MCA with supplementary points (lexical categories)
plot(chairs.ca1, invis = "ind", col.var = "darkgrey", col.quali.sup = "black") 
chairs.ca$eig #diagnostics
chairs.ca2 <- mjca(chairs[, -c(1:3)]) #Adjusted CA with ca
summary(chairs.ca2) 
plot(chairs.ca2)
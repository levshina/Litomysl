#BP based on one categorical variable
speak.bp <- prop.table(as.matrix(speak), 1)
speak.dist <- dist(speak.bp, method = "canberra")
speak.clust <- hclust(speak.dist, method = "ward.D2")
plot(speak.clust)

#BP based on several categorical variables

bp <- function (data) 
{
  y <- c()
  for (v in 1:ncol(data)) {
    y1 <- prop.table(table(data[, v]))
    names(y1) <- paste(colnames(data)[v], names(y1), sep = ".")
    y <- c(y, y1)
  }
  return(y)
}

speak.split <- split(speak_poly, speak_poly$Sense)
speak.split <- lapply(speak.split, function(x) x = x[, -1])
speak.split.bp <- lapply(speak.split, bp)
speak.bp <- do.call(rbind, speak.split.bp)
speak.dist <- dist(speak.bp, method = "manhattan")
speak.clust <- hclust(speak.dist, method = "average") 
plot(speak.clust)
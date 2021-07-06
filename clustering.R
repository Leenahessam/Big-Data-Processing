library(ggplot2)
library(cluster)
library(factoextra)
#removing rows with missing values
df <- na.omit(USArrests)
#head(df)
fviz_nbclust(df, kmeans, method = "wss")+geom_vline(xintercept = 3, linetype=2)
#based on many references the elbow method is the best
#one for kmeans clustering technique, as shown in the plot,  
#optimal number of clusters is 3
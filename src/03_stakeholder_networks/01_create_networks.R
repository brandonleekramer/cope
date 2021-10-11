
# load packages 
library(tidyverse)
library(igraph)
library(VOSONDash)

# load data & construct network 
shore_network <- read_csv("~/git/cope/data/eastern_shore_edgelist.csv") %>% 
  rename(from = source, to = target)
shore_network <- graph_from_edgelist(as.matrix(shore_network), directed = FALSE)

# set network aesthetics 
# not sure if ggraph will work but def try that for aesthetic setting 
V(shore_network)$color <- "green"

# check appearance 
plot(shore_network)

# export data 
write.graph(shore_network, "~/git/cope/data/shore_network.graphml", format = "graphml")

# run dashboard 
runVOSONDash()

# references 
# https://www.data-imaginist.com/2017/ggraph-introduction-layouts/
# katya's page: https://kateto.net/networks-r-igraph/
# https://vosonlab.github.io/vosonSML/articles/Intro-to-vosonSML.html
# https://github.com/vosonlab/vosonSML
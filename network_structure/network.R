source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE, dec = ".")
data$betweenness = as.numeric(data$betweenness)
data$closeness = as.numeric(data$closeness)
data$clustering_coefficient = as.numeric(data$clustering_coefficient)
data$degree = as.numeric(data$degree)
data$eccentricity = as.numeric(data$eccentricity)
data$indegree = as.numeric(data$indegree)
data$outdegree = as.numeric(data$outdegree)
data$page_rank = as.numeric(data$page_rank)


findDiff(data, betweenness ~ class, "betweenness", "class", "report/biology/specific/betweenness_result.csv") 
findDiff(data, betweenness ~ class2, "betweenness", "class2", "report/biology/general/betweenness_general_result.csv") 

findDiff(data, closeness ~ class, "closeness", "class", "report/biology/specific/closeness_result.csv") 
findDiff(data, closeness ~ class2, "closeness", "class2", "report/biology/general/closeness_general_result.csv")

findDiff(data, clustering_coefficient ~ class, "clustering_coefficient", "class", "report/biology/specific/clustering_coefficient_result.csv") 
findDiff(data, clustering_coefficient ~ class2, "clustering_coefficient", "class2", "report/biology/general/clustering_coefficient_general_result.csv")

findDiff(data, degree ~ class, "degree", "class", "report/biology/specific/degree_result.csv") 
findDiff(data, degree ~ class2, "degree", "class2", "report/biology/general/degree_general_result.csv")

findDiff(data, eccentricity ~ class, "eccentricity", "class", "report/biology/specific/eccentricity_result.csv") 
findDiff(data, eccentricity ~ class2, "eccentricity", "class2", "report/biology/general/eccentricity_general_result.csv")

findDiff(data, indegree ~ class, "indegree", "class", "report/biology/specific/indegree_result.csv") 
findDiff(data, indegree ~ class2, "indegree", "class2", "report/biology/general/indegree_general_result.csv")

findDiff(data, outdegree ~ class, "outdegree", "class", "report/biology/specific/outdegree_result.csv") 
findDiff(data, outdegree ~ class2, "outdegree", "class2", "report/biology/general/outdegree_general_result.csv")

findDiff(data, page_rank ~ class, "page_rank", "class", "report/biology/specific/page_rank_result.csv") 
findDiff(data, page_rank ~ class2, "page_rank", "class2", "report/biology/general/page_rank_general_result.csv")


data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE, dec = ".")
data$betweenness = as.numeric(data$betweenness)
data$closeness = as.numeric(data$closeness)
data$clustering_coefficient = as.numeric(data$clustering_coefficient)
data$degree = as.numeric(data$degree)
data$eccentricity = as.numeric(data$eccentricity)
data$indegree = as.numeric(data$indegree)
data$outdegree = as.numeric(data$outdegree)
data$page_rank = as.numeric(data$page_rank)


findDiff(data, betweenness ~ class, "betweenness", "class", "report/chemistry/specific/betweenness_result.csv") 
findDiff(data, betweenness ~ class2, "betweenness", "class2", "report/chemistry/general/betweenness_general_result.csv") 

findDiff(data, closeness ~ class, "closeness", "class", "report/chemistry/specific/closeness_result.csv") 
findDiff(data, closeness ~ class2, "closeness", "class2", "report/chemistry/general/closeness_general_result.csv")

findDiff(data, clustering_coefficient ~ class, "clustering_coefficient", "class", "report/chemistry/specific/clustering_coefficient_result.csv") 
findDiff(data, clustering_coefficient ~ class2, "clustering_coefficient", "class2", "report/chemistry/general/clustering_coefficient_general_result.csv")

findDiff(data, degree ~ class, "degree", "class", "report/chemistry/specific/degree_result.csv") 
findDiff(data, degree ~ class2, "degree", "class2", "report/chemistry/general/degree_general_result.csv")

findDiff(data, eccentricity ~ class, "eccentricity", "class", "report/chemistry/specific/eccentricity_result.csv") 
findDiff(data, eccentricity ~ class2, "eccentricity", "class2", "report/chemistry/general/eccentricity_general_result.csv")

findDiff(data, indegree ~ class, "indegree", "class", "report/chemistry/specific/indegree_result.csv") 
findDiff(data, indegree ~ class2, "indegree", "class2", "report/chemistry/general/indegree_general_result.csv")

findDiff(data, outdegree ~ class, "outdegree", "class", "report/chemistry/specific/outdegree_result.csv") 
findDiff(data, outdegree ~ class2, "outdegree", "class2", "report/chemistry/general/outdegree_general_result.csv")

findDiff(data, page_rank ~ class, "page_rank", "class", "report/chemistry/specific/page_rank_result.csv") 
findDiff(data, page_rank ~ class2, "page_rank", "class2", "report/chemistry/general/page_rank_general_result.csv")






 



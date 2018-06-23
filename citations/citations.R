source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$count = as.numeric(data$count)


findDiff(data, count ~ class, "count", "class", "report/biology/specific/biology_citation_result.csv") 
findDiff(data, count ~ class2, "count", "class2", "report/biology/general/biology_citation_general_result.csv") 


data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$count = as.numeric(data$count)


findDiff(data, count ~ class, "count", "class", "report/chemistry/specific/chemistry_citation_result.csv") 
findDiff(data, count ~ class2, "count", "class2", "report/chemistry/general/chemistry_citation_general_result.csv") 






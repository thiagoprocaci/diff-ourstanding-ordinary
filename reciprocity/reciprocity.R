source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$reciprocity_count = as.numeric(data$reciprocity_count)



findDiff(data, reciprocity_count ~ class, "reciprocity_count", "class", "report/biology/specific/biology_reciprocity_count_result.csv") 
findDiff(data, reciprocity_count ~ class2, "reciprocity_count", "class2", "report/biology/general/biology_reciprocity_count_result.csv") 




data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$reciprocity_count = as.numeric(data$reciprocity_count)

findDiff(data, reciprocity_count ~ class, "reciprocity_count", "class", "report/chemistry/specific/chemistry_reciprocity_count_result.csv") 
findDiff(data, reciprocity_count ~ class2, "reciprocity_count", "class2", "report/chemistry/general/chemistry_reciprocity_count_result.csv") 


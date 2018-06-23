source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$count = as.numeric(data$count)
findDiff(data, count ~ class, "count", "class", "report/biology/biology_result.csv") 

data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$count = as.numeric(data$count)
findDiff(data, count ~ class, "count", "class", "report/chemistry/chemistry_result.csv") 

data = read.csv(file = "chemistry_ord.csv", sep = ",", header = TRUE)
data$count = as.numeric(data$count)
findDiff(data, count ~ class, "count", "class", "report/chemistry/chemistry_ord_result.csv") 
 




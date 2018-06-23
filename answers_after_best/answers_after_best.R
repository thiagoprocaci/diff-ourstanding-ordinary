source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$number_answers_after_best = as.numeric(data$number_answers_after_best)




findDiff(data, number_answers_after_best ~ class, "number_answers_after_best", "class", "report/biology/specific/biology_result.csv") 
findDiff(data, number_answers_after_best ~ class2, "number_answers_after_best", "class2", "report/biology/general/biology_result.csv") 




data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$number_answers_after_best = as.numeric(data$number_answers_after_best)


findDiff(data, number_answers_after_best ~ class, "number_answers_after_best", "class", "report/chemistry/specific/chemistry_result.csv") 
findDiff(data, number_answers_after_best ~ class2, "number_answers_after_best", "class2", "report/chemistry/general/chemistry_result.csv")  



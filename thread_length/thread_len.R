source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$thread_length = as.numeric(data$thread_length)

findDiff(data, thread_length ~ contains_outstanding, "thread_length", "contains_outstanding", "report/biology/biology_thread_length_result.csv") 

data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$thread_length = as.numeric(data$thread_length)

findDiff(data, thread_length ~ contains_outstanding, "thread_length", "contains_outstanding", "report/chemistry/chemistry_thread_length_result.csv") 







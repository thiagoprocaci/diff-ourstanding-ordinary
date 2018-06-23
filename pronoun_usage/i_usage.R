source(file = "../functions.R")

data = read.csv(file = "biology_i.csv", sep = ",", header = TRUE)
data$count_i_usage = as.numeric(data$count_i_usage)
findDiff(data, count_i_usage ~ class, "count_i_usage", "class", "report/biology/specific/biology_count_i_usage_result.csv") 
findDiff(data, count_i_usage ~ class2, "count_i_usage", "class2", "report/biology/general/biology_count_i_usage_general_result.csv") 


data = read.csv(file = "biology_you.csv", sep = ",", header = TRUE)
data$count_you_usage = as.numeric(data$count_you_usage)
findDiff(data, count_you_usage ~ class, "count_you_usage", "class", "report/biology/specific/biology_count_you_usage_result.csv") 
findDiff(data, count_you_usage ~ class2, "count_you_usage", "class2", "report/biology/general/biology_count_you_usage_general_result.csv") 

data = read.csv(file = "biology_we.csv", sep = ",", header = TRUE)
data$count_we_usage = as.numeric(data$count_we_usage)
findDiff(data, count_we_usage ~ class, "count_we_usage", "class", "report/biology/specific/biology_count_we_usage_result.csv") 
findDiff(data, count_we_usage ~ class2, "count_we_usage", "class2", "report/biology/general/biology_count_we_usage_general_result.csv") 

data = read.csv(file = "biology_they.csv", sep = ",", header = TRUE)
data$count_they_usage = as.numeric(data$count_they_usage)
findDiff(data, count_they_usage ~ class, "count_they_usage", "class", "report/biology/specific/biology_count_they_usage_result.csv") 
findDiff(data, count_they_usage ~ class2, "count_they_usage", "class2", "report/biology/general/biology_count_they_usage_general_result.csv") 



data = read.csv(file = "chemistry_i.csv", sep = ",", header = TRUE)
data$count_i_usage = as.numeric(data$count_i_usage)
findDiff(data, count_i_usage ~ class, "count_i_usage", "class", "report/chemistry/specific/chemistry_count_i_usage_result.csv") 
findDiff(data, count_i_usage ~ class2, "count_i_usage", "class2", "report/chemistry/general/chemistry_count_i_usage_general_result.csv") 


data = read.csv(file = "chemistry_you.csv", sep = ",", header = TRUE)
data$count_you_usage = as.numeric(data$count_you_usage)
findDiff(data, count_you_usage ~ class, "count_you_usage", "class", "report/chemistry/specific/chemistry_count_you_usage_result.csv") 
findDiff(data, count_you_usage ~ class2, "count_you_usage", "class2", "report/chemistry/general/chemistry_count_you_usage_general_result.csv") 

data = read.csv(file = "chemistry_we.csv", sep = ",", header = TRUE)
data$count_we_usage = as.numeric(data$count_we_usage)
findDiff(data, count_we_usage ~ class, "count_we_usage", "class", "report/chemistry/specific/chemistry_count_we_usage_result.csv") 
findDiff(data, count_we_usage ~ class2, "count_we_usage", "class2", "report/chemistry/general/chemistry_count_we_usage_general_result.csv") 

data = read.csv(file = "chemistry_they.csv", sep = ",", header = TRUE)
data$count_they_usage = as.numeric(data$count_they_usage)
findDiff(data, count_they_usage ~ class, "count_they_usage", "class", "report/chemistry/specific/chemistry_count_they_usage_result.csv") 
findDiff(data, count_they_usage ~ class2, "count_they_usage", "class2", "report/chemistry/general/chemistry_count_they_usage_general_result.csv") 

data = read.csv(file = "chemistry_she_he.csv", sep = ",", header = TRUE)
data$count_she_he_usage = as.numeric(data$count_she_he_usage)
findDiff(data, count_she_he_usage ~ class, "count_she_he_usage", "class", "report/chemistry/specific/chemistry_count_she_he_usage_result.csv") 
findDiff(data, count_she_he_usage ~ class2, "count_she_he_usage", "class2", "report/chemistry/general/chemistry_count_she_he_usage_general_result.csv")

data = read.csv(file = "chemistry_she_he.csv", sep = ",", header = TRUE)
data$count_she_he_usage = as.numeric(data$count_she_he_usage)
findDiff(data, count_she_he_usage ~ class, "count_she_he_usage", "class", "report/chemistry/specific/chemistry_count_she_he_usage_result.csv") 
findDiff(data, count_she_he_usage ~ class2, "count_she_he_usage", "class2", "report/chemistry/general/chemistry_count_she_he_usage_general_result.csv") 




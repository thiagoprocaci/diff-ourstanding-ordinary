source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ";", header = TRUE)
data$entropy = as.numeric(data$entropy)
data$reputation = as.numeric(data$reputation)
data$accepted_answers = as.numeric(data$accepted_answers)


outstanding = subset(data, data$class2 == 'outstanding')
ordinary = subset(data, data$class2 == 'ordinary') 


correlation(outstanding$entropy, outstanding$accepted_answers, "Outstanding Correl Biology - entropy x best answer ")
correlation(ordinary$entropy, ordinary$accepted_answers, "Ordinary Correl Biology  - entropy x best answer")

findDiff(data, entropy ~ class2, "entropy", "class2", "report/entropy_bio.csv") 

data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$entropy = as.numeric(data$entropy)
data$reputation = as.numeric(data$reputation)
data$accepted_answers = as.numeric(data$accepted_answers)


outstanding = subset(data, data$class2 == 'outstanding')
ordinary = subset(data, data$class2 == 'ordinary') 


correlation(outstanding$entropy, outstanding$accepted_answers, "Outstanding Correl chemistry - entropy x best answer ")
correlation(ordinary$entropy, ordinary$accepted_answers, "Ordinary Correl chemistry  - entropy x best answer")

findDiff(data, entropy ~ class2, "entropy", "class2", "report/entropy_chemistry.csv") 




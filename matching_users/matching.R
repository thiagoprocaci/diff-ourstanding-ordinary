source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$answers = as.numeric(data$answers)
data$questions = as.numeric(data$questions)
data$comments = as.numeric(data$comments)
data$reviews = as.numeric(data$reviews)




findDiff(data, answers ~ class, "answers", "class", "report/biology/specific/biology_answers_result.csv") 
findDiff(data, questions ~ class, "questions", "class", "report/biology/specific/biology_questions_result.csv") 
findDiff(data, comments ~ class, "comments", "class", "report/biology/specific/biology_comments_result.csv") 
findDiff(data, reviews ~ class, "reviews", "class", "report/biology/specific/biology_reviews_result.csv") 
findDiff(data, accepted_answers ~ class, "accepted_answers", "class", "report/biology/specific/biology_accepted_answers_result.csv") 


findDiff(data, answers ~ class2, "answers", "class2", "report/biology/general/biology_answers_general_result.csv") 
findDiff(data, questions ~ class2, "questions", "class2", "report/biology/general/biology_questions_general_result.csv") 
findDiff(data, comments ~ class2, "comments", "class2", "report/biology/general/biology_comments_general_result.csv") 
findDiff(data, reviews ~ class2, "reviews", "class2", "report/biology/general/biology_reviews_general_result.csv") 
findDiff(data, accepted_answers ~ class2, "accepted_answers", "class2", "report/biology/general/biology_accepted_answers_general_result.csv") 



data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$answers = as.numeric(data$answers)
data$questions = as.numeric(data$questions)
data$comments = as.numeric(data$comments)
data$reviews = as.numeric(data$reviews)


findDiff(data, answers ~ class, "answers", "class", "report/chemistry/specific/chemistry_answers_result.csv") 
findDiff(data, questions ~ class, "questions", "class", "report/chemistry/specific/chemistry_questions_result.csv") 
findDiff(data, comments ~ class, "comments", "class", "report/chemistry/specific/chemistry_comments_result.csv") 
findDiff(data, reviews ~ class, "reviews", "class", "report/chemistry/specific/chemistry_reviews_result.csv") 
findDiff(data, accepted_answers ~ class, "accepted_answers", "class", "report/chemistry/chemistry_accepted_answers_result.csv") 


findDiff(data, answers ~ class2, "answers", "class2", "report/chemistry/general/chemistry_answers_general_result.csv") 
findDiff(data, questions ~ class2, "questions", "class2", "report/chemistry/general/chemistry_questions_general_result.csv") 
findDiff(data, comments ~ class2, "comments", "class2", "report/chemistry/general/chemistry_comments_general_result.csv") 
findDiff(data, reviews ~ class2, "reviews", "class2", "report/chemistry/general/chemistry_reviews_general_result.csv") 
findDiff(data, accepted_answers ~ class2, "accepted_answers", "class2", "report/chemistry/general/chemistry_accepted_answers_general_result.csv") 



source(file = "../functions.R")

data = read.csv(file = "first_biology.csv", sep = ",", header = TRUE)
data$diff_min = as.numeric(data$diff_min)


data2 = read.csv(file = "first_chemistry.csv", sep = ",", header = TRUE)
data2$diff_min = as.numeric(data2$diff_min)





findDiff(data, diff_min ~ class, "diff_min", "class", "first_biology_result.csv") 
findDiff(data2, diff_min ~ class, "diff_min", "class", "first_chemistry_result.csv") 

findDiff(data, diff_min ~ class, "diff_min", "class2", "first_biology_result_general.csv") 
findDiff(data2, diff_min ~ class, "diff_min", "class2", "first_chemistry_result_general.csv") 

#summaryACMLatexTable("Number of Questions", "num-quest-dist", "Category", "category", "questions", data2, "bio_questions_summary.txt")

#answers
#findDiff(data2, answers ~ category, "answers", "category", "bio_answers_category.csv") 
#summaryACMLatexTable("Number of Answers", "num-ans-dist", "Category", "category", "answers", data2, "bio_answers_summary.txt")

source(file = "../functions.R")

data = read.csv(file = "user_biology.csv", sep = ",", header = TRUE)
data2 = subset(data, data$category != 'no_participation')

#questions
findDiff(data2, questions ~ category, "questions", "category", "bio_questions_category.csv") 
summaryACMLatexTable("Number of Questions", "num-quest-dist", "Category", "category", "questions", data2, "bio_questions_summary.txt")

#answers
findDiff(data2, answers ~ category, "answers", "category", "bio_answers_category.csv") 
summaryACMLatexTable("Number of Answers", "num-ans-dist", "Category", "category", "answers", data2, "bio_answers_summary.txt")

top_5 = subset(data, data$category == 'top_5')
top_5_10 = subset(data, data$category == 'top_5_10')
top_10_15 = subset(data, data$category == 'top_10_15')
top_15_20 = subset(data, data$category == 'top_15_20')
top_20_25 = subset(data, data$category == 'top_20_25')
top_25_30 = subset(data, data$category == 'top_25_30')
top_30_35 = subset(data, data$category == 'top_30_35')
top_35_40 = subset(data, data$category == 'top_35_40')
top_40_45 = subset(data, data$category == 'top_40_45')
top_45_50 = subset(data, data$category == 'top_45_50')
top_50_100 = subset(data, data$category == 'top_50_100')
no_participation = subset(data, data$category == 'no_participation')




b = boxplot(top_5$answers, 
            top_5_10$answers, 
            top_10_15$answers,
            top_15_20$answers,
            top_20_25$answers,
            top_25_30$answers,
            top_30_35$answers,
            top_35_40$answers,
            top_40_45$answers,
            top_45_50$answers,
            top_50_100$answers
            ,outline=FALSE)

slices <- c(mean(top_5$answers), 
            mean(top_5_10$answers),
            mean(top_15_20$answers),
            mean(top_20_25$answers),
            mean(top_25_30$answers),
            mean(top_30_35$answers),
            mean(top_35_40$answers),
            mean(top_40_45$answers),
            mean(top_45_50$answers),
            mean(top_50_100$answers)
            )
lbls <- c("top 5", "top 5-10", "top 15-20", "top 20-25", "top 25-30", "top 30-35", "top 35-40",
          "top 40-45", "top 45-50", "top 50-100")
p = barplot(slices,  names.arg = lbls, main = "Pie Chart of Countries")
#print(b)

#http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
#library(ggplot2)

#q = qplot(id, answers, colour=category, data= data2)
#print(q)


#p10 <- ggplot(data2, aes(x = category, y = answers)) +
#  geom_boxplot(outlier.shape = NA) +
#  1scale_y_continuous(limits = quantile(data2$answers, c(0.1, 0.9)))


#print(p10)


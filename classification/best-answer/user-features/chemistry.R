library(caret)
library(ggplot2)
library(pROC)


fileToSave = "chemistry-auc"

data = read.csv("chemistry.csv", header = TRUE, sep = ",", dec = ",")

data$questions = as.numeric(data$questions)
data$answers = as.numeric(data$answers)
data$comments = as.numeric(data$comments)
data$reviews = as.numeric(data$reviews)
data$reviews = as.numeric(data$reviews)
#data$accepted_answers = as.numeric(data$accepted_answers)



set.seed(825)
trainIndex <- createDataPartition(data$class, p = .6, 
                                  list = FALSE, 
                                  times = 1)
dataTrain <- data[ trainIndex,]
dataTest  <- data[-trainIndex,]



runModel = TRUE

if(runModel) {
  fitControl <- trainControl(## 5-fold CV
    method = "repeatedcv",
    number = 5, 
    classProbs = TRUE,
    summaryFunction = twoClassSummary,
    repeats = 10)  
  
  
  
  modelFit <- train(class ~ +
                      questions + answers + comments + reviews
                      
                      , data = dataTrain, 
                    method = "gbm",  
                    trControl = fitControl,
                    #tuneGrid = grid,
                    metric = "ROC",
                    verbose = FALSE)
  print(modelFit)

  
  
  print("Prediction")
  predictions <- predict(modelFit, newdata = dataTest)
  
  cm = confusionMatrix(predictions, dataTest$class)
  
  print(cm)
  
  precision <- cm$byClass['Pos Pred Value']    
  recall <- cm$byClass['Sensitivity']
  
  print("F-measure")
  print((2 * precision * recall)/(precision + recall))
  
  #trellis.par.set(caretTheme())
 # print(plot(modelFit, metric = "ROC"))
  
 # print(plot(modelFit, metric = "ROC", plotType = "level",
 #            scales = list(x = list(rot = 90))))
  
  predictions <- predict(modelFit, newdata = dataTest, type = "prob")
  r = roc(dataTest$class, predictions[[2]])
  print(r$auc)
  
  
  write(r$auc, file = fileToSave, append = FALSE)
  
  
}
library(caret)
library(ggplot2)
library(pROC)


fileToSave = "bio2chem-auc"

data = read.csv("chemistry.csv", header = TRUE, sep = ",", dec = ",")
data$questions = as.numeric(data$questions)
data$comments = as.numeric(data$comments)
data$answers = as.numeric(data$answers)
data$reviews = as.numeric(data$reviews)

data2 = read.csv("biology.csv", header = TRUE, sep = ",", dec = ",")
data2$questions = as.numeric(data2$questions)
data2$comments = as.numeric(data2$comments)
data2$answers = as.numeric(data2$answers)
data2$reviews = as.numeric(data2$reviews)



set.seed(825)
trainIndex <- createDataPartition(data$class2, p = .6, 
                                  list = FALSE, 
                                  times = 1)

dataTrain <- data[ trainIndex,]
dataTest  <- data2



runModel = TRUE

if(runModel) {
  fitControl <- trainControl(## 5-fold CV
    method = "repeatedcv",
    number = 5, 
    classProbs = TRUE,
    summaryFunction = twoClassSummary,
    repeats = 10)  
  
  
  
  modelFit <- train(class2 ~ answers + comments + questions + reviews, data = dataTrain, 
                    method = "gbm",  
                    trControl = fitControl,
                    #tuneGrid = grid,
                    metric = "ROC",
                    verbose = FALSE)
  print(modelFit)

  
  
  print("Prediction")
  predictions <- predict(modelFit, newdata = dataTest)
  
  cm = confusionMatrix(predictions, dataTest$class2)
  
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
  r = roc(dataTest$class2, predictions[[2]])
  print(r$auc)
  
  
  write(r$auc, file = fileToSave, append = FALSE)
  
  
}
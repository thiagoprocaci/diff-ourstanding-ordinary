library(caret)
library(ggplot2)
library(pROC)


fileToSave = "chem2Bio-auc"

data = read.csv("chemistry.csv", header = TRUE, sep = ",", dec = ",")
data$modularity_class = as.numeric(data$modularity_class)
data$citations = as.numeric(data$citations)
data$avg_part = as.numeric(data$avg_part)

data2 = read.csv("biology.csv", header = TRUE, sep = ",", dec = ",")
data2$modularity_class = as.numeric(data2$modularity_class)
data2$citations = as.numeric(data2$citations)
data2$avg_part = as.numeric(data2$avg_part)


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
  
  
  modelFit <- train(class2 ~ modularity_class + citations + avg_part, data = dataTrain, 
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
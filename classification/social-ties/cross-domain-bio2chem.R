library(caret)
library(ggplot2)
library(pROC)


fileToSave = "bio2chem-auc"

data = read.csv("biology.csv", header = TRUE, sep = ",", dec = ",")
data$betweenness = as.numeric(data$betweenness)
data$closeness = as.numeric(data$closeness)
data$clustering_coefficient = as.numeric(data$clustering_coefficient)
data$indegree = as.numeric(data$indegree)
data$outdegree = as.numeric(data$outdegree)

data2 = read.csv("chemistry.csv", header = TRUE, sep = ",", dec = ",")
data2$betweenness = as.numeric(data2$betweenness)
data2$closeness = as.numeric(data2$closeness)
data2$clustering_coefficient = as.numeric(data2$clustering_coefficient)
data2$indegree = as.numeric(data2$indegree)
data2$outdegree = as.numeric(data2$outdegree)



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
  
  
  
  modelFit <- train(class2 ~ betweenness + closeness + clustering_coefficient + indegree + outdegree , data = dataTrain, 
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
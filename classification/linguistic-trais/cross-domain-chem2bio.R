library(caret)
library(ggplot2)
library(pROC)


fileToSave = "chem2Bio-auc"

data = read.csv("chemistry.csv", header = TRUE, sep = ",", dec = ",")
data$ari = as.numeric(data$ari)
data$characters = as.numeric(data$characters)
data$complexwords = as.numeric(data$complexwords)
data$syllables = as.numeric(data$syllables)
data$sentences = as.numeric(data$sentences)
data$words = as.numeric(data$words)
data$count_i_usage = as.numeric(data$count_i_usage)
data$count_you_usage = as.numeric(data$count_you_usage)
data$count_she_he_usage = as.numeric(data$count_she_he_usage)

data2 = read.csv("biology.csv", header = TRUE, sep = ",", dec = ",")
data2$ari = as.numeric(data2$ari)
data2$characters = as.numeric(data2$characters)
data2$complexwords = as.numeric(data2$complexwords)
data2$syllables = as.numeric(data2$syllables)
data2$sentences = as.numeric(data2$sentences)
data2$words = as.numeric(data2$words)
data2$count_i_usage = as.numeric(data2$count_i_usage)
data2$count_you_usage = as.numeric(data2$count_you_usage)
data2$count_she_he_usage = as.numeric(data2$count_she_he_usage)


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
  
  
  modelFit <- train(class2 ~ ari + characters + complexwords + syllables + sentences + words + count_i_usage + count_you_usage + count_she_he_usage , data = dataTrain, 
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
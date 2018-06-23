library(glue)

# Vargha & Delaney's A12
vargha.delaney <- function(r1, r2) {
  m <- length(r1);
  n <- length(r2);
  return ((sum(rank(c(r1, r2))[seq_along(r1)]) / m - (m + 1) / 2) / n);
}

getSummaryACMLatexTableTemplate <- function() {
  tableTemplate = "\\begin{table}
                  \\caption{[caption]}
                  \\label{[label]}
                  \\begin{tabular}{cclllll} 
                   \\toprule
                      [categoryGeneralDesc] & Min. & 1st Qu. & Median & Mean & 3rd Qu. & Max. \\\\ 
                   \\midrule
                      [tableRows]
                    \\bottomrule
                  \\end{tabular}
                  \\end{table}"
  return (tableTemplate)
}

summaryACMLatexTable <- function (caption, label, categoryGeneralDesc, categoryFieldName, numericFieldName, data, fileName) {
  tableTemplate =  getSummaryACMLatexTableTemplate()
  
  categoryList = unique(as.character(data[[categoryFieldName]]))
  
  regexFieldCategory = glue("^{categoryFieldName}$")
  colIndexCategory = grep(regexFieldCategory, colnames(data))
  
  regexFieldNumericName = glue("^{numericFieldName}$")
  colIndexNumericField = grep(regexFieldNumericName, colnames(data))
  
  tableRows = ""
  for(c in categoryList) {
    dataAux = subset(data, data[, colIndexCategory] == c)
    categ = gsub("_", " ", c)
    s = summary(dataAux[ , colIndexNumericField])
    min = as.character(s[1])
    firstQ = as.character(s[2])
    median = as.character(s[3])
    mean = as.character(round(s[4], digits = 2))
    thirdQ = as.character(s[5])
    max = as.character(s[6])
    
    tableRow = glue("{categ} & {min} & {firstQ} & {median} & {mean} & {thirdQ} & {max} \\\\ ")
    tableRows = paste(tableRows, tableRow, sep = "\n ")
  }
  tableTemplate = glue(tableTemplate, .open = "[", .close = "]")
  write(tableTemplate, file = fileName, append = FALSE)
}

findDiff <- function (data, formula, numericFieldName, category, fileName) {
  ks = kruskal.test(formula, data)

  if(ks$p.value < 0.05) {
    pwcx = pairwise.wilcox.test(data[[numericFieldName]], data[[category]], p.adj="bonferroni", exact=FALSE)
    matrix <-pwcx$p.value
    df = data.frame(expand.grid(dimnames(matrix)),array(matrix))
    df2 = na.omit(df)
    index = 1
    #colNum = grep(category, colnames(data))
    regexFieldCategory = glue("^{category}$")
    colNum = grep(regexFieldCategory, colnames(data))
    desc = "category 1; category 2; p-value; effect-size 1-2 ; effect-size 2-1 \n"
    while(index <= nrow(df2)) {
      var1 = as.character(df2[index, 1])
      var2 = as.character(df2[index, 2])
      pvalue = df2[index, 3]
     
      
        g1 = subset(data, data[, colNum] == var1)
        g2 = subset(data, data[, colNum] == var2)
        effectSize1 = vargha.delaney(g1[[numericFieldName]], g2[[numericFieldName]])
        effectSize2 = vargha.delaney(g2[[numericFieldName]], g1[[numericFieldName]])
        effectSizeRound1 = round(effectSize1, digits = 2)
        effectSizeRound2 = round(effectSize2, digits = 2)
        desc = paste(desc, var1)
        desc = paste(desc, " ; ")
        desc = paste(desc, var2)
        if(pvalue < 0.01) {
          desc = paste(desc, "; < 0.01")
        } else if(pvalue < 0.05)  {
          desc = paste(desc, "; ")
          desc = paste(desc, round(pvalue, digits = 4))
        } else if(pvalue >=  0.05) {
          desc = paste(desc, "; invalid")
        }
        desc = paste(desc, "; ")
        desc = paste(desc, effectSizeRound1)
        desc = paste(desc, "; ")
        desc = paste(desc, effectSizeRound2)
        desc = paste(desc, " \n")
      
      index = index + 1
    
  }
  write(desc, file = fileName, append = FALSE)
  } else {
    print(glue("No diffs found for {category} and {numericFieldName}. No file will be saved at {fileName}"))
  }
}

isGaussionDistribution <- function(distribution) {
  
  #Kolmogorov-Smirnov test
  ks1 <- ks.test(distribution, "pnorm", mean=mean(distribution), sd=sd(distribution))
  if(ks1$p.value < 0.05){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

correlation <- function(data1, data2, title) {
  #Kolmogorov-Smirnov test
  ks1 <- ks.test(data1, "pnorm", mean=mean(data1), sd=sd(data1))
  ks2 <-  ks.test(data2, "pnorm", mean=mean(data2), sd=sd(data2))
  if(isGaussionDistribution(data1) && isGaussionDistribution(data2)) {
    #gaussion distribution
    correlationMethod(data1, data2, title, "pearson")
  } else {
    correlationMethod(data1, data2, title, "spearman")
  }
}

correlationMethod <- function(data1, data2, title, method) {
  print("--------------------------")
  print(paste("Method: ", method, " - " , title))
  correl <- round(as.numeric(cor(data1, data2, method = method)), digits = 1)
  pvalue <- as.numeric(cor.test(data1, data2, method = method)$p.value)
  valid <- FALSE
  pvaluePrint = as.character(pvalue)
  
  if(is.na(pvalue) == FALSE && pvalue < 0.05) {
    valid = TRUE
  }
  if(is.na(pvalue) == FALSE && pvalue < 0.001) {
    pvaluePrint <- as.character("< 0.001")
  }
  
  #interpretation described at https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3576830/
  interpretation <- "insignificant"
  if (is.na(correl) == FALSE && correl > 0.3 ){
    interpretation <- "weak"
  }
  if(is.na(correl) == FALSE && correl > 0.4) {
    interpretation <- "moderate"
  }
  if(is.na(correl) == FALSE && correl > 0.7) {
    interpretation <- "strong"
  }
  
  print(correl)
  print(pvaluePrint)
  print(paste("correl valid: ", as.character(valid)))
  print(interpretation)
  print("--------------------------")
}

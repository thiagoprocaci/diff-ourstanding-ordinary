source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$ari = as.numeric(data$ari)
data$words = as.numeric(data$words)
data$complexwords = as.numeric(data$complexwords)
data$sentences = as.numeric(data$sentences)
data$syllables = as.numeric(data$syllables)
data$characters = as.numeric(data$characters)


findDiff(data, ari ~ class, "ari", "class", "report/biology/specific/biology_ari_result.csv") 
findDiff(data, ari ~ class2, "ari", "class2", "report/biology/general/biology_ari_result.csv") 

findDiff(data, words ~ class, "words", "class", "report/biology/specific/biology_words_result.csv") 
findDiff(data, words ~ class2, "words", "class2", "report/biology/general/biology_words_result.csv") 

findDiff(data, complexwords ~ class, "complexwords", "class", "report/biology/specific/biology_complexwords_result.csv") 
findDiff(data, complexwords ~ class2, "complexwords", "class2", "report/biology/general/biology_complexwords_result.csv")

findDiff(data, sentences ~ class, "sentences", "class", "report/biology/specific/biology_sentences_result.csv") 
findDiff(data, sentences ~ class2, "sentences", "class2", "report/biology/general/biology_sentences_result.csv")

findDiff(data, syllables ~ class, "syllables", "class", "report/biology/specific/biology_syllables_result.csv") 
findDiff(data, syllables ~ class2, "syllables", "class2", "report/biology/general/biology_syllables_result.csv")

findDiff(data, characters ~ class, "characters", "class", "report/biology/specific/biology_characters_result.csv") 
findDiff(data, characters ~ class2, "characters", "class2", "report/biology/general/biology_characters_result.csv")



data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$ari = as.numeric(data$ari)
data$words = as.numeric(data$words)
data$complexwords = as.numeric(data$complexwords)
data$sentences = as.numeric(data$sentences)
data$syllables = as.numeric(data$syllables)
data$characters = as.numeric(data$characters)


findDiff(data, ari ~ class, "ari", "class", "report/chemistry/specific/chemistry_ari_result.csv") 
findDiff(data, ari ~ class2, "ari", "class2", "report/chemistry/general/chemistry_ari_result.csv") 


findDiff(data, words ~ class, "words", "class", "report/chemistry/specific/chemistry_words_result.csv") 
findDiff(data, words ~ class2, "words", "class2", "report/chemistry/general/chemistry_words_result.csv") 

findDiff(data, complexwords ~ class, "complexwords", "class", "report/chemistry/specific/chemistry_complexwords_result.csv") 
findDiff(data, complexwords ~ class2, "complexwords", "class2", "report/chemistry/general/chemistry_complexwords_result.csv")

findDiff(data, sentences ~ class, "sentences", "class", "report/chemistry/specific/chemistry_sentences_result.csv") 
findDiff(data, sentences ~ class2, "sentences", "class2", "report/chemistry/general/chemistry_sentences_result.csv")

findDiff(data, syllables ~ class, "syllables", "class", "report/chemistry/specific/chemistry_syllables_result.csv") 
findDiff(data, syllables ~ class2, "syllables", "class2", "report/chemistry/general/chemistry_syllables_result.csv")

findDiff(data, characters ~ class, "characters", "class", "report/chemistry/specific/chemistry_characters_result.csv") 
findDiff(data, characters ~ class2, "characters", "class2", "report/chemistry/general/chemistry_characters_result.csv")


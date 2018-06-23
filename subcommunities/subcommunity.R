library(ggplot2)
source(file = "../functions.R")

data = read.csv(file = "biology.csv", sep = ",", header = TRUE)
data$total_members = gsub(',','',data$total_members)
data$total_members = as.numeric(data$total_members)

findDiff(data, total_members ~ contains_outstd, "total_members", "contains_outstd", "report/biology/biology_total_members_result.csv") 

data = read.csv(file = "chemistry.csv", sep = ",", header = TRUE)
data$total_members = gsub(',','',data$total_members)
data$total_members= as.numeric(data$total_members)

findDiff(data, total_members ~ contains_outstd, "total_members", "contains_outstd", "report/chemistry/chemistry_total_members_result.csv") 

#data$ID <- seq.int(nrow(data))
#p <- ggplot(data, aes(x=ID, y=total_members)) +
  
#  labs(y = "Number of Members", x = "Subcommunity") + 
#  geom_point(aes(size=count_outstanding) ) + 
 # scale_size_continuous( name="Approx. Num. Outstanding")

#print(p)



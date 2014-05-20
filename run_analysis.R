run_analysis=function() {
  
  library(stringr)
  library(plyr)
  library(reshape2)
  library(lubridate)  
  # 1) Load the data 
  data_xtrain<-read.table(file="X_train.txt",sep="")
  data_ytrain<-read.table(file="y_train.txt",sep="")
  data_xtest<-read.table(file="X_test.txt",sep="")
  data_ytest<-read.table(file="y_test.txt",sep="")
  
  names_data<-read.table(file="features.txt",sep="")
  subject_train<-read.table(file="subject_train.txt",sep="")
  subject_test<-read.table(file="subject_test.txt",sep="")

  # 2) Merge the data (subjects, responses and features of train and test set respectively):
  
  data_test<-cbind(subject_test,data_ytest,data_xtest)
  
  data_train<-cbind(subject_train,data_ytrain,data_xtrain)

  # 3) Merge the test and train set
  
  data<-rbind(data_train,data_test)

  names(data)<-c("subject","activity",as.character(names_data[,2]))
  
  data_merge<-data
  
  # 4) Dataset with the measure on mean and std of each measure
  
  names<-names(data)
  
  index<-vector() #vector for storage the index of the mean and standar deviation for each
                  #measure
  
  k<-0
  for (i in 3:length(data)) {
 
  a<- str_split(names[i],"-")
  if (any(a[[1]]=="mean()") |any(a[[1]]=="std()")) { k<-k+1 
                                                    index[k]<-i }
   }
  
  
  data<-data[,c(1,2,index)] 
  
  # 5) tydy dataset with the average by activity and subject
  
  #insert the names of activities in the dataset
  
  labels<- read.table(file="activity_labels.txt",sep="")
  
  names(labels)<-c("activity","label")
  
  data<-merge(labels,data,by="activity")
    
  melt_data<-melt(data,id=c("subject","label"),measure.vars=names(data[,-(1:3)]))
  
  tidy_data<-dcast(melt_data,subject+label~variable,mean)
  
  return (list(data_merge,data,tidy_data))
  
  
}
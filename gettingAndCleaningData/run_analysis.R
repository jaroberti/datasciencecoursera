#this script was created to fulfill the course project of the Getting and Cleaning Data course offered by Johns Hopkins.

#Set working directory:
setwd("C:/Users/jroberti/JohnsHopkinsDataScience/gettingAndCleaningData/UCI HAR Dataset/")

#-----------START: OPEN FILES-----------#
#test
testSubject<-read.table("test/subject_test.txt")
testSet<-read.table("test/X_test.txt")
testActivities<-read.table("test/y_test.txt")

#train
trainSubject<-read.table("train/subject_train.txt")
trainSet<-read.table("train/X_train.txt")
trainActivities<-read.table("train/y_train.txt")

#ancillary
features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")
#-----------END: OPEN FILES-----------#


#-----------START: MERGING-----------#
#assign information in 'features' to the names of the train and test dataset:
names(trainSet) <- features[,2]
names(testSet) <- features[,2]

#merge the "labels" data:
mergedActivity<-rbind(trainActivities,testActivities)
names(mergedActivity)[1]<-"Activity"

#merge the "Subject" data:
mergedSubject<-rbind(trainSubject,testSubject)
names(mergedSubject)[1]<-"Subject"

#merge the two datasets using rbind:
mergedData<-rbind(trainSet, testSet)
#-----------END: MERGING-----------#


#-----------START: RESHAPING-----------#
#pull out the columns with means and standard deviations:
meansAndStds<-c()
for(i in 1:ncol(mergedData)){
    if(grepl("mean|Mean|std", colnames(mergedData[i]))==TRUE){
        meansAndStds<-append(meansAndStds,mergedData[i])
    }
}

#reshape matrix into data frame of means and standard deviations:
meansAndStds<-data.frame(meansAndStds)

#cbind the 'Subject' and 'Activity' columns to meansAndStds dataframe:
meansAndStds<-cbind(mergedActivity,meansAndStds)
meansAndStds<-cbind(mergedSubject,meansAndStds)

#convert numerical 'Activities' to descriptive 'Activities':
for(i in 1:nrow(meansAndStds)){
        index<-match(meansAndStds$Activity[i],rownames(activities))
        meansAndStds$Activity[i]<-as.character(activities[index,2])
}
#-----------END: RESHAPING-----------#


#-----------START: CREATE TIDY-----------#
#create Tidy dataset of mean values of each variable for each subject and activity using ddply fubction:
variableMeans<-ddply(meansAndStds, .(Subject,Activity), numcolwise(mean))
#write dataframe to .txt file:
write.table(variableMeans, file = "tidyData.txt", row.names = FALSE)
#-----------END: CREATE TIDY-----------#

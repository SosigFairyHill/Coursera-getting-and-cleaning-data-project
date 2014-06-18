run_analysis <- function() {
  filePath <- "./UCI HAR Dataset/"
  xTrain <- read.table(file=paste(filePath,"train/X_train.txt",sep=""))
  yTrain <- read.table(file=paste(filePath,"train/y_train.txt",sep=""))
  yNames <- read.table(file=paste(filePath,"activity_labels.txt",sep=""))
  xNames <- read.table(file=paste(filePath,"features.txt",sep=""))
  xTest <- read.table(file=paste(filePath,"test/X_test.txt",sep=""))
  yTest <- read.table(file=paste(filePath,"test/y_test.txt",sep=""))
  subjectsTest <- read.table(file=paste(filePath,"test/subject_test.txt",sep=""))
  subjectsTrain <- read.table(file=paste(filePath,"train/subject_train.txt",sep=""))
  xAll <- rbind(xTest,xTrain)
  yAll <- rbind(yTest,yTrain)
  xNamesFixed <- gsub("()","",xNames[,2],fixed=TRUE)
  xCols <- grepl("std",xNamesFixed) | grepl("mean",xNamesFixed)
  xReduced <- xAll[,xCols]
  allData <- cbind(yNames[yAll[,1],2],xReduced)
  names(allData) <- append("Activity",xNamesFixed[xCols])
  subjectsAll <- rbind(subjectsTest,subjectsTrain)
  allData <- cbind(subjectsAll,allData)
  names(allData) <- append("Subject",names(allData)[2:81])
  means <- aggregate(allData[,3:length(allData)],by=list(allData$Subject,allData$Activity),FUN=mean)
  names(means)[1:2] <- c("Subject","Activity")
  write.table(means, "./tidyMeans.txt", sep="\t")
  return(list("dataset"=allData,"tidy"=means))
}
  
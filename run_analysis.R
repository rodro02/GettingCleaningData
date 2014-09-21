# get the file url
fileurl = paste("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep='')

download.file(fileurl,destfile="accelerometers.zip",mode="wb")
# create a temporary directory
td = tempdir()
td <- "C:/Users/Owner/DataScientist/GettingandCleaningData/data"
# create the placeholder file
tf= "C:\\Users\\Owner\\DataScientist\\GettingandCleaningData\\data\\accelerometers.zip"
# get the name of the first file in the zip archive
fallnames=unzip(tf, list=TRUE)
# look for files with string body
t<-grepl("body",fallnames$Name, perl=TRUE)
fname1 <- fallnames[t,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) {
  
  d1 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d1$filename <- fname1[i,1] 
}


t<-grepl("total",fallnames$Name, perl=TRUE)
fname2 <- fallnames[t,]

# unzip the file to the temporary directory
unzip(tf, files=fname2[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname2[,1])
# reading all the text files for t
for (i in 1:nrow(fname2)){
  
  d2 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d2$filename <- fname1[i,1] 
} 

#LABELS
fname3 <- fallnames[18,]

# unzip the file to the temporary directory
unzip(tf, files=fname3[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname3[,1])
# reading all the text files for t
for (i in 1:nrow(fname3)) {
  
  d3 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d3$filename <- fname1[i,1] 
}

# LABELS 
fname4 <- fallnames[32,]

# unzip the file to the temporary directory
unzip(tf, files=fname4[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname4[,1])
# reading all the text files for t
for (i in 1:nrow(fname4)) {
  
  d4 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d4$filename <- fname1[i,1] 
} 
# xtest
fname5 <- fallnames[17,]

# unzip the file to the temporary directory
unzip(tf, files=fname5[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname5[,1])
# reading all the text files for t
for (i in 1:nrow(fname5)) {
  
  d5 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d5$filename <- fname1[i,1] 
} 

#x_train
fname6 <- fallnames[31,]

# unzip the file to the temporary directory
unzip(tf, files=fname6[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname6[,1])
# reading all the text files for t
for (i in 1:nrow(fname6)){ 
  d6 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
  d6$filename <- fname1[i,1] 
} 
#MERGING ALL FILES
md1 = merge(d1,d2,all=TRUE)
md2= merge(d5,d6,all=TRUE)
mall= merge(md1,md2,all=TRUE)

names(mall) <- c("mean","std","filename")
write.table(mall, file = "accelerometers.txt", sep = "", row.names = FALSE,
            col.names = TRUE,qmethod = "double")


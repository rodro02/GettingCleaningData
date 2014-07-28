# get the file url
fileurl = paste("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep='')
download.file(fileurl,destfile="accelerometers.zip",mode="wb")
# create a temporary directory
td = tempdir()
td <- "C:/Users/Owner/DataScientist/data"
# create the placeholder file
tf= "C:\\Users\\Owner\\DataScientist\\data\\accelerometers.zip"
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
for (i in 1:nrow(fname1)) 
  d1 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")


t<-grepl("total",fallnames$Name, perl=TRUE)
fname2 <- fallnames[t,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) 
  d2 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")

#LABELS
fname1 <- fallnames[18,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) 
  d3 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")

# LABELS 
fname1 <- fallnames[32,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) 
  d4 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
# xtest
fname1 <- fallnames[17,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) 
  d5 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
#x_train
fname1 <- fallnames[31,]

# unzip the file to the temporary directory
unzip(tf, files=fname1[,1], exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname1[,1])
# reading all the text files for t
for (i in 1:nrow(fname1)) 
  d6 = read.fwf(file=fpath[i], widths=c(9,10,13),header=FALSE, row.names=NULL,sep="")
#MERGING ALL FILES
md1 = merge(d1,d2,all=TRUE)
md2= merge(d5,d6,all=TRUE)
mall= merge(md1,md2,all=TRUE)


write.table(mall, file = "accelerometers.txt", sep = "", row.names = FALSE,
            col.names = FALSE,qmethod = "double")

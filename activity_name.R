activity_name <- function(act) {
  lables <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)[,2]
  switch(act,
         lables[1],
         lables[2],
         lables[3],
         lables[4],
         lables[5],
         lables[6])
}
README
========================================================

This document describe the process used in the run_analysis script for obtain a tidy dataset,
for simplicity just one script was created, the script works in five stages inside the function called run_analysis, this are:

- Load the data 
- Merge the data
- Merge the train and test set
- Create a data set with the mean and standar deviation of each measurement
- Create a tidy dataset with 

The function return a list with three elements this are:

- A dataset with train and test set merge 
- The mean and standar deviation of each measurement for the above dataset
- The tidy dataset submit for this project

So, if you want access to the tidy dataset you should do the following:

-  Assign a variable to the function (z<-run_analysis())
-  When the process finish, you could access to any element with z[[1]],z[[2]] or z[[3]],3) z[[3]] return the tidy dataset submit for this project

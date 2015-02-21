Directions:

In this repo of the project, the R file get-mean-project.R gives the R codes for the steps and requirement of the project.

In the first part, getting the data from files and use function to combine them together.

In the second part, we select the columns with mean and standard deviations, and then give them the names from the features.txt

After that, we get Use descriptive activity names to name the activities in the data set, we can get the data in the activity labels

Then we have to  appropriately label the data set with descriptive variable names

Finally, from the data we get above, creates a second, independent tidy data set with the average of each variable for each activity and 
each subject.

Variables:

x_test, x_train, y_test, y_train, subject_test and subject_train are the data we get from the file

xdata, ydata and subjectdata are the merged data from the previous respectively

features is the file containing the name we need for xdata, and we can select the columns we are interested in

activities contains the activity names we need to apply 

fdata contains all the data we obtained from previous, and we merge these data (xdata, ydata, subjectdata)  together to variable fdata

meandata is the result of calculation of mean.

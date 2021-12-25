# Code Book   
Variables and transformation
- X_train, X_test and features: input file ('X_train.txt', 'X_test.txt', 'features.txt' by read.delim() function
- then assign the column names from the features
- mean_names and std_names: find the meana and standard deviation by regular expression and grep()function
- train_extract and test_extract: select the column with the names found above
- subject_train, subject_test and activity: input 'subject.txt' file by read.table() function, then append the above dataset
- merge train and test data by merge() function and output 'merge_data'
- activity_labels: input 'activity_labels.txt' and use for loop to convert the activity 
- create 'variables': the names of variable, then use the gsub() function to edit the variables
- output the cleaned data (cleaned_data_1.csv) by write.csv()
- finally, use dplyr package. Then use group_by(subject, activity) and summarize.

For the final features included in the analysis:  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'timeof') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'frequencyof' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeofBodyAcc(XYZ).  
timeofGravityAcc(XYZ).  
timeofBodyAccJerk(XYZ).  
timeofBodyGyro(XYZ)               
timeofBodyGyroJerkXYZ   
timeofBodyAccMag    
timeofGravityAccMag   
timeofBodyAccJerkMag    
timeofBodyGyroMag   
timeofBodyGyroJerkMag            
frequencyofBodyAcc(XYZ)   
frequencyofBodyAccJerk(XYZ)    
frequencyofBodyGyro(XYZ)    
frequencyofBodyAccMag             
frequencyofBodyBodyAccJerkMag   
frequencyofBodyBodyGyroMag    
frequencyofBodyBodyGyroJerkMag    

The set of variables that were estimated from these signals are:  

mean: Mean value  
std: Standard deviation   

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:   

gravityMean   
timeofBodyAccMean   
timeofBodyAccJerkMean   
timeofBodyGyroMean    
timeofBodyGyroJerkMean  

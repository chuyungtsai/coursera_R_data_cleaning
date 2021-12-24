# Coursera_R_data_cleaning_project

R script: run_analysis.R  
Code book: codebook.txt  
Cleaned data sets: 
  1. cleaned_data_1.csv  
  2. cleaned_data_average.csv and .txt  

Explanation of the analysis R script:   
- First, use the downloadl.files function to download the dataset.  
- Then, import the training and testing files and features by read.delim function (sep ='', header=FALSE).  
- Update the column names of training and testing datasets by the feature.  
- Use the regular expression and grep function to extract the mean and standard deviation for each measurement. (Step 2 of the instruction)
- Read the table of subject and activity by read.table function and then add to the dataset 
- Merge these two dataset by rbind function (Step 1)
- Use the for loop and the activity labels to convert activity to descriptive name (Step 3)
- Use the regular expression and gsub function edit variable names (Step 4)
- Import dplyr library and use group_by and summarize function to create the secondary analysis (Step 5)

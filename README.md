# HumanActivityDataFromSmartPhone
Human Activity Data from Samsung Galaxy S smartphone

For this assignment, we downloaded the zipped data file
and unzipped it in a data subdirectory.


In the run_analysis.R script we created path variables for
each of the files we needed to load.

From the directory data/UCI HAR Dataset/ we read in the
files activity_labels.txt to identify how 6 integer
codes are mapped to the 6 human activities in the experiment.
The file features.txt was read into a data frame
to identify 561 measurment variables that are contained in the 
main data sets.

The data for all of these measurment variables was  read into data frames
from the 2 files data/UCI HAR Dataset/train/X_train.txt
             and  data/UCI HAR Dataset/test/X_test.txt
             
These were combined into a single data frame 
measurements_combined using the rbind function.
At this point we had 10299 observations of 561 variables in the data frame.

To add column names to this data frame, we processed the names from features.txt
by removing special characters and using underscore (_) as a separator.

We ended up with a data frame called combined_data with these column names
applied.

Next we wanted to select only a subset of the original 561 measurment variables
that measure mean or standard deviation.

To do this we filtered the original names from features.txt using a regular
expression -mean|-std to select only matching feature names. Using the grep function
we selected the integer indexes of only those features.
We applied these integer indexes to select only the corresponding columns of the
combined_data data frame into a new data frame mean_and_std.

The activity (integers 1-6) for each observation
was captured 
from the 2 files data/UCI HAR Dataset/train/Y_train.txt
             and  data/UCI HAR Dataset/test/Y_test.txt
which were read into separate data frames and then combined.
We created a factor column called human_activity to label these activities
in a readable way with the labels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Also the files subject_train.txt and subject_test.txt were read from the corresponding
directories, combined and used to create a subject column in the the final data set.

We appended these 4 column to the front of the 79 measurement columns to obtain the 
final data frame Step4_data for part 4 of the assignment:

1
subject -- integer code identifying the subject (person) for each observation
2
data_source -- A factor describing the source of the data as from the  TEST or TRAIN
datasets.
3
activity_index -- the integer index 1-6 of the human activity for each observation.
4
human_activity -- a factor identifying the activity as 
one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

At this point we have 83 columns with 10299 observations.

For part 5 of the assignment we used the following R command to group by
subject and human_activity and take the Average of the 79 measurment columns within
each grouping. This yielded 180 rows ( 30 subjects by 6 activities ) by 81 columns
in the final data set Step5_data.

The command was:

Step5_Data <- Step4_Data %>%
  group_by(human_activity, subject) %>%
  summarize(across(tBodyAcc_mean_X:fBodyBodyGyroJerkMag_meanFreq, mean))
  
  




             
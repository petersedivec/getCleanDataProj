# Getting & Cleaning Data Project Code Book

## Original Data Set
The original dataset, *Human Activity Recognition Using Smartphones Dataset Version 1.0*[1], is available from the UCI Machine Learning Repository at the following site: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

It contains the full dataset and description of data. For the purpose of this project we downloaded the dataset from the instructor provided link at (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Tidy Dataset Overview
The Tidy Dataset contains 180 observations and 68 variables. The Tidy Dataset is a subset of the original dataset focused on the mean() and standard deviation() variables included in the original data set and contains observations for each of 30 subjects performing six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) while each was wearing a smartphone attached to their waste. The Tidy Dataset looks at the mean value of each variable from the original dataset for each subject/activity combo.

### Variable Details
A total of 68 variables exist
1. subject - list of 30 volunteers numbered 1 to 30
2. activity - activity (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)

The remaining 66 variables are measurement variables, and are described by the following patterns. **The data captured in the Tidy Dataset is the mean of all signals recorded for a given subject performing a given activity**:
- starts with a 't' indicates time-domain signal, starts with a 'f' indicates frequency domain
- the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
- the magnitude of these three-dimensional accelerations were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
- an FFT was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
- '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tGravityAcc-mean()-X
7. tGravityAcc-mean()-Y
8. tGravityAcc-mean()-Z
9. tBodyAccJerk-mean()-X
10. tBodyAccJerk-mean()-Y
11. tBodyAccJerk-mean()-Z
12. tBodyGyro-mean()-X
13. tBodyGyro-mean()-Y
14. tBodyGyro-mean()-Z
15. tBodyGyroJerk-mean()-X
16. tBodyGyroJerk-mean()-Y
17. tBodyGyroJerk-mean()-Z
18. tBodyAccMag-mean()
19. tGravityAccMag-mean()
20. tBodyAccJerkMag-mean()
21. tBodyGyroMag-mean()
22. tBodyGyroJerkMag-mean()
23. fBodyAcc-mean()-X
24. fBodyAcc-mean()-Y
25. fBodyAcc-mean()-Z
26. fBodyAccJerk-mean()-X
27. fBodyAccJerk-mean()-Y
28. fBodyAccJerk-mean()-Z
29. fBodyGyro-mean()-X
30. fBodyGyro-mean()-Y
31. fBodyGyro-mean()-Z
32. fBodyAccMag-mean()
33. fBodyBodyAccJerkMag-mean()
34. fBodyBodyGyroMag-mean()
35. fBodyBodyGyroJerkMag-mean()
36. tBodyAcc-std()-X
37. tBodyAcc-std()-Y
38. tBodyAcc-std()-Z
39. tGravityAcc-std()-X
40. tGravityAcc-std()-Y
41. tGravityAcc-std()-Z
42. tBodyAccJerk-std()-X
43. tBodyAccJerk-std()-Y
44. tBodyAccJerk-std()-Z
45. tBodyGyro-std()-X
46. tBodyGyro-std()-Y
47. tBodyGyro-std()-Z
48. tBodyGyroJerk-std()-X
49. tBodyGyroJerk-std()-Y
50. tBodyGyroJerk-std()-Z
51. tBodyAccMag-std()
52. tGravityAccMag-std()
53. tBodyAccJerkMag-std()
54. tBodyGyroMag-std()
55. tBodyGyroJerkMag-std()
56. fBodyAcc-std()-X
57. fBodyAcc-std()-Y
58. fBodyAcc-std()-Z
59. fBodyAccJerk-std()-X
60. fBodyAccJerk-std()-Y
61. fBodyAccJerk-std()-Z
62. fBodyGyro-std()-X
63. fBodyGyro-std()-Y
64. fBodyGyro-std()-Z
65. fBodyAccMag-std()
66. fBodyBodyAccJerkMag-std()
67. fBodyBodyGyroMag-std()
68. fBodyBodyGyroJerkMag-std()

### Summary of Choices
As part of this experiment we were asked to focus on the mean() and std() variables from the original dataset. I made the assumption that we'd follow the original dataset naming convention and would only utilize feature names that matched 'mean()' or 'std()' exactly, hence this resulted in 66 features and we did not pickup some features (e.g. meanFreq()).

The other assumption made was to go with a skinny tidy dataset over a wide set.

### Experimental Study Design used
The experiment was pretty simple. The original dataset was downloaded and unzipped via the provided link above. We then manipulated the dataset using the run_analysis.R script which processed the original dataset into our tidy set. The only analysis performed was to take the mean of each feature for a given subject and activity which drastically reduced the dataset size and was done with the dcast function from the reshape2 package.

## References
========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
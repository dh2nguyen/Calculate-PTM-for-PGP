# Script for PTM Calculation

# By David H. Nguyen, PhD (www.TSG-Lab.org)


##############################
# Beginning of ReadMe Info 

#### Instructions ####

# For a video tutorial explaining PGP and PTM, see: https://youtu.be/KbmhxKWt5Gg

# 1. The PTM coefficient (Pavlidis Template Matching) is just the Pearson Correlation.
#       However, the difference is that one of the profiles (one of the two columns in the data) 
#       is a template pattern.   
# 2. Data should be a .csv file.
# 3. Data should only be numbers. 
# 4. Data should not have missing values.
# 5. Data should have two columns, each representing a profile that will be compared to the other profile. 
#     The name of the first column MUST be “p1” and the name of the second one MUST be “p2”.
# 6. Change the name of file in Step 1a.
# 7. The result will be outputted as "The PTM Coefficient is N.NNN".


###
# This script calculates the Pearson Correlation
# Pearson Correlation Coefficient: 

#         SUMMATION[ (Xi-Xm)*(Yi-Ym) ]
# r = --------------------------------- 
#     sqrt[(Xi-Xm)^2] * sqrt[(Yi-Ym)^2]
# 
#   Xi = values of profile 1 from i to n
#   Xm = the mean of profile 1
#   Yi = values of profile 2 from i to n
#   Ym = the mean of profile 2

# For a video tutorial of how to calculate Pearson's r, see:
# "How To... Calculate Pearson's Correlation Coefficient (r) by Hand" by Eugene O'Loughlin
# https://www.youtube.com/watch?v=2SCg8Kuh0tE


# End of ReadMe Info
###############################

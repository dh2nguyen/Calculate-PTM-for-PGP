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


###########
# Required packages
library(dplyr)
library(ggplot2)


###########
###########
# Step 1a. Load the data. Calculate means.
df = read.csv("change this file name.csv")

###
# Steb 1b

# This calculates the mean of profile 1
p1.mean = mean(df$p1)

# This calculates the mean of profile 2
p2.mean = mean(df$p2)


###########
###########
# Step 2. Generate the numerator for calculating the PTM value.


minusMean.p1 = function(input) {
  input - p1.mean
}

minusMean.p2 = function(input) {
  input - p2.mean
}

# This subtracts the mean of profile 1 from every item in profile 1
p1minusM = sapply(df$p1, minusMean.p1)


# This subtracts the mean of profile 2 from every item in profile 2
p2minusM = sapply(df$p2, minusMean.p2)


# This adds the above two vectors as new columns to the data frame we started with
df = cbind(df, p1minusM, p2minusM)

# This multiples every pair of items in the same row between the two columns specified
df = mutate(df, product.of.means = p1minusM * p2minusM)

# This sums the column resulting from the above line of code.
# This value will be the numerator for calculating the PTM value.
numerator = sum(df$product.of.means)


###########
###########
# Step 3. Generate the denominator for calculating the PTM value.

# This creates a new column that squares every value in the column called p1minusM
df = mutate(df, p1.minusMeanSq = p1minusM * p1minusM)

# This creates a new column that squares every value in the column called p2minusM
df = mutate(df, p2.minusMeanSq = p2minusM * p2minusM)

# This takes the square root of every item in the column called p2.minusMeanSq
sum.of.sq.p1 = summarise(df, sum(p1.minusMeanSq))

# This creates a new column containing the product of the two columns specified
sum.of.sq.p2 = summarise(df, sum(p2.minusMeanSq))

# This takes the square root of the sum of the squares for p1
sqrt.sumOfSq.p1 = sqrt(sum.of.sq.p1)

# This takes the square root of the sum of the squares for p2
sqrt.sumOfSq.p2 = sqrt(sum.of.sq.p2)


# This value will be the denominator for calculating the PTM value.
denominator = sqrt.sumOfSq.p1 * sqrt.sumOfSq.p2


###########
###########
# Step 4. This calculates the PTM coefficient that correlates profile 1 and profile 2!

ptm.value = numerator/denominator

paste("The PTM Coefficient is", ptm.value)




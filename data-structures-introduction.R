#----------------------------------------------------------------------------------------------
# File: data-structures-introduction.R
# Date: 03-25-2012
# Author: Eric Nantz
# URL: https://github.com/thercast/data_structures/blob/master/data-structures-introduction.R
# Email: theRcast@gmail.com
# Purpose: Examples of creating data structures discussed in the R-Podcast episode 4
# www.r-podcast.org/the-r-podcast-episode-4-data-structures-introduction
# License: Creative Commons Attribution-ShareAlike 3.0 Unported License
#----------------------------------------------------------------------------------------------

# numeric vector of 16 high school GPA scores
gpa.scores <- c(3.67, 3.95, 2.89, 4.00, 3.83, 3.18, 3.72, 2.75,
                3.01, 3.29, 4.00, 2.15, 2.89, 3.80, 3.55, 3.99)

# useful functions for exploring vectors in general
length(gpa.scores)
unique(gpa.scores)
length(unique(gpa.scores))  # number of unique elements

# character vector of grade level
grade.character <- c("freshman", "junior", "sophomore", "freshman",
                     "senior", "junior", "freshman", "sophomore",
                     "freshman", "junior", "junior", "sophomore",
                     "senior", "senior", "senior", "sophomore")


# useful functions for character vectors (note there are many others!)
tolower(grade.character)
toupper(grade.character)


# create a factor out of the grade character vector
grade.factor <- factor(grade.character)

# useful functions for factors
table(grade.factor)
levels(grade.factor)

# matrix of gpa scores with two columns corresponding to mid-semsester gpa and end of semester gpa
gpa.matrix <- matrix(gpa.scores, nrow=8, byrow=FALSE)

# use the [i,j] notation to extract specific elements from matrix
gpa.matrix[4,2]

# row names and column names can be added to the matrix or supplied in the matrix function
rownames(gpa.matrix) <- c("R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8")
colnames(gpa.matrix) <- c("mid", "end")

gpa.matrix.named <- matrix(gpa.scores,
                           nrow=8,
                           byrow=FALSE,
                           dimnames=list(c("R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8"),
                                         c("mid", "end")))

# you can extract elements using the names of rows and columns
gpa.matrix.named["R4", "end"]

# useful functions for exploring matrices
dim(gpa.matrix)
nrow(gpa.matrix)
ncol(gpa.matrix)
dimnames(gpa.matrix)


# create a list with the objects created so far
gpa.list <- list(gpa.scores, gpa.matrix, grade.character, grade.factor)

# extract components of a list using [[i]] 
gpa.list[[1]]

# names of the components of a list can be supplied the following ways
names(gpa.list) <- c("score.vec", "score.matrix", "grade.ch", "grade.f")
gpa.list <- list(score.vec=gpa.scores,
                 score.matrix=gpa.matrix,
                 grade.ch=grade.character,
                 grade.f=grade.factor)

# use the names to extract certain components
gpa.list$score.vec
gpa.list[["score.vec"]]

# useful functions for lists
names(gpa.list)
length(gpa.list) 


# create a data frame with gpa.scores and grade levels
gpa.data <- data.frame(gpa.scores, grade.character, grade.factor)

# assign names to the columns using any of the following
names(gpa.data) <- c("scores", "grade.level.ch", "grade.level.f")
colnames(gpa.data) <- c("scores", "grade.level.ch", "grade.level.f")
gpa.data <- data.frame(scores=gpa.scores, grade.level.ch=grade.character, grade.level.f=grade.factor)

# extract rows and columns of data frame using matrix indexing or list indexing
gpa.data[,1]
gpa.data$scores
gpa.data[["scores"]]
gpa.data[2,3]
gpa.data[2, "grade.level.f"]

# other useful functions can be applied to data frames:
nrow(gpa.data)
ncol(gpa.data)
unique(gpa.data) # returns all of the unique rows of the data frame
names(gpa.data)

# exploring the class and other attributes of objects in R

class(gpa.data) # try this on the other data structures to see how it compares
mode(gpa.data)
attributes(gpa.data)

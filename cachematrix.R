## This class contains 2 functions, makeCacheMatrix and cacheSolve.
## This pair of functions will cache the inverse an invertible matrix.

## makeCacheMatrix function creates a special "matrix" object 
## that can cache its inverse.
## <<- operator has been used to assign values to objects in an environment 
## that is different from the current environment.
makeCacheMatrix <- function(x = matrix()) {
  xInv <- NULL 
  set <- function(y) {
    x <<- y
    xInv <<- NULL 
  }
  
  get <- function() x 
  setInv <- function(inv) xInv <<- inv 
  getInv <- function() xInv 
## return a list that contains these functions, so that we can use
## makeCacheMatrix object like these
## x <- makeCacheMatrix(testmatrix)
## x$set(newmatrix) # to change matrix
## x$get # to get the setted matrix
## x$setInv # to set the inversed matrix
## x$getInv # to get the inversed matrix
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

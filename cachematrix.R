## This class contains 2 functions, makeCacheMatrix and cacheSolve.
## This pair of functions will cache the inverse an invertible matrix.

## makeCacheMatrix function creates a special "matrix" object 
## that can cache its inverse.
## <<- operator has been used to assign values to objects in an environment 
## that is different from the current environment.
makeCacheMatrix <- function(x = matrix()) {
  xInv <- NULL  ## xInv will store the inverse matrix. Now initialised with Null
  set <- function(y) {
    x <<- y
    xInv <<- NULL ## it also initialises xInv to null
  }
  
  get <- function() x ## returns the input matrix
  setInv <- function(inv) xInv <<- inv ## sets the inverse matrix.
  getInv <- function() xInv ## returns the inverse matrix.

## return a list that contains these functions, so that we can use

  list(set = set, 
       get = get,
       setInv = setInv,
       getInv = getInv)
}

## cacheSolve functions returns a matrix that is inverse of the input matrix 'x'

cacheSolve <- function(x, ...) {
  m <- x$getInv() 
  if(!is.null(m)) { 
    message("getting cached data")
    return(m) 
  }
  data <- x$get() 
  m <- solve(data) 
  x$setInv(m) 
  m # return the solved result
}
## Let us now test this.
## generate a random square, non-singular matrix t with 4 rows and 4 columns.
t <- matrix(runif(16,1,10),4,4)
## generate the makeCacheMatrix object with this matrix
tCached <- makeCacheMatrix(t)
## from here onwards it calculates or retrieves calculated inversion

tInv <- cacheSolve(tCached)
tInv <- cacheSolve(tCached)
tInv <- cacheSolve(tCached)

## I think it works!

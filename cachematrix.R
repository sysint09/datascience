## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## 
## MakeCacheMatrix(x) links to x matrix a list of functions to: 
## set x values: x$set(newvalues)
## get x values: x$get()
## set x inverse matrix values: x$setsolve(values)
## get x inverse matrix values: x$getsolve()
##
## Inverse matrix values are cached in the m variable in the MakeCacheMatrix
## environment
##
## the return objects is the list of functions
##

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setsolve <- function(solve) m <<- solve
      getsolve <- function() m
      list(set = set, get = get,
           setsolve = setsolve,
           getsolve = getsolve)
}


## Write a short comment describing this function
## 
## cacheSolve(x) returns the x matrix inverse using that approach:
## - first check if cached values are available and return them given
##   a message "getting cached data"
## - otherwise calculate the inverse matrix values, by solve() function,
##   and before return them cache the result using x$setsolve(values) 
##

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      m <- x$getsolve()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setsolve(m)
      m
}

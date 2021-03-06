makeCacheMatrix <- function(x = matrix(), ...){
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  
  
} 

cacheSolve = function(x, ...){
  
  m <- x$getInverse()
  
  if (!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  
    matrixData <- x$get()
    m <- solve(matrixData)
    x$setInverse(m)
    m
  
  
}
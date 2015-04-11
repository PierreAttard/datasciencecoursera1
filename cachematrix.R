## Hello!
## This functions will enable to return the inverse of a matrix
## You can run the code with this matrice A<-matrix(c(-3,-1,1,5,2,-1,6,2,-1),3,3)
## to see that the code works

## This function stores a matrix and cache's its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse<-NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get<-function() x
  setinverse <- function(inverse1) inverse <<- inverse1
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following function calculates the inverse of the special "vector" 
## created with the above function. However, it first checks 
## to see if the inverse has already been calculated. 
##If so, it gets the mean from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets 
## the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  inverse<-x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  matrice <- x$get()
  inverse <- solve(matrice)
  x$setinverse(inverse)
  inverse
        ## Return a matrix that is the inverse of 'x'
}

##Thank you

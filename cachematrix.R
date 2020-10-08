## makeCacheMatrix creates a special "matrix", 
## that can cache its inverse
##
##    set the value of the matrix
##    get the value of the matrix
##    set the value of the inverse
##    get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    ## set the value of the matrix
    set <- function(y) {
        x <<- y
        i <<- NULL
    }

    ## get the value of the matrix
    get <- function() x

    ## set the value of the inverse
    setInverse <- function(solve) i <<- solve

    ## get the value of the inverse
    getInverse <- function() i

    ## return the functions available on this object
    list (
        set = set, 
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
    )
}


## The following function calculates the inverse of the special "matrix" 
## returned by makeCacheMatrix 
##
## If the inverse has already been calculated 
## (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    
    ## get the inverse
    i <- x$getInverse()

    ## if the inverse has already been computed
    ## return that computed value
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }

    ## if the inverse hasn't already been computed
    ## get the matrix
    data <- x$get()

    ## compute the inverse
    i <- solve(data)

    ## cache the inverse so it's available for subsequent calls
    x$setInverse(i)

    ## return the inverse
    i
}

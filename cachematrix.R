## makeCacheMatrix creates a special "matrix", 
## that can cache its inverse
##
##    set the value of the matrix
##    get the value of the matrix
##    set the value of the inverse
##    get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) i <<- solve
    getInverse <- function() i
    list (
        set = set, 
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
    )
}



cacheSolve <- function(x, ...) {

}

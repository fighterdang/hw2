## peer assignment

## make an "matrix" object embedded with four functions:
## 1.set: set new values (if any)
## 2.get: get the matrix in this object
## 3.setsolve: make m equals to the inverse of matrix x
## 4.getsolve: get the value m

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(inverse) m <<- inverse
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## caching the inverse of x and save it to the original object you
##created in the first function

cacheSolve <- function(x, ...) {
        m <- x$getsolve()           #query the x's cache         
        if(!is.null(m)) {           #if there is a cache
                message("getting cached data") 
                return(m)                #just return the value
        }
        data <- x$get()             #if there's no cache
        m <- solve(data, ...)        #compute here
        x$setsolve(m)         #save the result back to x's cache
        m                           #return the result
}

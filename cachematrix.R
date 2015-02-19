## these functions help in caching the inverse of a matrix rather than computing it repeatedly 
##to set or get the value of matrix or its inverse
makeCacheMatrix<-function(x=matrix()){
  m<-NULL
  set<-function(y=matrix()){
    x<<-y
    m<<-NULL
                                   ##to assign new data to x and discard the old inverse stored in m.      
  }
  get<-function()x                ## to get the value of x
  setinv<-function(inv) m<<-inv   ##takes inv as an argument and save its value in the m variable in global env
  getinv<-function() m            ##returns the value of mean
  
  list(set=set,get=get,setinv=setinv,getinv=getinv)## makecachemeans returns a list of functions
}

##2nd function to calculate the inverse or to get a cached value
cacheSolve<-function(x=matrix(),...){
  m<-z$getinv()                     ##z=makeCacheMatrix(...)
  if(!is.null(m))  {
    print("printing cached inverse") ##to check if m is already calculated
    return(m)
  }
  mat<-z$get()
  m<-solve(mat)                     ## to calculate inv if it ws not previously calculated
  z$setinv(m)                       ##to set new value of inverse just calculated
  m
}

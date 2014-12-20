add2<-function(x,y){
  x+y
}

above10<-function(x){
  use<-x>10
  x[use]
}

above <-function(x,n){
  use<-x>n
  x[use]
}

above <-function(x,n=10){
  use<-x>n
  x[use]
}

columnmean <-function(y,removeNA=TRUE){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in1:nc){
    means[i]<_mean(y[,i],na.rm=removeNA)
}
means
}
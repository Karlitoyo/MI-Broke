# input_functions ------------------------------------------------------------------------------

# l0: Create list structure to guarantee that all elements exist
l0 <- function(npar = 13, nass = 3, nlia = 3){
  chars <- list(country = NA, industry = NA) # list of characters
  pars <- data.frame(t(rep(1,npar)))
  assets <-  data.frame(t(rep(NA,nass)))
  liabilities <- data.frame(t(rep(NA,nlia)))
  nums <- list(assets = assets, liabilities = liabilities, pars = pars ) # list of numerics
  l0  <- list(char = chars, num = nums) # dummy list
}

# example_list --------------------------------------------------------------------------------

# Example:Fill list with inputs
l <- l0()

l$char$country <- "Germany"
l$char$industry <- "dog groomer"

# l$num$assets$X1 <- 100
# l$num$assets$X2<- 100
# l$num$assets$X3<- 100
# l$num$liabilities$X1 <- 20
# l$num$liabilities$X2 <- 20
# l$num$liabilities$X3 <- 20
l$num$assets[1,] <- c(100, 100, 100)
l$num$liabilities[1,] <- c(20,20,20)
l

# lc: function for sanity check 
lc <- function(l){
  all(
    rapply(l$char, is.character), # characters
    rapply(l$num, is.numeric), # numerics
    #rapply(l$num, function(x) x >= 0), # all positive ? 
    !rapply(l, is.na),  # no missings
    (rapply(l, length)  == 1) # not more than 1 value each
  )
}

# model_functions -----------------------------------------------------------------------------

# tl: traffic light function
tl <- function(st, g = 24, y = 12){
  if(is.numeric(st) & length(st) == 1){
    # g <- 24 # green threshold
    # y <- 12 #  yellow threshold 
    cl = cut(st, breaks = c(-Inf,y,g,Inf), labels = c("red","yellow", "green"))
    return(cl)
  }
  else{return(NA)}
}

# survive function
survive <- function(l){
  if(lc(l)){
    st <- with(l$num, 
               sum(assets)/sum(liabilities) # basic model 
    )
    st <- max(c(0, st)) # if negative -> 0, should not be needed ... 
    cl <- tl(st) # traffic light color
    rt <- list(st = st, cl = cl) # return list
    return(rt)
  }
  else{return(NA)} # return NA if the list is not well behaved
}

###############################
# Example model output 
(s <- survive(l))

s$st
s$cl
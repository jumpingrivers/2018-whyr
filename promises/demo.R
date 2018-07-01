## DEMO 1

library("ggplot2movies")
library("tictoc")
data(movies, package = "ggplot2movies")

display = function(){
  Sys.sleep(10)
  fit = lm(rating ~ year,data = movies)
  return(fit)
}

### run following 4 lines of code, make it evident you cannot run 1+1
### until display() has finishedd

tic()
display()
toc()
1+1


## DEMO 2

### run following 5 lines of code

library("future")
plan(multiprocess)
tic()
fit = future(display())
toc() # look, 0 seconds! 

### run following 4 lines of code
tic()
fit = future(display())
value(fit)
toc() # boo still takes same time to get value back! 


## DEMO 3

library("promises")

### this is how we chain synchronously
display() %>% 
  print()

### this is how we chain asynchronously
future(display()) %...>% 
  print()
1+1

#### make it evident we can now 
#### do multiple things at once and still return stuff

## SHINY DEMO

#### sync app

library("shiny")
runApp('../demo_sync') # may need to change path

##### show how if we set one app fitting a model,
##### then try to load another app, it doesn't load until it has finished

#### async app

runApp('../demo_async')

##### show how if we set one app fitting a model,
##### then try to load another app, it does load,
##### now we can set lots of models off at once




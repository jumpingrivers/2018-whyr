library("methods")

knitr::opts_chunk$set(
  comment = "#>",
  echo = TRUE,
  collapse = TRUE,
  cache = TRUE,
  fig.align="center",
  fig.pos="t",
  out.width = "70%",
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi,
  dev="svg"
)
set.seed(2016)
options(digits = 3)
options(dplyr.print_min = 4, dplyr.print_max = 4)

setnicepar = function(mar=c(3,3,2,1),
         mgp=c(2,0.4,0), tck=-.01,
         cex.axis=0.9, las=1, mfrow=c(1,1),...) {
  par(mar=mar,
      mgp=mgp, tck=tck,
      cex.axis=cex.axis, las=las,mfrow=mfrow,...)
}

##TODO: Put in package then add to author
get_author = function() {
  user = Sys.info()["effective_user"]
  if(user == "ncsg3") {
    rtn = "Colin Gillespie ([\\@csgillespie](https://twitter.com/csgillespie))"
  } else {
    rtn = "Jumping Rivers ([\\@riversjumping](https://twitter.com/riversjumping))"
  }
  rtn
}

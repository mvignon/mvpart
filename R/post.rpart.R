"post.rpart" <-
function(tree, title.,
               filename=paste(deparse(substitute(tree)),".ps",sep=""),
               digits=getOption("digits") - 3, pretty=TRUE,
               use.n=TRUE,  horizontal=TRUE, ...)
{
    if(filename !=""){
    postscript(file = filename, horizontal=horizontal, ...)
    par(mar=c(2,2,4,2)+.1)
    on.exit(dev.off())
    }
    else {
    oldpar <- par(mar=c(2,2,4,2)+.1)
    on.exit(invisible(par(oldpar)))
    }

    plot(tree, uniform=TRUE, branch=.2, compress=TRUE, margin=.1)
    text(tree, all=TRUE, use.n=use.n, digits=digits, pretty=pretty)
    method <- tree$method

    if(missing(title.)) {
        temp  <- attr(tree$terms,'variables')[2]
        title(paste("Endpoint =",temp),cex=.8)
    } else if (title. !="") title(title.,cex=.8)
}


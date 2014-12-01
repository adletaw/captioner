\name{incrementer}
\alias{incrementer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
incrementer()
}
%- maybe also 'usage' for other objects documented here.
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    OBJ_LIST <- c()
    function(obj, label = FALSE, pre_text = "Figure") {
        obj_list <- OBJ_LIST
        if (label) {
            if (!any(obj_list == obj)) {
                assign("OBJ_LIST", c(obj_list, obj), inherits = TRUE)
                obj_list <- OBJ_LIST
            }
            obj_num <- match(obj, obj_list)
            obj_label <- paste(pre_text, obj_num, sep = " ")
            return(obj_label)
        }
        else {
            if (any(obj_list == obj)) {
                stop("This object name has already been assigned.")
            }
            assign("OBJ_LIST", c(obj_list, obj), inherits = TRUE)
            return(invisible())
        }
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

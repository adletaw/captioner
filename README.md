*captioner* is an R package for generating figure numbers and captions

the subdirectory `captioner` contains the package files

to install:
* `install.packages("devtools")`
* `library(devtools)`
* `install_github("adletaw/captioner/captioner")`

functions:

* `incrementer()` returns a function that will increment a set of figures or tables
* `caption()` simply uses `paste` to combine everything into a single caption

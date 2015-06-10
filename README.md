[![Build Status](https://travis-ci.org/adletaw/captioner.png?branch=master)](https://travis-ci.org/adletaw/captioner)

*captioner* is an R package for generating figure numbers and captions

**Current version:** [Betadiversity 2.2.1](https://github.com/adletaw/captioner/releases/tag/v2.2.1) (10 June 2015).  Temporarily added in deprecated parameters for backwards compatibility.

**Previous version:** [Betadiversity 2.2.0](https://github.com/adletaw/captioner/releases/tag/v2.2.0) (10 June 2015).  Define captions without display.  Some parameters deprecated since previous version.

**Installation**

to install:
* `install.packages("devtools")`
* `devtools::install_github("adletaw/captioner")`

or if you want the vignette:
* `devtools::install_github("adletaw/captioner", build_vignettes = TRUE)`
* `vignette("using_captioner")`

**Usage**

`captioner()` returns a captioner function for each set of figures, tables, etc. that you want to create.  See the help files for more details.

For example:

`> fig_nums <- captioner()`

`> fig_nums("my_pretty_figure", "my pretty figure's caption")`

"Figure 1: my pretty figure's caption"

`> fig_nums("my_pretty_figure", display = "cite")`

"Figure 1"

Or you can store the caption and use it in your R code chunk in markdown documents:

`> my_first_caption <- fig_nums("my pretty_figure", "my pretty figure's caption")`

If you create a new set of captions, perhaps for your tables, the numbering restarts:

`> table_nums <- captioner(prefix = "Table")`

`> table_nums("damn_fine_table", "this table is damn fine")`

"Table 1: this table is damn fine"

You can abbreviate in text citations by using `partial`<sup>1</sup> from the package `pryr` to create a shorter version of the function.  For example:

`> citef <- partial(fig_nums, display = "cite")`

Now you can shorten this:

`> fig_nums("my_pretty_figure", display = "cite")`

To this:

`> citef("my_pretty_figure")`

Take a look at the [vignette](https://github.com/adletaw/captioner/tree/master/vignettes/using_captioner.Rmd) for many more details.

***

1.  I learned this from the glorious H Wickham and [you can too](http://adv-r.had.co.nz/)

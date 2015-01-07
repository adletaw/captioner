*captioner* is an R package for generating figure numbers and captions

**Installation**

the subdirectory `captioner` contains the package files

to install:
* `install.packages("devtools")`
* `devtools::install_github("adletaw/captioner/captioner")`

**New Features (January 2015)**

Caption storage:

`captioner()` will now store your captions.  This will allow you to print a caption more than once without typing it again.  For example:

`> fig_nums <- captioner()`

`> fig_nums("my_pretty_figure", "my pretty figure's caption")`

"Figure 1: my pretty figure's caption"

Now the caption is stored and can be accessed by:

`> fig_nums("my_pretty_figure")`

"Figure 1: my pretty figure's caption"

Citation order:

`captioner()` will now allow you to cite a figure before creating its caption.  The ordering of the captions is determined first by citation order, then by caption creation order.

`> fig_nums("another_figure", cite = T)`

"Figure 2"

`> fig_nums("another_figure", "this figure's caption")`

"Figure 2: this figure's caption"

**Usage**

`captioner()` returns a captioner function for each set of figures, tables, etc. that you want to create.  See the help files for more details.

For example:

`> fig_nums <- captioner()`

`> fig_nums("my_pretty_figure", "my pretty figure's caption")`

"Figure 1: my pretty figure's caption"

`> fig_nums("my_pretty_figure", cite = TRUE)`

"Figure 1"

Or you can store the caption and use it in your R code chunk in markdown documents:

`> my_first_caption <- fig_nums("my pretty_figure", "my pretty figure's caption")`

If you create a new set of captions, perhaps for your tables, the numbering restarts:

`> table_nums <- captioner(prefix = "Table")`

`> table_nums("damn_fine_table", "this table is damn fine")`

"Table 1: this table is damn fine"
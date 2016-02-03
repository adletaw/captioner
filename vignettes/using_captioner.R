## ----devtools, eval = FALSE----------------------------------------------
#  install.packages("devtools")

## ----captioner, eval = FALSE---------------------------------------------
#  devtools::install_github("adletaw/captioner")

## ----table_captions_1----------------------------------------------------
library(captioner)

table_nums <- captioner(prefix = "Table")

## ----table_captions_2----------------------------------------------------
table_nums(name = "iris", caption = "Edgar Anderson's iris data.  All measurements are in centimetres.")

## ----table_captions_3----------------------------------------------------
table_nums("iris")

## ----table_captions_4----------------------------------------------------
iris_cap <- table_nums("iris")

## ----table_captions_4.5, eval = FALSE------------------------------------
#  {r iris_table, fig.cap = iris_cap}

## ----table_captions_5, eval = FALSE--------------------------------------
#  `r table_nums("iris")`

## ----no_display----------------------------------------------------------
table_nums("peony", display = FALSE)

## ----fig_caps1-----------------------------------------------------------
fig_nums <- captioner()

## ----fig_caps2-----------------------------------------------------------
fig_nums("apple", "Relationship between the number of apple seeds and the size of the apple.")
fig_nums("milk_fat", "Average percentage of fat in milk from various animals.")
fig_nums("tree_height", "Distribution of heights in common restinga tree species.")

## ----tab_caps------------------------------------------------------------
table_nums("world_pop", "World populations ordered from greatest to least.")
table_nums("dolphins", "List of dolphin species and their brain sizes.")

## ----cite----------------------------------------------------------------
fig_nums("milk_fat", display = "cite")

## ----cite_2, eval = F----------------------------------------------------
#  "There was no significant trend in milk fat between gramnivores" (`r fig_nums("milk_fat", display = "cite")`).

## ----cite_3--------------------------------------------------------------
fig_nums("snuff",  display = "cite")
fig_nums("bounce", "Bounce height (cm) of balls made of various types of rubber.")
fig_nums("snuff",  "Average size of snuff boxes used from 1808 to 1908.")
fig_nums("bounce", display = "cite")

## ----hierarchy-----------------------------------------------------------
figs_2 <- captioner(levels = 3, type = c("n", "n", "n"), infix = "-")
figs_2("A", "The letter A in several typefaces.")

## ----hierarchy_2---------------------------------------------------------
figs_2("B", display = "cite", level = 2)

## ----hierarchy_3---------------------------------------------------------
bump(figs_2, level = 1)

figs_2("C", "The letter C shown in fixed-width fonts.")


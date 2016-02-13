# captioner 2.2.3.9000

In this version, enhancements have been made to allow formatting via knitr
chunk options, CSS, and LaTeX.

## Major changes

### Figure suffix

The parameter `suffix` allows you to specify a figure suffix.  The default
value is `: `, but if an alternate is used, you must specify the blank space
between the figure number and the caption manually.  `auto_space` is now
deprecated.

### Markdown style formatting

Using `style` and `style_prefix` you can set markdown style formatting (bold,
italic, bold+italic), which applies either to the entire caption
(`style_prefix = FALSE`) or to the prefix only (`style_prefix = TRUE`).

### Knitr hooks

Added a hook to automatically display figure captions using the chunk name
to find the caption.  Other chunk options can be set inside the call to
`captioner()`.

To use the hook, the name of your chunk must be identical to the name of the
caption that you want to display.  Also, you must add the option `cap = X`
where `X` is the name of your `captioner()` function.

The new parameters `before` and `knitr_op` were also added to `captioner()`.
`before` allows you to determine whether to display the caption before
(`before = TRUE`) or after (`before = FALSE`) when using automatic caption
display. `knitr_op` takes a named list containing any other chunk options that
you want to keep constant across all captioned chunks.

### CSS classes

You can specify a CSS class to go with the caption and aid in formatting by
using the parameter `css_class` when creating your `captioner()` function.

# captioner 2.2.3

## Minor changes

Updated documentation in preparation for CRAN release

# captioner 2.2.2

## Bug fixes

Fixed a bug in the code deprecation message

# captioner 2.2.1

## Minor changes

Maintains the deprecated parameters `cite` and `num` for backwards compatibility

# captioner 2.2.0

## Major changes

Adds a `display` parameter that allows captions to be defined without displaying them (#14).  This replaces the parameters `cite` and `num`.

# captioner 2.1.0

## Major changes

Added capability to display the figure number without any surrounding text using the parameter `num` (#10).

# captioner 2.0

## Major changes

Added the capability to do hierarchical numbering (e.g. Figure 1.1.1). (#8, #11)

# captioner 1.2

## Major changes

* Added the capability to store captions so they can be accessed later.
* Added the possibility to cite a caption before displaying it

# captioner 1.1

Captioner's first unofficial release.
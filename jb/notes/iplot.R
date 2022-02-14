library(IRdisplay)

# TODO: Replace implementation of iplot with one based on `option` to change the aspect ratio. See:
# - https://stackoverflow.com/a/60196822/622049
#
# This approach should make it easier to convert future documents as well. In fact, could you change
# nothing and simply add `;` to suppress the NULL you dislike?
#
# Prefer a standard width (24*45 = 1080) in images, so that they render decently on e.g. a width
# 1080 screen. Set only `ar` (aspect_ratio, fraction width/height) in most calls to this function.
iplot <- function(plot_func, scale=24, x_scale=45, ar=1.4) {
    # This error only appears with `source` on the command line (not running a notebook):
    # - https://stackoverflow.com/a/59003534/622049
    stopifnot(ar <= 4.5)
    # https://stackoverflow.com/a/35805352/622049
    png("/tmp/plot.png", width=x_scale*scale, height=round(x_scale/ar)*scale, res=120)
    x = plot_func()
    dev.off()
    display_png(file="/tmp/plot.png")
    return (x)
}

display_precis <- function(m, name, ar) {
  flush.console()
  display_markdown("Raw data (following plot):")
  display(precis(m, depth=3), mimetypes="text/plain")
  iplot(function() {
    plot(precis(m, depth=3), main=name)
  }, ar=ar)
}

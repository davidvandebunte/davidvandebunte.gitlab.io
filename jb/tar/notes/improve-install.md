# Improve install

## TODO-mpd: Move pip and conda dependencies to notebooks

The smaller you can make your box, the more shareable your code will be. You've often wanted to
share notebooks on e.g. Wikipedia or SE and had to link to your own website instead; you once used
Google Colab to share something on Wikipedia. You may want to share notebooks with friends/family in
the future, and have your kids take notes and do homework in Colab. In general, if you `pip install`
within your notebook then you can get at least some of these dependencies out of your custom docker
image into a latched artifact. As long as you log what you are doing in the pip install process as
part of the notebook, this is no worse than a docker save with an attached log of your docker build.
Notebooks built in this way, if they only have a python dependency, will be directly uploadable and
runnable on Google Colab, Microsoft Azure Notebooks, or AWS notebooks. See:
- https://stackoverflow.com/a/61212861/622049

You don't have to move all your dependencies inline into your notebook; only pip and conda
dependencies. If you are opening the document in Jupyter to edit and improve it, then it will latch
your installed packages into the running kernel while you are improving the notebook. You should
move all of these kinds of dependencies into notebooks so they are shareable. It would actually be
quite easy to perform this move; you can tell what pip/conda packages you need to install in which
notebooks based on where you use an `import` statement with the library in a notebook.

This applies in reverse as well. You were able to get the annotated transformer notebook working
quickly because it had a similar list in a requirements.txt file. You really don't have to list
every package twice in the notebook if you want to put everything in a requirements.txt file, or
even better, a Pipfile.

After this is done, you could try to install the R packages you have on top of the GPU jupyter
docker image. If that works, you suddently have a much more valauble (if monstrous) image you can
work from. It's likely you installed the R packages second as a hack, anyways (just to get it
working). You should almost always be installed system (i.e. C, C++) packages before you install
interpreted language packages because the latter are almost always going to depend on the former
(not vice versa, unless perhaps a C/C++ package uses an interpreted language in installation
scripts).

This also simplifies the reproducibility problem in general. You may actually need a different
version of a package to achieve reproducibility in one notebook than another.

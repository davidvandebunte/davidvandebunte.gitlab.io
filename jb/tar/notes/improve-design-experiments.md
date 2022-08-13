# Improve design experiments

# TODO-rib: When should you reduce inductive bias?

See:
- [Inductive bias](https://en.wikipedia.org/wiki/Inductive_bias)

# TODO-dr: Should you reduce the dimensionality of your inputs?

Add a reduce-dimensionality.md article.

The model is not the same as the real thing; you almost always simplify the real world to put it
into a model. So it's almost never a question of whether or not to reduce dimensionality, but
whether you can afford to reduce it more (for your particular task).

A greater simplification lets you attend to more at once, at the cost of effectively letting you see
less detail in every item because it's more simplified. For example, a planning git graph has many
tasks that are all drastic simplifications of the full task. Some of the worst aspects of it are
that you can't really rearrange the items in the graph without understand them in enough detail to
understand their dependencies. Still, the graph is useful because it lets you see (attend to) more
at once. Said another way, it provides a useful abstraction.

Similarly, to "load" code into your head by reading it is actually to decompress it into natural
language (increasing dimensionality). You often think of compressing code into natural language,
because documentation is often shorter than the code. The reason this isn't "compression" is that
documentation is also much less complete (detailed) than code. Documentation attends to less, but
can be more detailed because of that. Watch out for code that throws away details, however, in the
sense of throwing away long variable names in exchange for single letter names (or even more so,
when compiling to a binary). Ideally the documentation is in the code so nothing gets lost (avoid
lossy compression), or at the least you retain links to documentation (as e.g. .md files.

Should code have minimal comments so you can avoid conflicts only due to documentation changes? You
should deal with documentation conflicts separately than code conflicts, even if you are dealing
with them in the same commit. If you see natural language as compressing to code, and plain text
code as compressing to binaries, then this is similar to the question of whether to include symbols
in your binaries. Most of the time, you don't need to. In fact, if you allow different people to
have a different understanding of the code (e.g. Bayesian vs. Frequentist, or simply based on
different documentation) then you don't want to include all possible interpretations. What is
"tricky" (needing comments) may be different to different people. See also Linus' thoughts in
[a/lt-debugger](https://lwn.net/2000/0914/a/lt-debugger.php3); you found this link in [Forcing
people to read and understand code instead of using comments, function summaries and debuggers? -
SESE](https://softwareengineering.stackexchange.com/questions/201657).

Said another way, don't use a fork of the code to make comments. Comment on the code through
documentation; your fork should only remove and simplify code. You also like that this lets you fit
more code onto your screen at once (that you've understood). If you do need to make comments inline
to avoid the split-attention effect, then you can move them out of the code once you understand it
and you have your first conflict.

Is a picture worth a thousand words? It depends on the picture, and what kind of task you need to do
with it. Why aren't you asking about the resolution of the image?

Could you use PCA to come up with initial weights to help ease the training of a net? That is,
manually strip out as many variables as you want, use that as the dimensionality of a matrix, and
then let the net learn to tweak the weights of the projection matrix as well.

See:
- [Dimensionality reduction](https://en.wikipedia.org/wiki/Dimensionality_reduction)

Tag search on SE: [Highest scored 'dimensionality-reduction' questions - CV](
https://stats.stackexchange.com/questions/tagged/dimensionality-reduction).

Is multicollinearity really much of a problem as long as you are doing some dimensionality
reduction anyways? See:
- https://en.wikipedia.org/wiki/Dimensionality_reduction#Dimension_reduction

This is related to whether you should ever add a new variable to a model. Does the variable matter?
See also:
- [Latent variable](https://en.wikipedia.org/wiki/Latent_variable)
- [correlation - In supervised learning, why is it bad to have correlated features? - DSSE](
https://datascience.stackexchange.com/questions/24452/)
- [What is dimensionality reduction? Difference between feature selection and extraction? - DSSE](
https://datascience.stackexchange.com/questions/130/)

Once you define this better, replace the link to Wikipedia with your own article in your public
notes (run a git grep to find the link you have now).

What if your input data had redundancies? The neural network can't tell you it is ignoring some of
your inputs. Should you always use PCA or an autoencoder to help remove the unnecessary information?
If it just learns to ignore the data in the first few layers it's not a big deal, though.
[1]: https://stats.stackexchange.com/questions/70899/what-correlation-makes-a-matrix-singular-and-what-are-implications-of-singularit
[2]: https://en.wikipedia.org/wiki/Dimensionality_reduction#Feature_selection

# TODO-rbsap

Commenting on [](./se/relationship-between-svd-and-pca.md).

Why is `flip_signs` necessary? See also [linear algebra - Calculating SVD by hand: resolving sign
ambiguities in the range vectors. - Math SE](https://math.stackexchange.com/questions/1805191/).

See point `4.`. What are loadings?

See point `7.`. Why would anyone want to perform PCA on a correlation matrix rather than a
covariance matrix? Related to [Principal component analysis - Further considerations](
https://en.wikipedia.org/wiki/Principal_component_analysis#Further_considerations).

See also [Highest scored 'linear-algebra' questions - Math SE](
https://math.stackexchange.com/questions/tagged/linear-algebra).

# TODO-mspca

See the first answer to [Making sense of principal component analysis, eigenvectors & eigenvalues -
CV](https://stats.stackexchange.com/a/140579/189415). Missing the [Spectral theorem](
https://en.wikipedia.org/wiki/Spectral_theorem) dependency.

# TODO-ce: Is "cross-entropy" a useful abstraction?

You should write out or add to your own notes in SR2 on this topic. That is, publish an article in
your own words. You like how this article uses Wikipedia images, just like you intend to:
- https://glassboxmedicine.com/2019/12/07/connections-log-likelihood-cross-entropy-kl-divergence-logistic-regression-and-neural-networks/

Closer to understanding the Kullback-Leibler Divergence:
- https://www.countbayesie.com/blog/2017/5/9/kullback-leibler-divergence-explained

Colah's take on information theory:
- https://colah.github.io/posts/2015-09-Visual-Information/

This loss is not strictly required for classification, and actually may be suboptimal:
- [Disadvantages of using a regression loss function in multi-class classification - Cross Validated](
https://stats.stackexchange.com/questions/568238)

However, this loss is still useful for e.g. generative models:
- https://openai.com/blog/generative-models/#moregeneralformulation

This loss can be interpreted in many different ways:
- https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence#Interpretations

See also:
- [Cross entropy](https://en.wikipedia.org/wiki/Cross_entropy)

See also:
- [machine learning - Why do cost functions use the square error? - DSSE](
https://datascience.stackexchange.com/questions/10188/why-do-cost-functions-use-the-square-error)
- [machine learning - Neural networks: which cost function to use? - DSSE](
https://datascience.stackexchange.com/questions/9850/neural-networks-which-cost-function-to-use)
- [machine learning - Cross-entropy loss explanation - DSSE](
https://datascience.stackexchange.com/questions/20296/cross-entropy-loss-explanation)
- [machine learning - The cross-entropy error function in neural networks - DSSE](
https://datascience.stackexchange.com/questions/9302/the-cross-entropy-error-function-in-neural-networks)

See also:
- [intuition - What is perplexity? - Cross Validated](
https://stats.stackexchange.com/questions/10302/what-is-perplexity)
- [Perplexity - Wikipedia](https://en.wikipedia.org/wiki/Perplexity)

# TODO-unsup: Do you prefer unsupervised to supervised learning?

## Estimate value

You're already quite familiar with the latter, at least relatively speaking. Seek novelty.

You drive improvements to signs based on what you discover in unsupervised learning. Why wouldn't
you expect a deep learning model to do the same? If you can detect patterns, you can assume some
kind of structure. If you can assume some kind of structure, you can make a net that is much more
efficient than a completely general learner (or reuse a net you have based on the same common
mathematical structure). In fact, you often see solutions that fit the tools you already know. That
is, you prefer to use dicts and map a lot when you code only because you know them. Similarly,
people have filter bubbles and try to come up with economic solutions that fit the simple models
they already know (e.g. laissez-faire is always better).

It's like detecting patterns is the first step in the scientific process; it's how you establish
i.e. come up with educated guesses or working hypotheses.

You're not the only one thinking like this. The large transformer models are being pretrained on
unsupervised data before supervised learning. These models scale with more data:
- https://ai.stackexchange.com/questions/22581

In general, you have a lot more unsupervised training data. It's much cheaper to manage, understand,
etc. You don't have to rely on another team to get you what you need.

Hinton is deeply suspicious of supervised learning for a reason. See the end of this article for a
brief summary of his preference for unsupervised learning:
- https://venturebeat.com/2020/12/16/at-neurips-2020-researchers-proposed-faster-more-efficient-alternatives-to-backpropagation/

Is your role as a developer to do the pattern recognition for a network that can't yet do so for
itself? If you see an image, you know to model it with a convolutional network. In general, you make
the decision about how to model a system and make architectural choices based on the mental library
of model pieces you know may help build a useful mode for your new problem. Is your library
expanding?

Is unsupervised learning similar to Bayesian statistics? It seems like you can only argue against in
terms of efficiency:
- [When (if ever) is a frequentist approach substantively better than a Bayesian? - Cross
  Validated](https://stats.stackexchange.com/questions/194035/when-if-ever-is-a-frequentist-approach-substantively-better-than-a-bayesian)

## TODO-dagl: Draw a DAG with clickable links

You've frustrated yourself badly several times (and wasted a lot of time) trying to draw a graph
with links in Inkscape. It's much easier to add a git graph in plain text and a list of links below;
see `add-attention-mechanism.md` for an example. You want links inline to avoid the split attention
effect. For your last frustration, see the graph in [](./add-attention-mechanism.md).

In theory, you could build a graph of all arxiv papers you've read or are interested in reading
rather than separate these. You could even add links to your [](./select-subplan.md) document if the
task is essentially only understanding an external resource. See [](./estimate-subplan-weight.md)
for a summary of all the areas you may use DAGs.

See [Graph · master · David VandeBunte / davidvandebunte.gitlab.io ·
GitLab](https://gitlab.com/davidvandebunte/davidvandebunte.gitlab.io/-/network/master) for GitLab's
fancy implementation.

Is the dagitty format the same as the dot format? They are quite similar, except perhaps in the
first keyword. See:
- http://dagitty.net/dags.html
- https://www.graphviz.org/doc/info/lang.html
- https://renenyffenegger.ch/notes/tools/Graphviz/examples/index

You can draw graphviz plots in Jupyter:
- https://h1ros.github.io/posts/introduction-to-graphviz-in-jupyter-notebook/
- https://graphviz.readthedocs.io/en/stable/manual.html#jupyter-notebooks
- https://graphviz.readthedocs.io/en/stable/examples.html
- https://graphviz.org/theory/

It'd be helpful to be able to change all your node shapes at once:
- https://www.graphviz.org/doc/info/shapes.html

Notice that even [Directed acyclic graph -
Wikipedia](https://en.wikipedia.org/wiki/Directed_acyclic_graph) starts with a graphviz graph. In
general, graphviz can solve the layout problem for you as well. You are always trying to adjust your
manual git graph layouts when `git` obviously normally handles this task itself. It would be helpful
to get into `graphviz` before getting too far into a review of graph theory and topology, as well.

In general, you'd prefer to use graphviz so that you can edit graphs in plain text rather than try
to tweak Inkscape drawings to get them how you want them, and so that you can changes graphs
programmatically.

Consider at least both of these options:
- https://github.com/xflr6/graphviz
- https://github.com/pygraphviz/pygraphviz

To add a clickable link:
- https://stackoverflow.com/a/29670382/622049

It can be quite simple if you have `dot` installed:
- https://stackoverflow.com/questions/18478559

You may also want to make matplotlib clickable:
- https://duckduckgo.com/?q=matplotlib+clickable&t=newext&atb=v310-1&ia=web

The downside of matlplotlib is that you're again going to be stuck figuring out the layout on your
own rather than being able to let the tool do it for you. You'll also miss graph theoretic topics.

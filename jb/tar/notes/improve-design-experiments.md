# Improve design experiments

# TODO-rib: When should you reduce inductive bias?

See:
- [Inductive bias](https://en.wikipedia.org/wiki/Inductive_bias)

# TODO-svd: How can SVD be used to reduce dimensionality?

See both TODO-dr and TODO-snsa. High quality resource:
- [dimensionality reduction - Relationship between SVD and PCA. How to use SVD to perform PCA? - CV](
https://stats.stackexchange.com/questions/134282/relationship-between-svd-and-pca-how-to-use-svd-to-perform-pca)
- [Singular value decomposition - Wikipedia](
https://en.wikipedia.org/wiki/Singular_value_decomposition)

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
at once.

Similarly, to "load" code into your head by reading it is actually to decompress it into natural
language (increasing dimensionality). You often think of compressing code into natural language,
because documentation is often shorter than the code. The reason this isn't "compression" is that
documentation is also much less complete (detailed) than code. Documentation attends to less, but
can be more detailed because of that. Watch out for code that throws away details, however, in the
sense of throwing away long variable names in exchange for single letter names (or even more so,
when compiling to a binary). Ideally the documentation is in the code so nothing gets lost (avoid
lossy compression), or at the least you retain links to documentation (as e.g. .md files.

Is a picture worth a thousand words? It depends on the picture, and what kind of task you need to do
with it. Why aren't you asking about the resolution of the image?

See:
- [Dimensionality reduction](https://en.wikipedia.org/wiki/Dimensionality_reduction)

This is related to whether you should ever add a new variable to a model. Does the variable matter?
See also:
- [Latent variable](https://en.wikipedia.org/wiki/Latent_variable)
- [correlation - In supervised learning, why is it bad to have correlated features? - DSSE](
https://datascience.stackexchange.com/questions/24452/)
- [What is dimensionality reduction? Difference between feature selection and extraction? - DSSE](
https://datascience.stackexchange.com/questions/130/)
- [pca - Making sense of principal component analysis, eigenvectors & eigenvalues - Cross Validated](
https://stats.stackexchange.com/questions/2691/making-sense-of-principal-component-analysis-eigenvectors-eigenvalues)

Once you define this better, replace the link to Wikipedia with your own article in your public
notes (run a git grep to find the link you have now).

What if your input data had redundancies? The neural network can't tell you it is ignoring some of
your inputs. Should you always use PCA or an autoencoder to help remove the unnecessary information?
If it just learns to ignore the data in the first few layers it's not a big deal, though.
[1]: https://stats.stackexchange.com/questions/70899/what-correlation-makes-a-matrix-singular-and-what-are-implications-of-singularit
[2]: https://en.wikipedia.org/wiki/Dimensionality_reduction#Feature_selection

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

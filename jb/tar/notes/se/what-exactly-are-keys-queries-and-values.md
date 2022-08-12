# KQV attention

Supplementary material to the questions and answers in [What exactly are keys, queries, and values
in attention mechanisms? - CV](https://stats.stackexchange.com/questions/421935).

## Question

Why is this question important? Many versions of attention are used with older RNN-based models, and
it's not clear they are being used in practice any more. On the other hand, the KQV (or QKV) method
seems to still be used extensively. See [An Overview of Attention | Papers With Code](
https://paperswithcode.com/methods/category/attention-mechanisms).

The QKV attention mechanism is particularly interesting because it's used in Perceivers. That is,
QKV lets you easily connect two different modalities (i.e. text and image) because e.g. QK can both
be text and V can be an image (image search in web browsers). See point `5.` in [What's the
difference between Attention vs
Self-Attention?](https://datascience.stackexchange.com/a/66431/26431).

## Sam's answer

In [Sam's answer](https://stats.stackexchange.com/a/463320/189415) he mentions the SVD; it would
probably improve the answer to reference PCA rather than only the SVD. For more details see
[](./relationship-between-svd-and-pca.md). You can reinterpet point `2.` as a reference to [Feature
learning - PCA](https://en.wikipedia.org/wiki/Feature_learning#Principal_component_analysis) and
`3.` as a reference to [Dimensionality reduction - PCA](
https://en.wikipedia.org/wiki/Dimensionality_reduction#Principal_component_analysis_(PCA)). See the
comments following "Feature extraction and dimension reduction can be combined in one step" in
[Dimensionality reduction - Dimension reduction](
https://en.wikipedia.org/wiki/Dimensionality_reduction#Dimension_reduction) for other techniques for
doing both these steps at once.

To try to summarize, however, the author is saying the $K$ and $Q$ matrices in KQV attention both
represent the matrix of left-singular values $V$ in two separate SVDs.

Could the "I hope this help you" at the end be removed?

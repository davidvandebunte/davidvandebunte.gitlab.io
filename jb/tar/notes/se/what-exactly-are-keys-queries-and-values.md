---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# KQV attention

Supplementary material to the questions and answers in [What exactly are keys, queries, and values
in attention mechanisms? - CV](https://stats.stackexchange.com/questions/421935). Indirectly,
commentary on [Attention is All You Need (AIAYN)](https://arxiv.org/abs/1706.03762).

## Question

Why is this question important? Many versions of attention are used with older RNN-based models, and
it's not clear they are being used in practice any more. On the other hand, the KQV (or QKV) method
seems to still be used extensively. See [An Overview of Attention | Papers With Code](
https://paperswithcode.com/methods/category/attention-mechanisms). Besides being common, see
comments on the value of all attention mechanisms (not just KQV) in
[](../add-attention-mechanism.md).

The QKV attention mechanism is particularly interesting because it's used in Perceivers. That is,
QKV lets you easily connect two different modalities (i.e. text and image) because e.g. QK can both
be text and V can be an image (image search in web browsers).

## Library versions

```{code-cell}
%pip install numpy pandas
```

## Attention is All You Need (AIAYN)

[prla]: https://en.wikipedia.org/wiki/Projection_(linear_algebra)

It's strange that this paper uses the term "projection" for the parameter matrices $W_i^Q$, etc. The
term projection (see [Projection (linear algebra)][prla]) implies the operation is idempotent when
there's no constraint in the model to enforce this.


## Sam's answer

[sa]: https://stats.stackexchange.com/a/463320/189415
[lsi]: https://en.wikipedia.org/wiki/Latent_semantic_analysis#Derivation

The YouTube video [Sam's answer][sa] links to seems to have changed since the author added the
reference. It also leaves a lot to be desired, only covering the topic for a few minutes. If you
want to avoid the YouTube paywall (or advertisements) an arguably better resource to learn from is
the ["Derivation" section of Latent semantic analysis - Wikipedia][lsi]. Using the same data from
the image in Sam's answer but following the logic in the Wikipedia page on LSA:

```{code-cell}
import numpy as np
import pandas as pd

X = np.array([ \
   [1, 1, 1, 0, 0], \
   [3, 3, 3, 0, 0], \
   [4, 4, 4, 0, 0], \
   [5, 5, 5, 0, 0], \
   [0, 2, 0, 4, 4], \
   [0, 0, 0, 5, 5], \
   [0, 1, 0, 2, 2], \
])
pd.DataFrame(X,
    index=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7'],
    columns=["Star Wars", "The Matrix", "Iron man", "U got mail", "Titanic"])
```

```{code-cell}
from numpy import linalg as la

np.set_printoptions(precision=2, suppress=True, floatmode='maxprec_equal')

U, s, Vt = la.svd(X, full_matrices=False)
U, s, Vt
```

```{code-cell}
k = 2
U_k, s_k, Vt_k = U[:, :k], s[:k], Vt[:k, :]
V_k = Vt_k.T
U_k, s_k, V_k
```

```{code-cell}
P8 = np.array([5, 0, 0, 0, 0])
P9 = np.array([0, 4, 5, 0, 0])
cos_sim = P8.dot(P9) / (la.norm(P8) * la.norm(P9))
cos_sim
```

The variables `P8` and `P9` are equivalent to $\textbf{t}_i^T$ in the Wikipedia article; they are
the "queries" (Q) in the language of KQV and information retrieval. To project them into the
"semantic" or "concept" space we'll use a variation on this equation from the Wikipedia article:

$$
\begin{align}
\hat{\textbf{t}}_i & = \Sigma_k^{-1}  V_k^T \textbf{t}_i \\
\end{align}
$$

Taking the transpose:

$$
\begin{align}
(\hat{\textbf{t}}_i)^T & = (\Sigma_k^{-1}  V_k^T \textbf{t}_i)^T \\
\hat{\textbf{t}}_i^T & = \textbf{t}_i^T V_k \Sigma_k^{-1} \\
\end{align}
$$


Initially we'll drop the $\Sigma_k^{-1}$ term:

```{code-cell}
P8_hat = P8 @ V_k
P9_hat = P9 @ V_k
cos_sim = P8_hat.dot(P9_hat) / (la.norm(P8_hat) * la.norm(P9_hat))
P8_hat, P9_hat, cos_sim
```

Re-adding the $\Sigma_k^{-1}$ term:

```{code-cell}
P8_hat = P8 @ V_k @ np.diag(1 / s_k)
P9_hat = P9 @ V_k @ np.diag(1 / s_k)
P8_hat, P9_hat
```

Notice these 2 new $\textbf{t}_i^T$ are on the same scale as the original 7 $\textbf{t}_i^T$:

```{code-cell}
U_k
```

We also end up with (in general) a different cosine similarity measure:

```{code-cell}
cos_sim = P8_hat.dot(P9_hat) / (la.norm(P8_hat) * la.norm(P9_hat))
cos_sim
```

[wlm]: https://en.wikipedia.org/wiki/Linear_map

To try to summarize, the author is saying the $K$ and $Q$ matrices in KQV attention both represent
something like the $V_k$ matrix of left-singular values above, and where we also disregard the
\Sigma_k^{-1} term (scaled dot product attention has a scaling term that may perform a similar
function).

Said another way, in KQV attention we use a potentially different mapping $K$ and $Q$ to transform
([linear map][wlm]) vectors from their original basis to a "semantic" (or "contextualized") space
where we get reasonable values from a similarity measure. In latent semantic indexing (LSI) there is
only one weight matrix represented above as $V_k$ (not two). It transforms both the original (P1-P7)
and new (P8-P9) terms to the same "semantic" space already.

[pytl]: https://pytorch.org/docs/stable/generated/torch.nn.Linear.html

In KQV attention the loss function is also different; it's not as simple as the Frobenious norm
because a [torch.nn.Linear][pytl] layer (a linear layer in general) also learns a bias by default
and because the network's loss function is not always L2. To avoid confusion over whether a bias
term is implied, don't use the two words [Linear
function](https://en.wikipedia.org/wiki/Linear_function) together.

[Sam's answer][sa] mentions the SVD; it would probably improve the answer to reference PCA as well.
For more details see [](./relationship-between-svd-and-pca.md). You can reinterpet point `2.` as a
reference to [Feature learning -
PCA](https://en.wikipedia.org/wiki/Feature_learning#Principal_component_analysis) and `3.` as a
reference to [Dimensionality reduction - PCA](
https://en.wikipedia.org/wiki/Dimensionality_reduction#Principal_component_analysis_(PCA)). See the
comments following "Feature extraction and dimension reduction can be combined in one step" in
[Dimensionality reduction - Dimension reduction](
https://en.wikipedia.org/wiki/Dimensionality_reduction#Dimension_reduction) for other techniques for
doing both these steps at once.

## mon's answer

[mona]: https://stats.stackexchange.com/a/531971/189415
[pelt]: https://peltarion.com/blog/data-science/self-attention-video

See [mon's answer][mona] for a conversation more focused on the "meaning" of KQV attention rather
than the mechanics. The answer is relatively high-level, however, and doesn't even try to address
multi-head attention. It references [Self-attention: step-by-step video | Peltarion][pelt], which
provides a similar high-level discussion.

[al]: https://en.wikipedia.org/wiki/Anaphora_(linguistics)
[aia14]: https://arxiv.org/pdf/1706.03762.pdf#page=14

A single-head KQV attention can really only provide a guess at what other words are important to
include in a "contextualized" embedding of a more generic word. That is, it can really only pick out
one [Anaphora (linguistics)][al] to consider; see also an anaphora head in [AIAYN - Pg14][aia14].
Hence, mon's answer simply says K/Q is about finding the "most related" word.

The answer implies single-head attention is about where you *should* look for the most useful word.
That is, that attention provides a probabilistic estimate of "value" for understanding. Is this
where our eyes search (guess) in practice? Could we measure our saccades and compare them to the
results of an attention mechanism? Arguably a search engine provides the same single-head attention
scores (what you should pay attention to, what's "valuable" for understanding) based on training on
e.g. web links.

### Multi-headed attention

[wmh]: https://stackoverflow.com/a/66652733/622049

If you have more than one attention head, however, the different heads should be pulling different
features out of the sentence. See [What Does BERT Look At?](https://arxiv.org/abs/1906.04341). Like
the features provided by a CNN, only some of the heads provide features interpretable by a human
being (see [Why use multi-headed attention in Transformers?][wmh]).

[polys]: https://en.wikipedia.org/wiki/Polysemy
[homy]: https://en.wikipedia.org/wiki/Homonym

The Peltarion author refers to [Polysemy][polys], closely related to [Homonymy][homy]. You need to
be able to find anaphora with attention in order to distinguish between these kinds of words. If the
anaphora you need aren't part of your sentence, you're out of luck. You can see attention as
providing a "feature" on top of your word, to help contextualize it (add information) or
disambiguate it (change its default meaning).

## The Annotated Transformer

[atov]: http://nlp.seas.harvard.edu/2018/04/03/attention.html#applications-of-attention-in-our-model
[atnv]: http://nlp.seas.harvard.edu/annotated-transformer/

See [The Annotated Transformer (old version)][atov] and [The Annotated Transformer (new
version)][atnv] for a helpful multi-modal summary of the Transformer's paper. The text in the newer
version is too large, but can be zoomed. It also annoyingly doesn't automatically fill anywhere near
the width of a standard computer monitor; someone should republish it to automatically resize to the
full width of the screen. A drawing of some of the classes:

![x](../annotated-transformer-classes.svg)

[nbkq]: https://stats.stackexchange.com/questions/515477/when-calculating-self-attention-for-transformer-ml-architectures-why-do-we-need#comment982038_515552

As mentioned in a comment on [this SE question][nbkq], the implementation of `MultiHeadedAttention`
is not easy to follow. Quoting the code:

```python
class MultiHeadedAttention(nn.Module):
    def __init__(self, h, d_model, dropout=0.1):
        "Take in model size and number of heads."
        super(MultiHeadedAttention, self).__init__()
        assert d_model % h == 0
        # We assume d_v always equals d_k
        self.d_k = d_model // h
        self.h = h
        self.linears = clones(nn.Linear(d_model, d_model), 4)
        self.attn = None
        self.dropout = nn.Dropout(p=dropout)

    def forward(self, query, key, value, mask=None):
        "Implements Figure 2"
        if mask is not None:
            # Same mask applied to all h heads.
            mask = mask.unsqueeze(1)
        nbatches = query.size(0)

        # 1) Do all the linear projections in batch from d_model => h x d_k
        query, key, value = [
            lin(x).view(nbatches, -1, self.h, self.d_k).transpose(1, 2)
            for lin, x in zip(self.linears, (query, key, value))
        ]

        # 2) Apply attention on all the projected vectors in batch.
        x, self.attn = attention(
            query, key, value, mask=mask, dropout=self.dropout
        )

        # 3) "Concat" using a view and apply a final linear.
        x = (
            x.transpose(1, 2)
            .contiguous()
            .view(nbatches, -1, self.h * self.d_k)
        )
        del query
        del key
        del value
        return self.linears[-1](x)
```

[nne]: https://pytorch.org/docs/stable/generated/torch.nn.Embedding.html

We expect to see e.g. $W^Q_i \in \mathbb{R}^{d_{model} \times d_k}$ but instead see four square
weight matrices instantiated at once with `clones`. Why are these square rather than rectangular?
We'll focus on the first three which are associated with KQV; the fourth is not the issue here.

Read through `EncoderDecoder`, `EncoderLayer`, `Embeddings`, and [`nn.Embedding`][nne] to confirm
the `query`, `key`, `value` arguments to the `forward` method are all equal for self-attention and
of shape $N_{batch} \times n_{words} \times d_{model}$. The second dimension $n_{words}$ is the
maximum number of words (embedded words) per sentence we are processing.

[nnl]: https://pytorch.org/docs/stable/generated/torch.nn.Linear.html

Look only at the line `lin(x).view(nbatches, -1, self.h, self.d_k).transpose(1, 2)`. Considering
only dimensions, the [`nn.Linear`][nnl] operation produces a tensor of the same shape as its
argument (given above) because the weight matrices are square. We then reshape the result to
$N_{batch} \times h \times n_{words} \times d_k$ (after the transpose) which works because
$d_{model} = d_k h$ where `h` is the number of attention heads.

[bmm]: https://en.wikipedia.org/wiki/Block_matrix#Block_matrix_multiplication

How is this reshaping justified? What's happening here is probably best understood as [Block matrix
multiplication][bmm]. The code makes it look like we're working with square matrices, but
conceptually they're matrices of shape $d_k h \times d_{model}$ (note $d_v = d_k$). Let's imagine
the operation is $Y = X A^T$ where an embedded word $x$ is on every row of $X$ (along the last
dimension, the column direction). If A is $m \times n$ the input dimension is $n$ and the output
dimension is $m$; notice you specify these in the opposite order (the first argument is $n$) to
[`nn.Linear`][nnl].

Clearly the first row of $Y$ is influenced by all weights but only the first example $x$, and the
first column of $Y$ is influenced by all examples but only the first column of $A^T$. Extend this to
a "block" to say the first $d_k$ columns of $Y$ are influenced by all examples but only the first
$d_k$ columns of $A^T$. Conceptually then we can see $W^Q_i \in \mathbb{R}^{d_{model} \times d_k}$
fitting in these rows of $A$. Notice we can add offsets `b` that still only influence one head
rather than across heads.

[rcmo]: https://en.wikipedia.org/wiki/Row-_and_column-major_order

If we want to reinterpret these columns of $Y$ as a matrix then we need to acknowledge that the
$d_k$ dimension is contiguous; see [Row- and column-major order][rcmo]. Because PyTorch is row-major
order the `self.d_k` argument is the last to `view`.

[pytl]: https://pytorch-lightning.readthedocs.io/en/stable/notebooks/course_UvA-DL/05-transformers-and-MH-attention.html
[pymh]: https://github.com/pytorch/pytorch/blob/d589aa531ffc3cb657f9f76d38abf034df474c57/torch/nn/modules/activation.py#L886

Other implementations make all this clearer by using `d_model`, `n_head`, and `d_k`; see
[attention-is-all-you-need-pytorch/SubLayers.py](https://github.com/jadore801120/attention-is-all-you-need-pytorch/blob/fec78a687210851f055f792d45300d27cc60ae41/transformer/SubLayers.py#L9).
See also `MultiheadAttention` in [Tutorial 5: Transformers and Multi-Head Attention — PyTorch
Lightning][pytl] and [pytorch/activation.py · pytorch/pytorch][pymh].

[tmm]: https://pytorch.org/docs/stable/generated/torch.matmul.html

If you want more context note the first three arguments to the `attention` implementation are then
four-dimensional. This logic is doing batching at two levels, one the normal mini-batch and one
across all heads. See the "batched" examples in [torch.matmul][tmm]:

```python
def attention(query, key, value, mask=None, dropout=None):
    "Compute 'Scaled Dot Product Attention'"
    d_k = query.size(-1)
    scores = torch.matmul(query, key.transpose(-2, -1)) / math.sqrt(d_k)
    if mask is not None:
        scores = scores.masked_fill(mask == 0, -1e9)
    p_attn = scores.softmax(dim=-1)
    if dropout is not None:
        p_attn = dropout(p_attn)
    return torch.matmul(p_attn, value), p_attn
```

% TODO: It'd be nice to republish full width but you only have one GPU (they use eight) so your
% results are especially poor. Images also aren't centered unless you use jb.

## Other annotations

The other answers on this SE question weren't particularly helpful to me (2022-08). See
[](./about.md) if you want me to review your question if you've significantly changed it.

See [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) and
[Visualizing A Neural Machine Translation Model (Mechanics of Seq2seq Models With Attention)](
https://jalammar.github.io/visualizing-neural-machine-translation-mechanics-of-seq2seq-models-with-attention/)
for parts of the model translated to visualizations.

The tutorials [Language Modeling with nn.Transformer and TorchText](
https://pytorch.org/tutorials/beginner/transformer_tutorial.html) and [Language Translation with
nn.Transformer and torchtext](https://pytorch.org/tutorials/beginner/translation_transformer.html)
are more focused on the details of implementing a Transformer model than how or why it works; for
example they don't describe "attention" in detail and only mention [MultiheadAttention - PyTorch](
https://pytorch.org/docs/stable/generated/torch.nn.MultiheadAttention.html) rather than use it in
the code (much less look at its internals).

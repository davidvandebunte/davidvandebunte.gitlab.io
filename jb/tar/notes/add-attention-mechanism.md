# Add attention mechanism

## Estimate value

Should you add an "attention" mechanism to your model? For one argument, see the "Why
Self-Attention" section of "Attention is All You Need" ([1706.03762.pdf - Why
Self-Attention](https://arxiv.org/pdf/1706.03762.pdf#section.4)).

The authors include three "desiderata" behind self-attention. They wanted a model that was cheaper
("total computational complexity per layer"), which they argue they got in Table 1 and Table 2 (via
FLOPs). They wanted a model that was highly parallelizable ("amount of computation that can be
parallelized"), which they argue they got in Table 1. And finally, they wanted to minimize the path
length between long-range dependencies which they argue for in Table 1.

The first goal is about reducing costs, the second is about both scale and fast feedback, and the
third is about model performance. They obviously argue they hit the third goal in their SOTA
results.

Many people bash on transformers because they are expensive, but if you're only thinking about
attention mechanisms then it will only be expensive if you take advantage of their scalability. If
you don't, they are by design meant to be cheaper (goal #1). The Transformer model itself (because
it has both encoders and decoders) has scalability issues, however. See [Transformer (machine
learning model) - Alternative](
https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)#Alternatives).

The original authors were probably smart enough to keep it to three points because they know most ML
practioners have a short [Attention span](https://en.wikipedia.org/wiki/Attention_span), but I'll
add a fourth goal for self-attention: Generalizability.

### Generalizability

The attention mechanism is useful across both NLP and CV (like e.g. residual connections). They only
touched on this in [1706.03762.pdf - Conclusion](https://arxiv.org/pdf/1706.03762.pdf#section.7),
but attention has found success in many CV problems. See also:
- "General-Purpose Computation" under [On the Opportunities and Risks of Foundation Models -
 2108.07258.pdf - Section 4.1](https://arxiv.org/pdf/2108.07258.pdf#subsection.4.1)
- [Are Convolutional Neural Networks or Transformers more like human vision? - 2105.07197.pdf](
https://arxiv.org/pdf/2105.07197.pdf)
- [2206.03452v1.pdf - Can CNNs Be More Robust Than Transformers?](https://arxiv.org/pdf/2206.03452v1.pdf)
- [Vision transformer - Wikipedia](https://en.wikipedia.org/wiki/Vision_transformer)

#### Attention vs. Self-Attention

[dasa]: https://datascience.stackexchange.com/a/66431/26431

See `5.` in [What's the difference between Attention vs Self-Attention?][dasa]. The generalizability
of attention mechanisms means that attention (in contrast to self-attention) can be used to combine
modalities. See further comments about this application to Perceiver models in
[](./se/what-exactly-are-keys-queries-and-values.md).

## Test

[wat]: https://en.wikipedia.org/wiki/Attention
[aml]: https://en.wikipedia.org/wiki/Attention_(machine_learning)
[lilaa]: https://lilianweng.github.io/posts/2018-06-24-attention/

The term "attention" is used in this article following the definition in [Attention (machine
learning) - Wikipedia][aml]. Does [Attention (machine learning)][aml] compress everything the word
[Attention][wat] means to humans? Not even close. The self-attention mechanism can at best be
described as a tool to help a model decide what to weigh highly (pay "attention" to), given what it
is currently processing. For another simple definition, see the start of [Attention? Attention! |
Lil'Log][lilaa]. ML practitioners are loving the phrase "attend to" though.

We may need to start inventing new words. In my opinion there is already little to no distinction
between the words "attention" and "focus" except perhaps that the former is often treated as a
resource; see [etymology - Attention, focus, and respect as distributable
resources](https://english.stackexchange.com/questions/13899/) and [Attention economy](
https://en.wikipedia.org/wiki/Attention_economy). See also [Focus (linguistics)](
https://en.wikipedia.org/wiki/Focus_(linguistics)), which has some clear parallels to [Attention
(machine learning)][aml]. The term [Hyperfocus](https://en.wikipedia.org/wiki/Hyperfocus) is defined
in terms of attention. The word concentrate is even less independent of the word focus than
attention. In [concentrate - Wiktionary](https://en.wiktionary.org/wiki/concentrate), the verb is
defined in terms of [focus - Wiktionary](https://en.wiktionary.org/wiki/focus) (and vice-versa).

The following graph shows the development history of variants of attention mechanisms, linking
papers that reference each other and removing transitive dependencies. Dates match the original
publication to Arxiv, not the original publication. The list is roughly based on:
- [A Family of Attention Mechanisms](
https://lilianweng.github.io/posts/2018-06-24-attention/#a-family-of-attention-mechanisms)
- [Attention (machine learning) - Variants](
https://en.wikipedia.org/wiki/Attention_(machine_learning)#Variants).

```
*-. Attention Is All You Need: Vaswani, Gomez: 2017-06
|\ \
* | | Long Short-Term Memory-Networks for Machine Reading: Cheng: 2016-01
| * | Show, Attend and Tell: Neural Image Caption Generation with Visual Attention: Xu: 2015-02
|/  |
|   * Effective Approaches to Attention-based Neural Machine Translation: Luong, Manning: 2015-08
|  /
* / Neural Machine Translation by Jointly Learning to Align and Translate: Bahdanau, Bengio: 2014-09
|/
* Sequence to Sequence Learning with Neural Networks: Sutskever: 2014-09
* Learning Phrase Representations using RNN Encoder–Decoder for ...: Cho, Bahdanau, Bengio: 2014-06
```

Links to the abstract of every paper in Arxiv (in the same order) to make it easy to get the latest
(e.g. v7 for some papers) version even if the author adds an update:
- [Attention Is All You Need](https://arxiv.org/abs/1706.03762)
- [Long Short-Term Memory-Networks for Machine Reading](https://arxiv.org/abs/1601.06733)
- [Show, Attend and Tell: Neural Image Caption Generation with Visual ...](https://arxiv.org/abs/1502.03044)
- [Effective Approaches to Attention-based Neural Machine Translation](https://arxiv.org/abs/1508.04025)
- [Neural Machine Translation by Jointly Learning to Align and Translate](https://arxiv.org/abs/1409.0473)
- [Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215)
- [Learning Phrase Representations using RNN Encoder–Decoder for ...](https://arxiv.org/abs/1406.1078)

[cpa]: https://www.connectedpapers.com/about
[cusg]: https://www.connectedpapers.com/main/fa72afa9b2cbc8f0d7b05d52548906610ffbb9c5+204e3073870fae3d05bcbc2f6a8e263d9b72e776+cea967b59209c6be22829699f05b8b1ac4dc092d/Connected-Papers-|-Find-and-explore-academic-papers/graph

See Connected Papers for a denser graph, though CP is not a citation graph (see [Connected Papers |
About][cpa]). See [this link][cusg] for a custom graph with three of these papers as origins.

## Estimated cost

See [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) and
[Visualizing A Neural Machine Translation Model (Mechanics of Seq2seq Models With Attention)](
https://jalammar.github.io/visualizing-neural-machine-translation-mechanics-of-seq2seq-models-with-attention/)
for helpful visualizations.

See [The Annotated Transformer (old version)](
http://nlp.seas.harvard.edu/2018/04/03/attention.html#applications-of-attention-in-our-model) and
[The Annotated Transformer (new version)](
http://nlp.seas.harvard.edu/annotated-transformer/#background) for a helpful multi-modal
summary of the Transformer's paper. The text in the newer version is too large, but can be zoomed.
The tutorials [Language Modeling with nn.Transformer and TorchText](
https://pytorch.org/tutorials/beginner/transformer_tutorial.html) and [Language Translation with
nn.Transformer and torchtext](https://pytorch.org/tutorials/beginner/translation_transformer.html)
are more focused on the details of implementing a Transformer model than how or why it works; for
example they don't describe "attention" in detail and only mention [MultiheadAttention - PyTorch](
https://pytorch.org/docs/stable/generated/torch.nn.MultiheadAttention.html) rather than use it in
the code (much less look at its internals).

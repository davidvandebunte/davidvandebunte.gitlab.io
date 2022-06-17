# Add attention mechanism

## Estimate value

Should you add an "attention" mechanism to your model? If you're thinking of going "all out" on
attention mechanisms then a (roughly) equivalent question is: Should you prefer "Transformer"
models? See my answer in [What makes a transformer a transformer? - Artificial Intelligence Stack
Exchange](https://ai.stackexchange.com/a/35892/55112).

For an argument from the horse's mouth, see the "Why Self-Attention" ([1706.03762.pdf - Why
Self-Attention](https://arxiv.org/pdf/1706.03762.pdf#section.4)) section of the paper.

The authors summarized it well in their three "desiderata" (would the word "desirable" have been
just as good?) behind self-attention. They wanted a model that was cheaper ("total computational
complexity per layer"), which they argue they got in Table 1 and Table 2 (via FLOPs). They wanted a
model that was highly parallelizable ("amount of computation that can be parallelized"), which they
argue they got in Table 1. And finally, they wanted to minimize the path length between long-range
dependencies which they argue for in Table 1.

The first goal is about reducing costs, the second is about both scale and fast feedback, and the
third is about model performance. They obviously argue they hit the third goal in their SOTA
results.

Many people bash on transformers because they are expensive, but if you're only thinking about
attention mechanisms then it will only be expensive if you take advantage of their scalability. If
you don't, they are by design meant to be cheaper (goal #1). The Transformer model itself has a
scalability (because it has both encoders and decoders) has scalability issues, however. See
[Transformer (machine learning model) - Alternative](
https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)#Alternatives).

The original authors were probably smart enough to keep it to three points because they know most ML
practioners have a short [Attention span](https://en.wikipedia.org/wiki/Attention_span), but I'll
add some other goals behind adopting an attention mechanism.

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

## Estimated cost

[aml]: https://en.wikipedia.org/wiki/Attention_(machine_learning)

Does [Attention (machine learning)][aml] compress everything the word
[Attention](https://en.wikipedia.org/wiki/Attention) means to humans? Not yet; much of it remains in
the modality of natural language rather than code. ML practioners are using "attend to" more often
though, which they probably got from reading psychologist's theories on attention.

Still, it appears we are reaching the end of natural language theories in some ways and need to
start inventing new words. In my opinion there is already little to no distinction between the words
"attention" and "focus" except perhaps that the former is often treated as a resource; see
[etymology - Attention, focus, and respect as distributable resources - English Language & Usage
SE](https://english.stackexchange.com/questions/13899/) and [Attention economy](
https://en.wikipedia.org/wiki/Attention_economy). See also [Focus (linguistics)](
https://en.wikipedia.org/wiki/Focus_(linguistics)), which has some clear parallels to [Attention
(machine learning)][aml]. The term [Hyperfocus](https://en.wikipedia.org/wiki/Hyperfocus) is defined
in terms of attention.

The word concentrate is even less independent of the word focus than attention. In [concentrate -
Wiktionary](https://en.wiktionary.org/wiki/concentrate), the verb is defined in terms of [focus -
Wiktionary](https://en.wiktionary.org/wiki/focus) (and vice-versa).

See also [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) and
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
example they don't describe "attention" in detail and only mention [MultiheadAttention — PyTorch](
https://pytorch.org/docs/stable/generated/torch.nn.MultiheadAttention.html) rather than use it in
the code (much less look at its internals).

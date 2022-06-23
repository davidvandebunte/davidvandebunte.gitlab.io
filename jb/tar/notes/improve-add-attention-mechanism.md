# Improve add attention mechanism

# TODO-sw: How is attention a form of soft weights?

See:
- [Attention (machine learning)](https://en.wikipedia.org/wiki/Attention_(machine_learning))
- [Attention? Attention! | Lil'Log](https://lilianweng.github.io/posts/2018-06-24-attention/)
- [Different types of Attention in Neural Networks - gotensor](
https://gotensor.com/2019/07/06/different-types-of-attention-in-neural-networks/)
- [what's the difference between "self-attention mechanism" and "full-connection" layer?](
https://stackoverflow.com/questions/64218678/)

> Its flexibility comes from its role as "soft weights" that can change during runtime, in contrast
> to standard weights that must remain fixed at runtime.

In terms of QKV attention, the "soft weights" are what are sometimes called the attention weights.
These are formed by using the WQ and WK matrices (from training) to build Q and K matrices from X,
which are multiplied (Q by the transpose of K) to produce the attention weights. They're called
"weights" only because you get a matrix here, and a matrix is what you'd typically need for a FC
layer (ignoring the b offsets).

Said another way, the "Inquiry system" described in this answer is a function that takes a function
(the trained WK and WQ matrices):
- https://stats.stackexchange.com/a/531971/189415

# TODO-snsa: What is the difference between self-attention and attention?

Reference 21 from AIAYN:
- https://www.semanticscholar.org/reader/204a4a70428f3938d2c538a4d74c7ae0416306d8
- https://arxiv.org/pdf/1703.03130v1.pdf

Otherwise:
- [What's the difference between Attention vs Self-Attention? - DSSE](
https://datascience.stackexchange.com/questions/49468/)

# TODO-kqv: What exactly are keys, queries, and values in attention mechanisms?

## Estimate cost

Does a search engine conceptually provide attention scores (what you should pay attention to) based
on e.g. links and other factors? You do the same thing, collecting links to decide how to apply your
attention (which you usually think of as "time").

Do they learn to project vectors the same subspace? If they're projecting to the same subspace, from
the same original space (of X) why can't they be the same matrix? If you're doing language
translation they couldn't be the same, but it seems like some of these applications are mapping
English to English. Is it to different types of English words? Search for "pronoun" in Sam's answer;
if Hans is the query then "he" would be the most-similar key? The word "he" (an X) would be
translated to a q through the Q matrix that would be much more similar to the key "Hans" translated
to a k through the K matrix than the word "Mary" translated to a k through the K matrix. The v
associated with "Hans" would thus get multiplied by a softmax number near one; and it would contain
information specific to the name "Hans" such as that it's a Germanic name.

This seems to be an open question that might help you answer the preceding question:
- https://stats.stackexchange.com/questions/515477/when-calculating-self-attention-for-transformer-ml-architectures-why-do-we-need#comment982038_515552

How do attention mechanisms avoid putting all the focus on the same word? It's likely you don't
understand this because you don't understand why Q and K need to create different spaces:
- https://stats.stackexchange.com/questions/421935/what-exactly-are-keys-queries-and-values-in-attention-mechanisms#comment1040928_531971

Is single-head attention about where you *should* look for the most useful word? That is, a
probabilistic estimate of value? Is this where our eyes search (guess) in practice? It seems like we
could measure these saccades and compare them to the results of the model. It's really hard to keep
track of your own saccades. This answer seems to be about single-head attention:
- https://stats.stackexchange.com/a/531971/189415

It looks like there isn't a reason that Q and V can't interact as well:
- https://arxiv.org/pdf/2010.03766.pdf

Can you see the K in a QKV attention as a mapping from keys to the value associated with them (see
comments on recommendation systems in dontloo's answer? Similar to an "Estimate value" function.
When you're working back from effects to causes, then, you may conceptually put some weight on every
different theory or approach (if you're also considering costs) for solving the problem. Based on
the weights you apply to every theory, you pick one to start with (the highest weight). You have all
kinds of strategies for coming up with task weights. This doesn't quite fit because you're doing a
weighted average of values though; they don't stay discrete.

Can you see this as building a dictionary during training, that you use during inference? It's not
quite that simple, though, because you're returning weighted results from your dictionary. I'm not
sure what you would call a dictionary like this.

# TODO-cnns: Will attention replace CNNs?

I'm not fully convinced that Attention will replace CNNs. A CNN with multiple output channels seems
quite similar to attention with multiple heads; the output vectors in both cases are essentially a
"feature" describing the receptive field (or word) under it. In the end, both do dot products.

Don't invest so much into convolution if it turns out it isn't necessary. It's ironic you're
using more "fully convolutional" networks right now. Crappy reference:
- https://towardsdatascience.com/transformers-in-computer-vision-farewell-convolutions-f083da6ef8ab

# TODO-tra: How should you control your attention?

What should your atomic action be when you're working on a computer? Typing? Closing a window? All
of these topics are about controlling your focus (where you mouse pointer or vim cursor is located).
Is this related to the attention in transformer models? I'd say all of this is related to attention,
in that sense that you are "focusing" your attention on a narrower set of inputs that you normally
would (see "Focused attention" in `!w Attention`). Or are you merely thinking about how to save time
on actions you do repeatedly when you dig into these topics?

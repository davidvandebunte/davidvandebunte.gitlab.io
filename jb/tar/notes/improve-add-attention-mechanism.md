# Improve add attention mechanism

# Other

You can see self-attention as a compression of a word in *context*. That is, to understand any
particular word in a sentence you need to potentially understand what it is referring to (if it's
e.g. an article, pronoun, adjective, verb), what it is referring to it (e.g. a noun). A word can
easily refer or be referred to by several words through e.g. conjunctions. Said another way, every
word has dependencies and dependents (references and referents) of potentially several kinds. You
also come to every word with your own background, and hopefully use it similarly to other people.
See also [Part of speech](https://en.wikipedia.org/wiki/Part_of_speech).

Other examples of modifiers in this answer:
- https://stackoverflow.com/a/66259806/622049

# Ask on SE: Attention is All You Need (AIAYN)

[prla]: https://en.wikipedia.org/wiki/Projection_(linear_algebra)

It's strange that this paper uses the term "projection" for the parameter matrices $W_i^Q$, etc. The
term projection (see [Projection (linear algebra)][prla]) implies the operation is idempotent when
there's no constraint in the model to enforce this.

# TODO-apr: Is single-headed attention like a priority list if sorted by probability?

Arguably the links we collect in our notes and TODO-x also help us decide how to apply our attention
(which we usually think of as "time"). You could see a prioritized list of tasks (your TODO list for
today) as the result of a query of importance across your whole life.

A search engine goes out and trains on web links to decide what's most important in a particular
area. However, it doesn't know what you're going to search (i.e. what you consider valuable). It
seems like the ultimate in exploratory research (deciding what's possible first); only you provide
the goal and much later. Still, I'm sure that search engine builders consider what queries they're
getting when deciding what to work on next.

Add to comments under sprint goal setting? You should put your "attention" on only one area when you
start a sprint. Does attention have to exist (this weighted prioritization) because of our limited
memory? We must process in serial, with only a little overlap across time, because we can only hold
so much context in memory at once.

Can you see the K in a QKV attention as a mapping from keys to the value associated with them (see
comments on recommendation systems in dontloo's answer? Similar to an "Estimate value" function.
When you're working back from effects to causes, then, you may conceptually put some weight on every
different theory or approach (if you're also considering costs) for solving the problem. Based on
the weights you apply to every theory, you pick one to start with (the highest weight). You have all
kinds of strategies for coming up with task weights. This doesn't quite fit because you're doing a
weighted average of values though; they don't stay discrete. In this case you split your time
fractionally based on the "probabilities" rather than coming up with a mix. You also expand certain
tasks to get yourself into focus on them, dropping small fractions. Your Q and K can be the same.

As humans we have mental functions to accomplish certain tasks but use pattern matching (see
[](./estimate-subplan-weight.md) to decide which mental functions apply in a certain situation. Can
you see the dot product as performing pattern matching? That is, it decides whether this particular
linear map V should apply at all. This allows for V to be more than a linear map, you could put any
net in there. If attention weights are near zero, could you skip the matrix multiply?

A word that isn't a pronoun will probably get the default treatment of attention weights on the same
word and simply forwarding the information to the next layer.

# TODO-kqvd: Is KQV attention the same as dictionary learning?

Can you see this as building a dictionary during training, that you use during inference? It's not
quite that simple, though, because you're returning weighted results from your dictionary. I'm not
sure what you would call a dictionary like this. See several conversations about dictionary learning
in [Feature learning](https://en.wikipedia.org/wiki/Feature_learning).

# TODO-cnns: Will attention replace CNNs?

The answer is almost surely no, because a specialized model is always best for some applications.
Will attention mechanisms take a lot of the "market" though?

A CNN with multiple output channels seems quite similar to attention with multiple heads; the output
vectors in both cases are essentially a "feature" describing the receptive field (or word) under it.
What is the mathematical difference? See also:
- https://stackoverflow.com/a/66652733/622049

Don't invest so much into convolution if it turns out it isn't necessary. It's ironic you're
using more "fully convolutional" networks right now. Crappy reference:
- https://towardsdatascience.com/transformers-in-computer-vision-farewell-convolutions-f083da6ef8ab

It may be a matter of inductive bias. See:
- https://iclr.cc/virtual_2020/poster_HJlnC1rKPB.html
- https://arxiv.org/pdf/1911.03584.pdf
- https://en.wikipedia.org/wiki/No_free_lunch_in_search_and_optimization

If that is the case, you may want to prefer attention as a starting point on any model because
(although more computationally expensive) it will be more likely to perform better (with fewer
assumptions). For example, you should more easily be able to make connections within images. Until
you understand the inductive biases that CNNs are adding, you shouldn't be taking them on in a
model. Get it to work first, optimize later.

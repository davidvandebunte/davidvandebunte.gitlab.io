# Improve add attention mechanism

# TODO-kqs: Do the K and Q matrices learn to project to the same space?

If they're projecting to the same space, from the same original space (of X) why can't they be the
same matrix? If you're doing language translation they couldn't be the same, but it seems like some
of these applications are mapping English to English. Is it to different types of English words?
Search for "pronoun" in Sam's answer; if Hans (proper noun) is the query then "he" (pronoun) would
be the most-similar key? The word "he" (an X) would be translated to a q through the Q matrix that
would be much more similar to the key "Hans" translated to a k through the K matrix than the word
"Mary" translated to a k through the K matrix. The v associated with "Hans" would thus get
multiplied by a softmax number near one; and it would contain information specific to the name
"Hans" such as that it's a Germanic name.

Said another way, in self-attention you want the proper noun for the pronoun you are currently
trying to understand to be "included" to some extent in the value V for the word. Let's say the
pronoun-processing attention head needs to consider gender; this seems quite realistic given the
common pronouns "he" and "she" (ignoring "it"). Other heads (e.g. for articles) may not need to
transform the representation to include this information in the "semantic" space associated with the
head. For the pronoun head, however, it will will likely be helpful for both the WQ and WK matrices
to learn to transform the original word2vec representation to a representation that continues to
include gender.

This "semantic" space created by the pronoun attention head will take a pronoun in the K field and
lookup a proper noun in the Q field (not vice versa). It's hard to get too much further into the
details, except covering special cases. A word that isn't a pronoun will probably have even weights
across the board. Continuing on the theme of gender, though, the WK will need to learn to transform
pronouns to include gender, which may be different than the task of transforming proper nouns to
include gender, as the WQ matrix must learn to do.

The WQ and WK matrices need to work in a common representation ("semantic" space) or the similarity
measure won't work. They also need to work with different types of inputs, however, so they need to
be different. It's therefore helpful to have a training process for them to work out this common
representation. By applying these matrices to a specific sentence (at run-time), you get a specific
answer to which pronouns are most likely associated with which proper nouns, and you can use these
"soft" weights as a function to convert a list of values to a single weighted value.

In single-headed attention it may be that the lookup is of the "most important" word other than the
present word. This isn't as specific as pronoun but it should still be possible to learn to include
more than the current word; you would expect it to perform better so it should be learnable.

How do attention mechanisms avoid putting all the focus on the same word? It's likely you don't
understand this because you don't understand why Q and K need to create different spaces:
- https://stats.stackexchange.com/questions/421935/what-exactly-are-keys-queries-and-values-in-attention-mechanisms#comment1040928_531971

In terms of information retrieval, it's like you're returning a weighted combination of all
documents (quite strange). Why is the V matrix required at all? Perhaps in the pronoun attention
head you need to emphasize certain aspects of the word2vec representation that are more relevant to
pronouns. Or you need to change the value rather than simply add to it.

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
In the end, both do dot products. See also:
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

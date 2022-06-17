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
- [What exactly are keys, queries, and values in attention mechanisms?](
https://stats.stackexchange.com/questions/421935/)
- [time series - What are attention mechanisms exactly?](
https://stats.stackexchange.com/questions/344508/what-are-attention-mechanisms-exactly?rq=1)

You may not be able to solve this easily without reading through a code implementation of a
transformer model (like the "Annotated Transformer").

Do you care about versions of attention used with older RNN-based models? You may care about the QKV
value approach, but is it still being used? Or is it a historical tool? It looks like it's still
being used:
- [An Overview of Attention | Papers With Code](
https://paperswithcode.com/methods/category/attention-mechanisms)

You're also particularly interested in QKV attention because it's used in Perceivers. That is, QKV
lets you easily connect two different modalities because e.g. QK can both be text and V can be an
image (image search in web browsers). See point `5.` here:
- https://datascience.stackexchange.com/a/66431/26431

Does a search engine conceptually provide attention scores (what you should pay attention to) based
on e.g. links and other factors? You do the same thing, collecting links to decide how to apply your
attention (which you usually think of as "time").

See [What exactly are keys, queries, and values in attention mechanisms? -
CV](https://stats.stackexchange.com/questions/421935) for a valuable discussion.

How is this an SVD? See this answer for the mention:
- https://stats.stackexchange.com/a/463320/189415

Seeing the SVD as (where U and V are complex unitary matrices):

```
M = UΣV*
```

The author is saying that the Q and K matrices both represent the complex unitary matrix V from the
equation above. Do they learn to project vectors the same subspace? If they're projecting to the
same subspace, from the same original space (of X) why can't they be the same matrix? If you're
doing language translation they couldn't be the same, but it seems like some of these applications
are mapping English to English. Not quite the same:
- https://stats.stackexchange.com/questions/515477
- https://stats.stackexchange.com/questions/498955

Is a reference to SVD even necessary here? He cites representation learning in this point `2.` and
dimensionality reduction in `3.` and it seems like that would have been enough.

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

Can see the K in a QKV attention as a mapping from keys to the value associated with them (see
comments on recommendation systems in dontloo's answer? Similar to an "Estimate value" function.

# TODO-cnns: Will attention replace CNNs?

I'm not fully convinced that Attention will replace CNNs. A CNN with multiple output channels seems
quite similar to attention with multiple heads; the output vectors in both cases are essentially a
"feature" describing the receptive field (or word) under it. In the end, both do dot products.

Don't invest so much into convolution if it turns out it isn't necessary. It's ironic you're
using more "fully convolutional" networks right now. Crappy reference:
- https://towardsdatascience.com/transformers-in-computer-vision-farewell-convolutions-f083da6ef8ab

# TODO-tra: How should you control your attention?

Notes are tracking attention to some degree. When you're taking notes, you're keeping a train of
thought, with fewer minor explorations (try to spend a day without taking notes; your tabs expand
quickly).

What should your atomic action be when you're working on a computer? Typing? Closing a window? All
of these topics are about controlling your focus (where you mouse pointer or vim cursor is located).
Is this related to the attention in transformer models? I'd say all of this is related to attention,
in that sense that you are "focusing" your attention on a narrower set of in puts that you normally
would (see "Focused attention" in `!w Attention`).

To some extent you can see planning as narrowing your attention. That is, when you're planning at
the highest level your "attention" is on everything you could possibly be doing (which you maintain
as a list of questions). When you pick a specific question, you're narrowing your focus. To answer
that specific question, you should create a list of questions you are going through (dependencies it
has). You often end up with many (good) side effect questions when you're answering one question.
Once you answer your primary question (to whatever degree of accuracy you want to) then split out of
that new document all the side or closely related questions you had (organizing them as much as
possible). Zoom your attention back out, and pick from your new list of questions. At this point,
you can decide whether to go deeper into one of your side/alternative questions (stay on focus i.e.
narrow your focus), or go up a level to a different "topic" (alternating attention). If you commit
at the end of every day, you'll see all the notes you made during the day and be able to select from
them for the next day (what looks most promising). This cycle lets you both explore and exploit (on
and off) in a regular pattern. If you're going to widen your focus, you should serialize all your
notes. If you're going to narrow it, you should serialize most of your notes (all the side questions
you rejected). See also `stay-on-focus.md` for how you do this at one level.

You should be thinking about your "plan" on an hour-by-hour basis as well, even if you don't commit
it to version control. That is, you are almost always trying to answer some question on the way to
answering your main question (that is in version control). You can "add-wide-goal.md" by opening
more browser tabs (trying to understand e.g. more SE questions related to your main goal).

You should first close all your browser tabs, serializing what you want to keep (not all of it, for
the sake of speed) to your notes. Then you should close all your text editor tabs, moving content
between articles (essentially organize) so that you can create version control commits. *After*
that, start from the top of your git diff; commit the whole file if you can. If you moved content,
search for the word "diff" and find independent content first (which can take its own commit). You
don't have to do this clean up on a daily basis; you only do it "regularly" when you feel you need
to pick one priority.

Taking notes gets you *out* of focus on random articles and actually makes you reprioritize
(readjust your attention/focus). It's how you get yourself to think about priorities, more so that
e.g. taking a walk.

Are you "attending to" a child when you're working at home, by having a service that watches him?

Should you commit every two hours, if only to divide out what you can? Review everything else that
is not done, and make it a WIP commit. This is the equivalent to checking in for a daily stand-up,
even if you didn't finish the task you thought you would finish yesterday.

See `close-window.md` for another way you control your focus. To reduce the number of tabs you have
open in e.g. your browser, you could run `evaluate-pedagogical-tool.md` on them (e.g. close websites
that aren't open source).

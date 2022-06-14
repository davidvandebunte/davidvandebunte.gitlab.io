# Improve design experiments

# TODO-sw: How is attention a form of soft weights?

See:
- [Attention (machine learning)](https://en.wikipedia.org/wiki/Attention_(machine_learning))
- [Attention? Attention! | Lil'Log](https://lilianweng.github.io/posts/2018-06-24-attention/)
- [Different types of Attention in Neural Networks - gotensor](
https://gotensor.com/2019/07/06/different-types-of-attention-in-neural-networks/)

> Its flexibility comes from its role as "soft weights" that can change during runtime, in contrast
> to standard weights that must remain fixed at runtime.

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
value approach, but is it still being used? Or is it a historical tool? See:
- [An Overview of Attention | Papers With Code](
https://paperswithcode.com/methods/category/attention-mechanisms)

Does a search engine conceptually provide attention scores (what you should pay attention to) based
on e.g. links and other factors? You do the same thing, collecting links to decide how to apply your
attention (which you usually think of as "time").

# TODO-cnns: Will attention replace CNNs?

I'm not fully convinced that Attention will replace CNNs. A CNN with multiple output channels seems
quite similar to attention with multiple heads; the output vectors in both cases are essentially a
"feature" describing the receptive field (or word) under it. In the end, both do dot products.

Don't invest so much into convolution if it turns out it isn't necessary. It's ironic you're
using more "fully convolutional" networks right now. Crappy reference:
- https://towardsdatascience.com/transformers-in-computer-vision-farewell-convolutions-f083da6ef8ab

# TODO-rib: When should you reduce inductive bias?

See:
- [Inductive bias](https://en.wikipedia.org/wiki/Inductive_bias)

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
is not done, and make it a WIP commit.

See `close-window.md` for another way you control your focus. To reduce the number of tabs you have
open in e.g. your browser, you could run `evaluate-pedagogical-tool.md` on them (e.g. close websites
that aren't open source).

During the day, you should keep track of your attention with your *sxda* bookmark or in general with
history:
- https://stackexchange.com/users/309544/davidvandebunte?tab=activity
- [User contributions for Davidvandebunte - Wikipedia](
https://en.wikipedia.org/wiki/Special:Contributions/Davidvandebunte)

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

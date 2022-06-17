# Expand focus

## Estimate value

Generalizes many processes. To make your mind attend to more:
- External web resources, see [](./search-the-web.md).
- General world state, see [](./set-wide-goal.md).

You can expand your focus with the purpose of either decreasing costs or finding value. That is,
either considering how you can share code/weights/ideas between two tasks you must do, or mining for
value.

## Design test

In general, increase the number of weights being attended to. This may be natural language in your
notes, your open browser tabs, the weights in a net being trained, or the weights on the neurons in
your brain. Imagine you could see your own weights in your brain. What new set of mental weights are
you attending to with this new text editor or web browser tab?

In the context of the [Attention](https://en.wikipedia.org/wiki/Attention) article, expanding your
focus to a place of [Simultaneous](https://en.wikipedia.org/wiki/Attention#Simultaneous) attention.
You will typically be attending to more state through abstractions.

### Divided attention

Expanding your focus is not the same as "Alternating" or "Divided" attention in the model of
Sohlberg and Mateer. It's also not related to [Human multitasking](
https://en.wikipedia.org/wiki/Human_multitasking) or [Continuous partial attention](
https://en.wikipedia.org/wiki/Continuous_partial_attention). In general it's not about switching
tasks or controlling your attention, but merely about looking at the bigger picture.

### Find value

See [](./set-wide-goal.md).

### Decrease costs

To analogize to the work that nets do, you're temporarily switching to task A (a different
perspective) from task B in an effort to help you perform better on task B (in the long term). Of
course, you expect to see better performance on task A in the short term.

Transfer learning occurs when subnets are trained on two different tasks in series (e.g.
classification and object detection). When we do this kind of transfer learning we often throw away
our ability to do the original task (classification) but there's no reason that head needs to be
thrown away. What if we went back to training for classification a few more times, even if object
detection is our final goal? If the loss continues to go down, why not? We typically do not automate
transfer learning techniques, even if we used them to train a model that is used in e.g. production
(which is unfortunate).

In the language of focus, you can see this as going in and out of focus on different tasks. When the
net is attempting to perform classification, it is attending to both the weights that are solely for
classification and the shared weights used for both classification and detection. It could regularly
expand its focus to all tasks it can perform, however, and then narrow back into the detection task
(assuming it was last working on classification).

## Estimate cost

You should be able to provide some estimate of how hard a question is to answer before you expand
your focus. Is this a quick search or something that will take an hour?

Do a search for a word on your existing tab. It's likely what you see will be more appropriate than
a global web search.

For estimates of more than 5 minutes, you should write down (in your notes) your question before
opening a new tab to try to answer the question. This is good evidence that you know the exact
question you want, and that you're going to use good searching tools e.g. [](./search-the-web.md) to
answer the question (dependency). It also indicates that you've thought enough about the question to
believe that it is a strict dependency; you've read alternative explanations and they do not solve
the problem. There's always more than one way to solve a problem (understand).

For estimates of more than 5 minutes, you should also try to answer the question from your own notes
(like an open note test) before moving on, because you do have a preference for e.g. Bayesian to
Frequentist statistics. More importantly, you may be able to skip the step of web searching if you
already have already collected good pedagogical resources on a topic. You'll be able to learn much
faster from resources you've already evaluated for quality and skimmed.

For an estimate of more than 5 minutes, you'll also want the question written down in case you get
interrupted somehow.

In some sense this is a "little failure" because your own language was not enough (with the
resource) to solve the problem. When you run into a "little success" you naturally go through
closing tabs and windows that are no longer relevant. You should do the same for little failures;
serialize what you've learned so you can add a dependency (unfortunately expanding scope).

At the least, you know you've discovered a dependency if you can't answer a question without opening
another tab. There may be another way to solve the problem, but to understand the problem from the
particular perspective you are considering this concept is a dependency. You can add the dependency
to your future git graph, if it's worth it (you aren't finding an alternative solution after web
searching alongside notes for a few hours) then replan.

In order to avoid spilling notes (see [](./maintain-focus.md), you will need to narrow your focus to
some degree. See [](./narrow-focus.md)).

### Notes

Run `git grep` for all the key words in question, and use or delete your old thoughts. This is the
equivalent of querying your own notes.

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

Unorganized notes generally indicate you really want to focus on a topic, but believe there is value
in a thought you should save for later. You can add these (or any other thoughts) to the set of
notes you are attending to, without making them show up in `git` as uncommitted changes, by adding
them to a file in your text editor but not saving the file (e.g. `:w` in `vim`). Another option is
to open a "reminder tab" in your web browser and move it out of the way.

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

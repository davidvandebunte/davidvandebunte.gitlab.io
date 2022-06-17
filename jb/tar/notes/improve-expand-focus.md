# Improve expand focus

# TODO-ef: When do you expand your focus?

If networks can't evaluate themselves on their own predictive abilities after weight updates, it may
be hard to incentivize them to explore intelligently (or at least the same way we do).

A good heuristic is to use curiosity, as discussed, but also check whether you're continuing to
learn any kind of reusable abstraction/subnet (preferably a high-value one, but you only guessed
when searching in a particular direction). That is, add some kind of feedback from the training
process that switches the focus of training from one area to another.

Think of it as "automated transfer learning" when certain subnets are trained on two different tasks
in series (e.g. classification and object detection). When we do this kind of transfer learning we
throw away our ability to do the original task (classification) but there's no reason that head
needs to be throw away. What if we went back to training for classification a few more times, even
if object detection is our final goal? If the loss continues to go down, why not? Why do we
typically not automate transfer learning techniques if we used them to train a model last time? Why
do we not even automate stopping an experiment when the loss is no longer going down? Everyone seems
to want to inspect the decrease in loss themselves. See [Early Stopping — PyTorch Lightning 1.6.4
documentation](https://pytorch-lightning.readthedocs.io/en/stable/common/early_stopping.html) for a
related feature.

See [Transfer learning](https://en.wikipedia.org/wiki/Transfer_learning) for some references to
research in this direction, that is, that TL should be able to help RL.

I'd argue this is not simply a workaround for limited memory. We're actually feeding different kinds
of training examples through the net, trying to use transfer learning as a kind of regularization
technique.

Perhaps this is what happens between generations (throwing away heads). When one person dies we
can't take their brain's internal representations and distribute it to others; we probably would not
want to. Instead we transfer as much as we can from them through teaching, but new generations also
need to take only the most reusable and most important parts from the knowledge of previous
generations. For example, a younger person would be more likely (thinking long-term) to replace
frequentist with bayesian thinking. Hopefully they don't reinvent helpful math at the same time.

In the language of focus, you could see this as going in and out of focus on different tasks. When
the net is attempting to perform classification, it is attending to both the weights that are solely
for classification and the shared weights used for both classification and detection. It needs to
expand its focus once in a while to all tasks it can perform, however, and then narrow back into the
detection task (assuming it was working on classification).

Should the learning rate be analogous to how you come back to planning?
- [machine-learning-articles/getting-out-of-loss-plateaus-by-adjusting-learning-rates.md at main ·
  christianversloot/machine-learning-articles](https://github.com/christianversloot/machine-learning-articles/blob/main/getting-out-of-loss-plateaus-by-adjusting-learning-rates.md)

# Improve expand focus

# TODO-ef: Automate expanding focus in training

If networks can't evaluate themselves on their own predictive abilities after weight updates, it may
be hard to incentivize them to explore intelligently (or at least the same way we do).

A good heuristic is to use curiosity, as discussed, but also check whether you're continuing to
learn any kind of reusable abstraction/subnet (preferably a high-value one, but you only guessed
when searching in a particular direction). That is, add some kind of feedback from the training
process that switches the goal of training from one task to another. See related thoughts in
[](./expand-focus.md).

Why do we not even automate stopping an experiment when the loss is no longer going down? Everyone
seems to want to inspect the decrease in loss themselves. See [Early Stopping — PyTorch Lightning
1.6.4 documentation](https://pytorch-lightning.readthedocs.io/en/stable/common/early_stopping.html),
however.

See [Transfer learning](https://en.wikipedia.org/wiki/Transfer_learning) for some references to
research in this direction, that is, that TL should be able to help RL.

This is not simply a workaround for limited memory. We're actually feeding different kinds of
training examples through the net, trying to use transfer learning as a kind of regularization
technique.

Perhaps this is what happens between generations (throwing away heads). When one person dies we
can't take their brain's internal representations and distribute it to others; we probably would not
want to. Instead we transfer as much as we can from them through teaching, but new generations also
need to take only the most reusable and most important parts from the knowledge of previous
generations. For example, a younger person would be more likely (thinking long-term) to replace
frequentist with bayesian thinking. Hopefully they don't reinvent helpful math at the same time.

Should the learning rate be analogous to how you come back to planning?
- [machine-learning-articles/getting-out-of-loss-plateaus-by-adjusting-learning-rates.md at main ·
  christianversloot/machine-learning-articles](https://github.com/christianversloot/machine-learning-articles/blob/main/getting-out-of-loss-plateaus-by-adjusting-learning-rates.md)

Eventually add a `switch-focus.md` if there's a need to address multi-tasking, continuous partial
attention, etc? It may not be necessary, if you only expand your focus to the level of planning and
then dig back down. See [Attention span](https://en.wikipedia.org/wiki/Attention_span) however; do
children automatically try a variety of tasks in order to learn faster? When you're training a net
via transfer learning, should you rapidly switch between tasks to start, then decrease the switch
rate with time?

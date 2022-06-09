# Set deep goal

Part of [](./explore-domain.md). Why look farther into the future?

## Future costs affect today

Because there is more than one way to solve every problem, you can often find ways to solve two
problems with one tool (e.g. abstraction). By planning ahead, you can often skip intermediate
solutions and go straight to what looks like the final solution.

You may not want to design a perfect solution when a better one is coming. Another person on your
team or your company or the open source community may be designing a better solution. It's often
prudent to wait for others to automate and standardize rather than getting into complicated
businesses while they are still evolving.

### Examples

While it may have added value to write custom code to orchestrate production in 2010, most of your
code would likely have been eliminated with the advent of containers and Kubernetes.

To dig back into your dependency chain to the hardware could likely only have been done with AWS in
2015, but by 2020 other tools like Terraform and GKE were providing similar services and stabilizing
the cloud API. The [MinIO](https://en.wikipedia.org/wiki/MinIO) interface was only created after AWS
experimented with variations on the s3 API.

## Future needs affect today

Future features may change the design of the features you implement today. For example, you may
discover you don't need to do something if you do something else (that's useful in another context
as well) instead.

You don't want to maintain code you plan to remove. If you don't understand the value of features
and company direction, you aren't going to be able to make smart decisions about what code to invest
more time in. You want to invest more time in code that will be around for eight years than one
year.

Said another way, if you can predict what will be valuable (have value) in the future, you may be
able to consider it as part of today's plans. Stable values make planning easier because plans can
be reused, and you're less likely to make errors planning too far ahead.

You can look into your dependencies (who you buy from) in one direction, or into your dependents
(who buys from you). If you push into your dependencies, you'll be able to produce more efficiently
(lower costs). If you push into your dependents, you'll be able to achieve value more efficiently.

## Time to brainstorm

When you eventually actually do work, you will have had many chances to look at it and sleep on the
"how" of solving it if you've seen it in planning before. That is, sleeping on ideas (or having them
in the back of your mind as you work) can help you generate more plans that reach the same state,
perhaps more cheaply.

# Test

In the words of [Plan](https://en.wikipedia.org/wiki/Plan), extend the "time frame" of your plan.
That is, take the time to add `c` (and G2) on top of `b` in this graph:

```bash
* c: G2
* b: G1
* a
```

# Estimate cost

## Increased uncertainty

Should you consider some time past when you are surely gone and completely forgotten, or only to
your retirement? Should you consdier your impact on future humanity, indirectly through family,
coworkers, friends, etc? Year 2200? Or should you use some kind of future discounting? The farther
in the future you're looking, the more uncertain your estimates of the world will look are going to
be. If you have less value uncertainty, and less cost uncertainty, then you can look a little
farther into the future, but there's a lot of world state you don't control.

You really can't plan anything out to 2200 only because you don't know what will happen in the next
5 years with much certainty (war, hard AI, family, investments, etc.). I think looking forward 5
years is good enough for many problems, but with that attitude an undergraduate won't be getting
e.g. a PhD that takes 6 years.

Recurrent neural nets were the best way to solve NLP problems a few years ago, but now Transformers
are taking over. Frequentist statistics was the right way to describe uncertainty through the 60s
and 70s, but now Bayesian methods are taking over (this is "math" which you assume to be a stable
topic to learn about). The world is changing, and you need to regularly make a decision about when
to review the research (learn from others, plan big picture) and when to build on your own (in your
own notes/code). In terms of git history, when do you merge the changes of others?

You need to not only "merge" information from the outside world about costs (e.g. how to solve a
problem) but also about values. One purpose of Scrum is to make businesses more responsive to a
changing market.

How much uncertainty do you add looking farther into the future? It depends on the volatility of
both your market, and the volatility of your dependencies i.e. supply chain (costs). Either way,
it's not necessarily linear. For a generic suggestion (without considering your domain), see [Time
value of money](https://en.wikipedia.org/wiki/Time_value_of_money).

## Set goal

See [](./set-goal.md).

# Explore domain

Part of [](./estimate-subplan-weight.md).

![wa](https://upload.wikimedia.org/wikipedia/commons/4/4e/Georg_August_Wallin_%281811-1852%29%2C_Scandinavian_orientalist_and_explorer.jpg)

# Test

Add a set of goals/ideas to a "future" git graph.

In RL, authors often refer to this process as "action generation" (actions being analogous to
ideas), with the action generator often being the policy. See for example:
- [A Reinforcement Learning Technique with an Adaptive Action Generator for a Multi-robot System](
https://link.springer.com/chapter/10.1007/978-3-540-69134-1_25)
- [Reinforcement Learning Random Action Generator](
https://www.mathworks.com/matlabcentral/answers/593065-reinforcement-learning-random-action-generator)

We don't use the term [Exploration](https://en.wikipedia.org/wiki/Exploration) as Wikipedia does.
See also:
- [Explorer (disambiguation)](https://en.wikipedia.org/wiki/Explorer_(disambiguation))
- [Exploration problem](https://en.wikipedia.org/wiki/Exploration_problem)

# Estimate cost

## Pick a direction

Consider VNTE in widely different parts of the network to start, trying to avoid putting too much
time into variations on the same VNTE (see [](./set-wide-goal.md). Once you've identified the parts
of the network with high weight tasks, get into more focused planning work in that area of the
network (effectively prune actions to explore the rest of the network). At this point, think beyond
the "gold" you've already found with [](./set-deep-goal.md). Said another way, look for low hanging
fruit first but be suspicious of easy answers.

## Add targets and dependencies

### Internal

To "think" (assuming you can't read or write) would be to make a modification in your own BNN (i.e.
without going external, something you could do with your eyes closed). Many great ideas come to
people in their sleep. This action depends on nothing but your own mind (which includes an objective
function), and targets your own mind.

If you have a large body of personal notes, what ideas have you forgotten about in them? For the
advantages of exploring your own notes, see [](./organize-notes.md). This action depends on your
mind and notes, and targets your mind and notes.

In a net we literally use random number generation to create ideas; this step is assisted by the
loss function through the "educated guess" system of backpropagation. Other aspects of the guessing
system are the loss function, AdaGrad, etc. A human instead sets goals, also using their "loss
function" (system of values) as guidance (though they also may discover after more thought that a
goal has negative value). To "generate an idea" is the same as setting a goal; these are essentially
equivalent assuming that the idea adds value (or you believe without further thought that it does).

Said another way, the "whole world" to the training algorithm is all the weights in the model it is
training. Backpropagation considers the "whole world" to propose an update. Humans more often focus
on only part of the world at once, making an assumption that different parts of it can be worked on
independently.

### External

Consider the actual physical exploration of an area. This takes as input (depends on) the state of
the area, and your own mind, and targets an update to your mental map of the area. If you go to the
area with certain values in mind (e.g. to go higher) then as you explore the area you'll also be
targeting ideas (TODO-x). Exploring a mountain is different than the prairie; the domain matters.

Reviewing research (e.g. from OpenAI) is exploration. Browsing the internet (web searching) is
exploration. These actions depend on the current existence of websites (ignoring the potential for
future broken links, if you want to repeat the action) and targets updates to your own mind and
potentially your notes. You mind has pointers to articles it has read in the past, a kind of
dependency.

The huge advantage of reviewing external research is you don't have to reinvent the wheel. External
sources will advertise not only the value in e.g. a concept, but provide reasonable examples
(perhaps even pedagogical material) to go off of. The abstract in a paper usually includes the
equivalent of an "Estimate value" function, and the length of the paper (or the parts you care
about) provide an "Estimate cost" function. Web articles always start with the author trying to sell
you on how important their content is before they get into the details (see
[JustTheRecipe](https://www.justtherecipe.com/)).

In terms of a net, what if someone has already done backpropagation, made an educated guess, and has
a weight update you can use? Or a whole pretrained model? As long as you can reproduce their results
as needed, you should be able to rely on their work as a dependency (ignoring their failed
experiments, unless they were kind enough to document them).

Imagine you had an oracle would could indicate to you where to search for value, and in fact how to
achieve any goal you were interested in. That is, you had no need to backpropagate (or plan) because
an oracle could give the plan to you. What would this look like for implementing code? It'd have to
be based on what the developers you have already know; the most efficient steps would likely use
what they know (low cost steps) to do work while expanding their knowledge incrementally (adding
abstractions). In some cases, though, it might ask them to e.g. read something in detail to obtain
new abstractions to be able to implement the next feature extremely quickly. The oracle would need
to know how long every developer would stay at the company, to decide how much to invest in them.

The next best thing to an oracle is a teacher who understands both what you do and don't know, what
options are out there for you to explore next, and what you value. Equivalently, you could follow an
easy to use map of the territory produced by someone else (a map where X marks the spot with the
gold).

Again, the answer is domain-specific. Such a map exists in some domains (e.g. in existing research
papers). In these domains, you should be reviewing the research rather than exploring your own notes
and ideas. If you don't know the word that describes what you want to do you can't ask the question,
however, even if the research already exists. More words always makes for better and more specific
questions, even when you're querying yourself. We can only come to a teacher or map (e.g. a web
search engine) with our own words. See also:
- [Vocabulary development](https://en.wikipedia.org/wiki/Vocabulary_development)
- [Vocabulary](https://en.wikipedia.org/wiki/Vocabulary)

A kid who can't express what they want must resort to crying (and their parents guessing). Even a
good parent who understands their kid's babble and sign language can't run the neurons to help the
kid hit the next milestone, though. It may take some time to organize your own thoughts to be able
to ask the right question, or the teacher/map may simply be confused and provide irrelevant results
(web search engines come with safety filters). In fact, you aren't going to know if the existing
research has a solution to your questions until you've been able to query it, and that may require
learning new language specific to the research community in order to do so.

## Use domain-specific heuristics

Adding goals/ideas is like mining. You can't be sure that a particular mine will produce the same
amount of gold per unit of work it did in the past, but you can take as a prior the gold per unit
work it produced in the past.

That is, you should have some heuristic (per domain) for the number of imagined worlds you should be
considering before you start working on one of them. It's only with experience in an area that
you'll be able to choose a good default before starting, but after collecting even a few goals/ideas
you'll get a sense of it. Is your new idea twice as valuable as the last one you generated? It's
probably always wise to generate 3-4 ideas in what you consider a "domain" before picking out one of
them.

This is another fundamental limitation of planning; who says there isn't gold around the next
corner? How many ideas should you be considering before you move on one of them? This isn't about
your values shifting, but simply about you being unaware of what opportunities are out there. It's
only with experience that you'll be able to come up with a number (a hyperparameter) for a new
domain (e.g. the minimum, average, or maximum number of ideas you should generate).

[pbr]: https://openai.com/blog/reinforcement-learning-with-prediction-based-rewards/

Try to avoid succumbing to your personality, and instead consider the domain. One of the [Big Five
personality traits](https://en.wikipedia.org/wiki/Big_Five_personality_traits) is curiosity, for
example. Is curiosity good or bad? It depends on the domain. See the article [Reinforcement Learning
with Prediction-Based Rewards][pbr], which points out the value in curiosity in solving Montezuma's
Revenge. The addition of curiosity is probably beneficial overall (some is almost always better than
none), but on certain games the addition of curiosity led to lower performance.

When exploration/experimentation/investigation is dangerous or expensive, we use the proverb
"curiosity killed the cat" to control ourselves. People crave new experiences; we don't want to go
to the same restaurant twice and will spend half an hour searching for a new place to eat (despite
the limited value). If you can't predict it, we like it.

Still, there's likely value in tuning towards curiosity in modern problems. See also:
- [Deep reinforcement learning - Research - Exploration](
https://en.wikipedia.org/wiki/Deep_reinforcement_learning#Exploration)
- [Intrinsic motivation (artificial intelligence)](
https://en.wikipedia.org/wiki/Intrinsic_motivation_(artificial_intelligence)#Intrinsically_Motivated_Learning)
- [Learning - Psychological factors and teaching style](
https://en.wikipedia.org/wiki/Learning#Psychological_factors_and_teaching_style)

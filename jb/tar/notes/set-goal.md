# Set goal

Add a single goal/idea to a "future" git graph, either wide or deep. Explicit backlinks:
- [](./set-wide-goal.md)
- [](./set-deep-goal.md)

# Estimate cost

## Negotiate the goal(s)

Unfortunately, you need to define the T in VNTE to quantify the V in VNTE. It's the V that drives the
generation of a T, but it can't be quantified without it. Said another way, the V drives the search
for *any* goal state, and the NT defines the set of goal states. If you aren't specific about what
you want, then you can't be specific about how good it is (V). You can say you want more money, but
if don't define what you are going to learn to be able to do (specifically) to make money you can't
estimate how much money you will make. Said yet another way, V drives your imagination (of possible
worlds). See also the NT in [INVEST (mnemonic)](https://en.wikipedia.org/wiki/INVEST_(mnemonic)).

If the T is just given to you with intrinsic value (or trusted instrumental value), you can only
imagine through subplans. See [](./estimate-improvement-value.md) for comments on these terms.

Before any metrication or quantification, we must imagine possible worlds. These are theories in the
context of the scientific method, and T in the context of INVEST. From this initial VT you can
imagine a second VT (a variation on the first), or estimate an E to go with the first VT (to test
the theory). Although SNI could come before E, even approximate numerical weight estimation (and
therefore state space pruning) isn't possible without E.

Goals should stay negotiable as long as possible. Keeping goals negotiable is the equivalent of
putting ranges on targets, and using a logical disjunction (OR) as much as possible. It's more work
for the "authority" (buyer) to specify the details, but it can be the product much cheaper (faster,
in software development). The less negotiable a goal is, the more innovation waste you're going to
see (less opportunity for coming up with 10 ideas to achieve X). Not only is this bad for the
company, it's bad for relationships (less control at work leads to less job enjoyment).
Negotiability also prevent finger pointing about who should have understood or explained
requirements.

Plans/stories should usually have only the what (NT) and the why (V), not the how (which is a sneaky
way to extend the NT by claiming to provide an E). At the same time, suggestions should be welcome
as long as they aren't binding. What if your competitor has a good idea that isn't IP protected? The
product owner often does all the competitor research that no developer has time to do. Is anyone
else doing competitor research? It is valuable. Why not use the research of others in academia?
Isn’t even asking your coworkers for advice about how to complete something an example of giving up
negotiability? Does being negotiable mean you get to decide how to do it alone?

In the language of [Plan](https://en.wikipedia.org/wiki/Plan), imagine variations on the
"specificity" of your goal. See also [Types of Plans in Business: Breadth, Time-frame, Specificity &
Frequency](https://edukedar.com/types-of-plans/). How can you deliver some of the value without all
of it?

Following this step, you should have several goals (e.g. B, K, L) with an estimate of the associated
increase in value (in e.g. \$) of achieving each goal. In theory, the value should be specified as a
probabilistic function of the exact state achieved, but point estimates are a good starting point.

Said another way, it should be possible to produce the plan `a..c` as an alternative to `a..b`:

```
* b: G1, S2: 3PM
| * c: G1, S1: 2PM
|/
* a: 12PM
```

If it isn't possible (e.g. G1 specifies the whole state of the universe at some point in the future)
then it's going to be harder to come up with e.g. 10 ways to solve a problem. If you don't have
flexibility in generating a solution (later) then a solution is going to be expensive or impossible.

### Objective function

In the end, a value assigned to some goal state is a [Function (mathematics) -
Wikipedia](https://en.wikipedia.org/wiki/Function_(mathematics)) where the cardinality of the domain
and codomain are both one. The items in the domain are world states (e.g. including the assets
assigned to everyone), and the items in the codomain are some measure of value (such as \$). At best,
everyone would provide a value function that assigns to every possible world state a \$ value, so
that we wouldn't have to ask for the details of which particular "goals" they care about; we are all
flexible and should be flexible with our goals.

Said another way, by default most people only consider a [Partial function](
https://en.wikipedia.org/wiki/Partial_function) of world states to values. It would be better (in
theory) if instead we all provided a complete [Objective function](
https://en.wikipedia.org/wiki/Loss_function). The product owner on a Scrum team (ideally) provides
this objective function in the form of a person, so developers can query him/her with goal states.

If future value is uncertain (because of e.g. an uncertain future market), you may need to provide
an [Estimator](https://en.wikipedia.org/wiki/Estimator) of value rather than a non-probabilistic
function. The "market" (in the present) provides an objective function to some degree in economics,
though for specific subsets of world state and specific changes in world states. It can be expensive
to query the market, more than asking a person, if market information isn't readily available e.g.
online.

Said another way, what makes a "variation" on one goal any different than a completely different
goal? Is there some magical "distance" between the two goals that makes them variations on the same
goal rather than completely separate goals?

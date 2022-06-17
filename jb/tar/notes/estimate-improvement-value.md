---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.2
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Estimate improvement value

An estimate of the value of an action.

# Value

You can't estimate the value of estimating value, in general. Eventually you need a base case, or
the recursive value-estimation function is not going to halt. When you're talking about a specific
situation, you can talk about the various higher-level reasons that you are doing what you do. This
breaks down the higher-level you get, similar to how a child asking "why" endlessly usually ends
with the parent saying that God asked us to do it in a certain way, sometimes without consulting
with God. That is, God serves as the base case.

## Planning

You may be tempted to say that this process inherits value from planning documents; that it helps
prioritization. While it's true that you will be more decisive and opinionated if you understand
your own values clearly and concisely, you can't say that this is valuable in itself. Is it better
to know what you value and make quick decisions, or be willing to go with the flow?

## Teach a computer

Despite values being quite uncertain, and therefore the value of a specific project or major goal
being even more uncertain, it helps to try to think precisely about them to potentially teach a
computer how to achieve larger goals.

# Cost

## Unit of measurement

Typically measured in units of dollars, another currency, or in general in any [Store of value](
https://en.wikipedia.org/wiki/Store_of_value). See also [Money](https://en.wikipedia.org/wiki/Money)
and [Currency](https://en.wikipedia.org/wiki/Currency).

All value measurements must have units; they are not unitless. They cannot be unitless, because they
must be measurable (directly or indirectly) in a state space. Although a state space search may
target a change in anything, i.e. any [Asset](https://en.wikipedia.org/wiki/Asset), it will not be
possible to compare possible worlds with everything measured in different units (hence the invention
of money).

There's no such thing as money that makes money, because e.g. silver can't "multiply of its own"
(see [Interest](https://en.wikipedia.org/wiki/Interest)). Said another way, money under a mattress
isn't making money. Money must be converted to another form to make money; even storing money in a
checking account is making it slightly less liquid (in theory) than having it in your hand.

A cost to one person is a return to another. That is, specifying value separately from cost lets us
abstract the "how" from the "why" we are pursuing a goal (the "what"). It gives us independent
opinions about what is valuable; the person making a good obviously thinks it is valuable. For a
person working alone, it lets them get into focused work on thinking about value, then focused work
on thinking about cost (separately). See also [Cost](https://en.wikipedia.org/wiki/Cost) and
[Price](https://en.wikipedia.org/wiki/Price).

### Time is not money

The phrase "time is money" comes from Benjamin Franklin. See [Time is money (aphorism)](
https://en.wikipedia.org/wiki/Time_is_money_(aphorism)).

Ben is clear to point out that he assumes the young tradesman spends the whole half-day on nothing
but diversion and idleness, but this is a major assumption. For a more detailed treatment along
these lines, see [Time is money, but money can't buy time - The Physician Philosopher](
https://thephysicianphilosopher.com/time-is-money/). The claim that "time is money" implies that
time can buy money and that money can buy time; both these ideas are too simple for sufficiently
complex problems.

#### Time can buy money

The claim that "time is money" implies that time can buy money, and was used in the only training
example Ben provided. While this is a side effect of labor, it ignores a million other side effects.
When you earn money, are you completely not enjoying your time? Are you not contributing to the
world (changing it) in a way that you also find valuable? Find a job you love, and you'll never
"work" a day in your life.

#### Money can't buy time

The claim that "time is money" implies that money can buy time. In many ways, this is a more
imprecise assumption. A clearer (and longer) statement might be that money can save you managing
state that you've already committed to managing by out-sourcing it to another company, person, or
machine you trust.

Any "tool" can "buy" time, but only in the sense of getting you to a goal state faster or without
your personal involvement. I'm referring here to automatic vacuum cleaners, self-driving cars, fast
computers, fast phones, moving companies, restaurants, teachers (to learn faster), and your
sister-in-law when she watches your kid.

It's equivalently imprecise to say money can "save" you time. Let's say you hire someone to mow the
lawn at your second home. Are you saving time by doing so? What if you didn't have the second home?
Did you spend time by buying the second home that you now need to buy back? If you fly rather than
drive to save time, did you spend time by choosing to travel?

Time is never fully lost, which is what "save" implies (as if it was money). You'll get a lot more
time to talk and work on other tasks while you're traveling if you drive rather than fly. Are you
going to go into a coma for the three hours that you drive (completely lose the time)? The only way
to compare driving to flying is to consider the two possible worlds, and all the complexity
involved.

You can trivially change the world state to advance time, if that's what you value and is included
in all your goal states. It happens without your control. Traveling to the future would be possible
if we were only able to stop the aging process and you had a lot of money for someone to watch over
your body. A computer program can [`sleep`](https://en.wikipedia.org/wiki/Sleep_(command)) to reach
the future.

It's also not precise to say that "time is more valuable than money" if you don't accept that it can
be bought. It's what you do with the time that's valuable, not the time. You can go on vacation to
the most beautiful place in the world, but if you don't go with the right attitude or an
understanding of what you are going for (temporary warm weather, relationships) it won't be a good
time.

Shaking the idea that time is money may inspire you to clear your calendar; see [Warren Buffett
taught Bill Gates by sharing his blank calendar](
https://www.cnbc.com/2018/09/07/warren-buffett-taught-bill-gates-about-time-management-by-sharing-his-blank-calendar.html).

#### Time can't buy time

Let's say you see some task that will "save" you more time than it will cost you. What prevents you
from taking the task on? It's effectively a "guaranteed" win, if you have an infinite time horizon.
It's easy to pursure these tasks if you round "the rest of your life" out to infinite.

This approach does not consider the endgame (see [Chess endgame](
https://en.wikipedia.org/wiki/Chess_endgame)). To some people, this may mean trying to run out of
money before they die (unless you care about the lives of e.g. your children or friends). Learning
investments (in your own biologial neural network) will not survive your death. Ideally, you teach
everything you know to others before you die (or document in a place you know will be read).

#### Practical standpoint

[oafw]: https://en.wikipedia.org/wiki/OpenAI_Five

It's hard to continue to maintain the time is money model as you attempt to solve more complex
problems. Most machine learning models (see [OpenAI Five][oafw]) include time as separate from the
goal states, and if you want to use them, the time is money model isn't going to work. In fact, no
independent variable can affect time. See [](./practice-12.md) (12H7 and 12H8) for a detailed
example.

[inv]: https://en.wikipedia.org/wiki/Investment
[oc]: https://en.wikipedia.org/wiki/Opportunity_cost
[roi]: https://en.wikipedia.org/wiki/Return_on_investment

Similarly, most economic models keep time separate from value measurements in imagined worlds. An
[Opportunity cost][oc] is calculated based on the consideration of 2 possible worlds (a binary
decision) with respect to a spending action, with a separately configurable time period. A
[Cost–benefit analysis](https://en.wikipedia.org/wiki/Cost%E2%80%93benefit_analysis) is similar. A
[Return on investment (ROI)][roi] is calculated based on the consideration of 2 or more possible
worlds with respect to an [Investment][inv] action, with a separately configurable time period.

For the sake of scheduling (fitting items where they fit in your schedule e.g. if they are small)
it's not desirable to absorb time estimates into weight estimates (unless they are also reported
independently). See [Scheduling (computing)](https://en.wikipedia.org/wiki/Scheduling_(computing)).

#### Time is money model

Despite it not being the normal basis for the logic used in these articles, the time is money model
is still a good approximation in some circumstances. It's equivalent to imagining two possible
future worlds, assigning zero value to one, and assigning value in the regular way to the other.

Benjamin Franklin was encouraging someone to avoid a truly "lazy" activity, equivalent to going into
a coma or watching television. This is only an approximation; many activities that add "zero value"
may actually deserve a negative score because of e.g. the dependency or our memory to degrade or
because we're hurting ourself as part of the process.

We are necessarily making a judgement (assigning value to how time is spent) when we convert it to
money. For Ben's subject, and e.g. someone watching television, it may be that they do it for
nothing but the temporary happiness. That is, their activity is an end goal in the context of their
life, a goal state they have been reaching for in all their other activities. They may be scoring
their life in terms of how much time they spend of it in their goal state.

## Include uncertainty

Use reference class forecasting; how "accurate" (consistent) have your estimates been in this domain
in the past? In your personal life, how consistent have your values been? In a business setting, how
consistent is the market? How often do [KPI](https://en.wikipedia.org/wiki/Performance_indicator)
change?

If your own values are a moving target, then it may be better to let others define them for you (so
you can e.g. make more money). If you don't make one topic "your thing" though, you risk not
building (effective, efficient) deep mental networks that are valuable to others.

If we were all perfectly consistent, then how we spend our time and money would reflect our values.
That is, if you wanted to know what someone valued, you could check what they do and their credit
card statements. It can help to review these to understand yourself. What do you "value" in
practice?

% See this list of personal opportunity costs:
% https://docs.google.com/document/d/1zqG-vNESbVLhbceU22UKO6L8hDUbLmMtooLM_M9_txs/edit

## Ultimate Source

Let's borrow two terms from philosophy: intrinsic and instrumental value. For a definition of these
terms, see [Value (ethics and social sciences)](
https://en.wikipedia.org/wiki/Value_(ethics_and_social_sciences)#Intrinsic_or_extrinsic).

### Trusted Instrumental Value

#### Value

In general, trust is a powerful tool to avoid significant work balancing costs and benefits. Kids
trust their parents about what is "good" (e.g. math) without an understanding yet of all the areas
they'll be able to use the skills they use.

When you join a new (large) company or change to a completely different team within your company,
you usually do not have enough background on the software and the business to understand how what
you do affects the bottom line. Instead, you have to trust someone who brought you into the company
to provide some guidance about what to work on until you have a better understanding of what
matters.

Interestingly, if you work on a subteam in a huge company then helping the teams that use your
projects (those TODo) have trusted instrumental value, if you don't understand what they do. For
example, how do the engineers who maintain the company's build system decide which requests to spend
more time on?

You trust your past self when you respect the number on a scored TODo you put on a task in your code
or notes. Although these scores are often produced based on an estimate of both value and cost, we
often forget to update them as we start working on the task and discover more about cost.

We might say that people see money as having intrinsic value, which is why the monetary system is so
effective. That is, we don't back money by gold or anything else that is intrinsically valuable
(e.g. food) but we all still want it as an end in itself, i.e. because other people want it. It's
probably more accurate to say that money has trusted instrumental value; we assume we are helping
others by collecting it (which has intrinsic value). Of course, gold doesn't fundamentally have
intrinsic value to many people either (we just dig it up and bury it again). We could back money by
livestock, but that doesn't have instrinsic value either. We could use livestock to e.g. produce
food, but what kind? And is food the end goal of all our lives, to accumulate it in huge quantities?
Which food? Should we back money by relationships? We could find a way to measure it, even if it'd
be quite uncertain.

#### Cost

In some sense, within a company, you want to get rid of all calculations based on trusted
instrumental value so the whole network is connected. When we decide how to spend all our time based
on value signals from others we trust, we not only depend on them to make decisions, we may be
putting false trust in someone who is more interested in their own advancement than our own.

Should you see dollars as helping others? Is getting dollars equivalent to loving your neighbor? In
terms of trust, should we trust that the people who are giving us dollars are eventually doing
"good" things with what we give them back? Many people believe that behind every great fortune lies
an even greater crime. Who provides the dollars you are earning, that is, who are you serving?

Ideally, dollars would represent the average opinion of other people about how valuable something
is. If a democratic, fair (good) society is printing the dollars, then this should be closer to
true. What's great about dollars for optimization is they provide a metric people care about when
otherwise there might be none.

Do you trust that those giving you dollars providing goods and services that are "good" with respect
to your values? See [Socially responsible investing](
https://en.wikipedia.org/wiki/Socially_responsible_investing).

##### Personal Currency

To help avoid optimizing for some world state that don't match your "true" values, you could define
your own measure of value and use it in calculations. Similar to a cryptocurrency, it would have
value only because you declared (to yourself) that it has value. It'll be easy to win any games you
define using it, because you define whether you are winning.

Plenty of guides exist online to create your own cryptocurrency, which might be (theoretically)
useful if you need machines to optimize on some task for you. For other examples, see [How to Start
Your Own Private Currency - The Atlantic](
https://www.theatlantic.com/business/archive/2011/04/how-to-start-your-own-private-currency/73327/).

Try defining your own personal currency, e.g. Personal dollars, roughly equivalent to an hour of
your time. In practice you'll likely mismanage the currency (leading to hyperinflation), only
because you are not going to live forever and you'll spend the "money" too fast. You probably won't
need to adjust for the [Time value of money](https://en.wikipedia.org/wiki/Time_value_of_money)
anytime soon.

[fer]: https://en.wikipedia.org/wiki/Floating_exchange_rate

Estimating the value of a Personal dollar at an hour of your time is *not* to say that time is
money; there is a [Floating exchange rate][fer] between Personal dollars and an hour of your time.
That is, you may be willing to accept two Personal dollars to spend three hours on a task you enjoy,
but will ask for four Personal dollars to spend three hours on a task when e.g. you're busy.
Similarly, there is a floating exchange rate between Personal dollars and US dollars. This
relationship will hold between anyone you give Personal dollars and between your future and past
self. By giving someone Personal dollars, you are essentially committing your future self to a task
(money is an IOU).

To encourage this way of thinking, it may be helpful to start your personal dollars at some random
number of minutes between 5 and 60 minutes. If you tell someone how much you think a Personal dollar
is worth (in your time) then they are going to take that as a promise that you are pegging the
dollar to that amount of your time. In the end, you should start to define value in terms of world
states rather than time (in terms of the Personal dollar itself), and a starting time value is only
to help you personally bootstrap the system.

Developers often accidentally fall into thinking of a "story point" in Scrum as a kind of local
currency, similar to Ithaca HOURs. This attitude usually leads to runaway inflation (see e.g. [Stop
Using Story Points](https://www.industriallogic.com/blog/stop-using-story-points/)) because the
"currency" isn't being managed by any central bank. A story point measures effort, not value. The
product owner or stakeholders would need to come up with a separate measure of value and and e.g.
divide value by cost to come up with a priority order. In theory it would be possible to do this,
though (assuming value measure in dollars) the priority scores would be in the strange units of
dollars divided by story points. It's not ideal, but the stories could still be prioritized with a
simple sort of this score.

### Shifting Sources

It’s OK to have knowledge acquisition stories, but it should be in the form of spikes, prototypes,
etc. (validated learning rather than extensive planning). Similarly, some people like two stories
for defects, one to investigate the root cause of the defect, and a separate story to decide what to
do about it. Once the first story is done, a few people (or even just two) can get together to talk
about the proper solution, rather than just having the first person who found the root cause come up
with a solution. Of course there may only be one obvious solution, or it may be so urgent to fix the
bug that we need to understand the root cause and then interrupt another developer to ask them about
potential solutions.

In general, it's easy to convert one "large" task with e.g. intrinsic value into multiple with
instrumental value by simply taking the first thing you think you need to do for the large task and
separating it into it's own task. Large companies do this when they have an architect break down a
customer feature into many services (whether driven by software services or manually by teams of
people providing a service in the service economy).

Don't get hung up on the distinction between a story and a task in Scrum or on Kanban boards; it's
better to use the philosophical terms (they provide a larger and older, more standard language).
Everyone already knows we should consider what is shown at the sprint review (items with intrinsic
or trusted instrumental value, i.e. relevant to those outside the team). Simply show progress at the
sprint review, even if it's not going to make a difference to your team's service's API (e.g.
whether people want to update). Present those items at the sprint review as well, but more
importantly include them in release notes.

### Future Goals

See [](./define-values.md) for a comparison between values and goals. When you are working on a
specific goal/project, your value estimation function should regularly include the value you put in
acquiring the knowledge that the solution requires. Call what you learn as part of a project
"transfer" value; see [Transfer of learning](https://en.wikipedia.org/wiki/Transfer_of_learning) and
[Transfer learning](https://en.wikipedia.org/wiki/Transfer_learning).

Transfer value is a specific kind of instrumental value, scored based on the set of projects you
expect to work on in the future.

Transfer value is the value of a commit in source code; not the value of running the source code.
See the end of [](evaluate-pedagogical-tool.md) for this extended analogy. Said another way, it's
the value in running training for longer rather than running inference. For a learning task, the
cost is how long we will need to run training (or generate commits), and the value is how the time
we put into that investment pays off in terms of in terms of improved outputs (translated to the
value metric).

## Significant terms

To eventually estimate the cost of an effort numerically (e.g. in time), we often need more details
about the objective function.

### Societal Values

[hur]: https://en.wikipedia.org/wiki/Human_rights

See [](./define-values.md) for a discussion of societal values and how they influence us. Although
these may seem arbitrary and imprecise, they get slightly more interesting if you consider how you
would metricate them in a machine. If you think e.g. the [Human rights][hur] listed in the U.S.
constitution are valuable, you will eventually need a way to teach them to computers.

In particular, it's important to keep track of these values because they can be major sources of
uncertainty. If the story the team is going to work on next becomes primarily a matter of politics
(like passing laws from a shared backlog) then you need to move on.

#### Relationships

There is value in relationships. Compliment other people. That is, if someone does something good
for you then you should do something good for them, or they'll stop helping you out (tit for tat). A
salesperson can put dollars on the value of many relationships. Money can't buy you love. Many
people rate their successes on how their family will view them.

#### Normativity

One common societal value is [Normativity](https://en.wikipedia.org/wiki/Normativity); we regularly
influence the opinions of others through [Normative statements](
https://en.wikipedia.org/wiki/Normative_statement).

For example, why do you send a greeting card to a sick relative? If you're doing it because you have
heard that all your other siblings are doing it, then you are acting in response to normative value.

Notice this can be both a positive and negative term. If you will likely be attacked for e.g.
failing to fit in, then the value is negative. If you are instead acting out of a genuine desire to
put value on the opinions of others rather than yourself (putting trust in them) then this is
arguably positive. In some sense, a preference for normativity is a preference for democracy.

A preference for using the language of others rather than your own is normative, and also lets you
pull their thoughts into your own mental networks.

#### Know thyself

In some ways, this is a societal value similar to the more commonly known value we put on
self-expression (in the western world). Unfortunately, it's hard to metricate this. Many people are
likely pulled into "neural networks" because the name promises to help them both understand
themselves and teach computers.

### Value in Reproducibility

Many calculations assume once we know how to do something we won't forget how to do it, and what we
need to perform the task won't change. Let's say there's no value in reproducibility, i.e. you only
need to be able to perform the task once. Is it worth the cost of learning something if you're only
going to need to perform it once, when the next time you may need to follow it will be years from
now, and may require a mostly different process to get the same result?

Said another way, do you need to build something reusable? See the distinction between one-time and
reusable (causal) plans in [](./estimate-subplan-weight.md). We tend to prefer goals that give us a
reusable asset (e.g. we learn something, write reusable code) because we can "profit" from the
action more than once. People are curious; we often value novelty and unpredictability in itself
(see a discussion in [](./explore-domain.md)). It's likely we have this preference because, all else
being equal, it's better to learn something new (i.e. something reusable) than do something
one-time. When you're learning a decent heuristic is to pursue novelty; only you know if you’re
learning at a rapid or a slow rate on a particular resource. Ironically, learning is often (and
ideally) a one-time action.

In the case of a unit test in a build service, where the value in the test is often only to a
developer or developers, we need to make hard decisions about whether to keep certain tests. Tests
primarily need to be reusable in order to help developers relearn a concept in order to change code.
Can a test that intermittently fails only be reenabled as needed (commented out)?

Let's define reproducibility as generalizability across time. If literally nothing changed, that is,
we reproduced the state of the world at the exact time a test passed, the one time it did, then it
would pass again. If results are not reproducible, then something changed. Nothing in life is fully
reproducible, so you will always need to define a minimum e.g. SLA in the definition of the task
(estimated output improvement). For example, we may require that a test will pass on 9/10 builds,
indefinitely.

You can define a minimum SLA in the task, but sometimes you may need to revisit the target SLA as
you discover more about the problem and instead think about the different amounts of value you will
deliver for different levels of reproducibility. That is, there may be different value estimates for
different SLA levels. If it's easy to get the test to pass 99/100 times but 10x more work to get it
to 999/1000 times, then you might want to either drop it altogether or not require it to pass on
every build of the software (e.g. cache the passed test). If you have 1000 tests in your build, then
99% reproducibility is not enough. If you [](./regularly-stress-test.md) you can monitor what
fraction of the time the test passes and notice if e.g. it drops to 0/10 times. Feedback will be
slower, but you won't have to stop running the test.

### Value in Expediency

Also called the "cost of delay" in other material. It may be that a story is becoming less valuable
with time (which makes it harder to schedule, of course).

If there is no or little cost of delay, you should consider doing the story whenever it is
convenient to do; e.g. at the same time as other stories in the same area.

For people, who not only lose mental plasticity with time but have a limited lifespan, the benefits
of learning a particular skill decrease with time. For example, we typically don't have people go
back to college in their 50s and 60s to learn a completely new career (though there's nothing wrong
with this, since the investment can pay back even in this timeframe depending on what they are
currently doing).

This kind of value is also related to the explore-exploit problem; see [Multi-armed bandit](
https://en.wikipedia.org/wiki/Multi-armed_bandit).

When will your time be saved? If a process improvement insight saves you 3 minutes a day for the
rest of your life, then it only costs 6 minutes to delay implementation for two weeks. Don't waste
time working on something until you've thought about it for a bit, and you're sure it’s going to
save time (your priors are more certain). Said another way, when do you pay back your initial
investment? If it's long, you many need to consider the time value of money. In the same way you
don’t just buy something from Amazon when you think of it, you don’t work on something until you’ve
reflected on its value.

### Anticipated Accidental Value

Humans and other animals have curiosity, a desire to learn that is often independent of any value
system. What we are naturally curious about often ends up being closely related to valuable skills,
but it's hard to attribute the drive to that alone. See [](./explore-domain.md) for more comments on
curiosity.

Should we should support [Basic research](https://en.wikipedia.org/wiki/Basic_research) with
government funding? This kind of research isn't driven to *alter* or control our environment and
therefore isn't likely in itself to be able to bring value (which almost involves control or
change). That is, should we support full time curiosity?

Many of the most important discoveries humans have made have been accidental; see [Role of chance in
scientific discoveries](https://en.wikipedia.org/wiki/Role_of_chance_in_scientific_discoveries).
It's likely many researchers have come up with estimates for what percent of our most valuable
discoveries came about by chance; this calculation should be possible based on a definition a
"valuable" specific to a person or society. If you believe this number is high, then you'd fund more
basic research.

Many once [Unsolved problems in mathematics](
https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics) were solved because of
someone's natural curiosity. In the modern world charities sometimes provide funds to motivate
solutions to basic mathematical questions (though these sometimes have known practical value). See:
- [Millennium Prize Problems](https://en.wikipedia.org/wiki/Millennium_Prize_Problems)
- [Fermat's Last Theorem - Wikipedia](https://en.wikipedia.org/wiki/Fermat%27s_Last_Theorem)

That is, take the phrase "necessity is the mother of the invention" with a grain of salt.

This kind of value isn't impossible in software; developers often find easy features just by reading
through a section of code. For example, that save hundreds of thousands of dollars in production
costs by removing unnecessary code that was running but actually not required.

## Examples

A refactoring task is a TODo that typically has time value (saving developer time), a form of
instrumental value among the whole project. A "story" TODo typically has intrinsic or trusted
instrumental value given by a company-external customer (value measured in dollars) or
company-internal customer (value requiring a company-internal metric).

Both refactoring and feature tasks may include transfer value (hard to metricate, but see below).
Confirm your coworkers (code reviewers, feedback providers) are interested in learning about the
associated topics.

Both kinds of tasks should come with new tests for the build service that have an SLA negotiated as
part of the work (or defined prior to the work, for a more accurate cost estimate). For tasks on the
opposite end of the spectrum, you may need to guess how much accidental value will come from it
using reference class forecasting.

### Mental function

[nc]: https://en.wikipedia.org/wiki/Neural_circuit
[lsbn]: https://en.wikipedia.org/wiki/Large-scale_brain_networks

Your brain stores mental sub-networks that model real-world systems. See:
- [Neural circuit][nc]
- [Large-scale brain networks][lsbn]

These sub-networks (together with sensory inputs) allow you to perform functions (i.e. processes,
tasks) such as math or the prediction of future world states.

Call the output of a mental function (a MentalModel) a `Thought`. Let's model how our high-levels
goal are affected by our mental sub-networks with backpropagation:

$$
\frac{\partial Value}{\partial MentalModel} =
\frac{\partial Value}{\partial Thought}
\frac{\partial Thought}{\partial MentalModel}
$$

In words, how your life goals are affected by improving the mental sub-network associated with this
task is equal to the multiplication of:
1. How your life goals are affected by the outputs of this function (thoughts).
2. How the outputs of this function are affected by your mental sub-network.

#### Transfer Value, Time Metric

How much does the mental function affect your current reality? Let's say you only produce the same
`Thought`, but faster. Then you would affect your future possible worlds by simply saving time:

$$
\frac{\partial Value}{\partial MentalModel} =
\frac{\partial Value}{\partial MentalSpeed}
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

$$
\frac{\partial Value}{\partial MentalSpeed} =
\frac{\partial Value}{\partial FutureWorld}
\frac{\partial FutureWorld}{\partial MentalSpeed}
$$

Combining these equations:

$$
\frac{\partial Value}{\partial MentalModel} =
\left(\frac{\partial Value}{\partial FutureWorld}
\frac{\partial FutureWorld}{\partial MentalSpeed}\right)
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

For example, if you are measuring value in time:

| Explanation                          | Variable               | Value       |
| ---                                  | ---                    | ---         |
| Would all the time you save on this function come back to you? | ∂Value/∂FutureWorld | 1 |
| How much schedule would you free per increase in thought speed? | ∂FutureWorld/∂MentalSpeed | 2 days/unit |
| Would execution take two rather than three days with a ∂MentalModel? | ∂MentalSpeed/∂MentalModel | 1 day/ex.   |

Then ∂Value for the ∂MentalModel is:

$$
= \left(1 * \frac{2 days}{\frac{1 day}{execution}}\right) * \frac{1 day}{execution} = 2 days
$$

See a similar example in [](./organize-notes.md).

% # Additional Training Data

% See `improve-estimate-improvement-value.md`.

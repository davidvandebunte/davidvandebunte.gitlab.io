---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: R
  language: R
  name: ir
---

# Practice: Chp. 8

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**8E1.** For each of the causal relationships below, name a hypothetical third variable that would
lead to an interaction effect.
1. Bread dough rises because of yeast.
2. Education leads to a higher income.
3. Gasoline makes a car go.

**Answer.** For 1, let's say the bread dough rises based on both yeast and temperature. If it's way
too hot or cold the bread won't rise because of the yeast, and it will likely slow at less extreme
temperatures.

For 2, consider location. Although income should rise with education, the rate at which it rises
will depend on the location e.g. based on the cost of living. Another variable that would work is
the category of the degree (medicine, engineering, art, language).

Interpret 'go' in 3 to mean the distance the car can travel. The kilometers traveled per liter will
depend on the car model (e.g. treat the model as a categorical variable).

+++

**8E2.**  Which of the following explanations invokes an interaction?

1. Caramelizing onions requires cooking over low heat and making sure the onions do not dry out.
2. A car will go faster when it has more cylinders or when it has a better fuel injector.
3. Most people acquire their political beliefs from their parents, unless they get them instead from
their friends.
4. Intelligent animal species tend to be either highly social or have manipulative appendages
(hands, tentacles, etc.).

[carm]: https://en.wikipedia.org/wiki/Caramelization

**Answer.** In 1, the covariates are heat (a float e.g. temperature), cooking time (e.g. seconds),
and degree of caramelization (e.g. a categorical of level of sweetness). See also
[Caramelization][carm]. It's unlikely the amount of time you need to cook the onions to produce
carmelization is independent of temperature. That is, doubling the cooking time will do nothing
if the heat isn't even on. Therefore, this likely involves an interaction.

In 2, the covariates are number of cylinders, fuel injector (categorical), and car speed. The
improvement a fuel injector provides will apply to every cyclinder, so if there are twice as many
cylinders the fuel injector will provide twice the benefit. Therefore, this like involves an
interaction.

In 3, we will (imperfectly) model political belief as a real-valued one-dimensional score where
negative values indicate preference for left-wing politics and positive values the opposite. If an
individual's score was 0.0 when his parents were 0.2 and his friends -0.2, etc. we'd say no
interaction exists. The way this scenario is described, it seems to suggest a model where an
interaction exists; something random decides whether a person gets the beliefs of their parents
(e.g. 0.2) or their friends (e.g. -0.2) rather than both influences combining.

In 4, the covariates are the level of sociality (e.g. a float, a score), level of manipulative
appendages (also a score), intelligence. Intelligence is highly complicated so it's hard not to
imagine some kind of interaction occurring. For example, a need to understand social networks may
improve graph-based intelligence, and a need to manipulate objects may improve spatial intelligence,
and reaching a certain level in each of these areas may enable some new skill based on combining the
skills.

+++

**8E3.**  For each of the explanations in 8E2, write a linear model that expresses the stated
relationship.

**Answer.**

For 1, where C = caramelization, H = heat, and T = cooking time:

$$
\begin{align}
C_i   & = Normal(\mu_i, \sigma) \\
\mu_i & = \alpha + \beta_{H}H_i + \beta_{T}T_i + \beta_{HT}H_{i}T_{i}
\end{align}
$$

For 2, where S = speed, C = cylinders, and F = fuel injector:

$$
\begin{align}
S_i & = Normal(\mu_i, \sigma) \\
\mu_i & = \alpha_{FID[i]} + \beta_{FID[i]}C_i \\
\end{align}
$$

For 3, where B = political belief, P = parents political belief, and F = friends political belief:

$$
\begin{align}
B_i & = Normal(\mu_i, \sigma) \\
\mu_i & = P_{i}\gamma_i + F_{i}(1 - \gamma_i) \\
\gamma_i & = Bernoulli(p) \\
p & = Uniform(0, 1)
\end{align}
$$

For 4, where I = intelligence, S = sociality score, and M = manipulative appendages score:

$$
\begin{align}
I_i & = Normal(\mu_i, \sigma) \\
\mu_i & = \alpha + \beta_{S}S_i + \beta_{M}M_i + \beta_{SM}S_{i}M_{i}
\end{align}
$$

[n1]: under_score

+++

**8M1.** Recall the tulips example from the chapter. Suppose another set of treatments adjusted the
temperature in the greenhouse over two levels: cold and hot. The data in the chapter were collected
at the cold temperature. You find none of the plants grown under the hot temperature developed any
blooms at all, regardless of the water and shade levels. Can you explain this result in terms of
interactions between water, shade, and temperature?

**Answer.** The association of water and shade with blooms depends on temperature. Said another way,
the association of water and shade with blooms is conditional on temperature, and the association of
water with blooms remains conditional on shade.

Rather than conditioning on temperature first, we could say the association of water and temperature
with blooms depends on shade. Because the effect of temperature is simple, we naturally want to
address it first.
)")

display_markdown(r"(
**8M2.** Can you invent a regression equation that would make the bloom size zero, whenever the
temperature is hot?

**Answer.** Using an Iverson bracket, where T is temperature:
$$
\begin{align}
B_i & = Normal(\mu_i, \sigma)[T_i = cold]  \\
\mu_i & = \alpha + \beta_{W}W_i + \beta_{S}S_i + \beta_{WS}W_{i}S_{i}
\end{align}
$$

[n2]: under_score

+++

**8M3.** In parts of North America, ravens depend upon wolves for their food. This is because ravens
are carnivorous but cannot usually kill or open carcasses of prey. Wolves however can and do kill
and tear open animals, and they tolerate ravens co-feeding at their kills. This species relationship
is generally described as a “species interaction.” Can you invent a hypothetical set of data on
raven population size in which this relationship would manifest as a statistical interaction? Do you
think the biological interaction could be linear? Why or why not?

**Answer.** Imagine the raven population is driven by both the wolf population and the general
amount of food in the area. If there's no food, more wolves traveling through the area won't help
the raven population. If there aren't any wolves, there won't be any open carcasses for the ravens
to consume.

The regression equation:
$$
\begin{align}
R_i & = Normal(\mu_i, \sigma) \\
\mu_i & = \alpha + \beta_{F}F_i + \beta_{W}W_i + \beta_{FW}F_{i}W_{i}
\end{align}
$$

[n3]: under_score

Assume F and W are both non-negative indicators of the number of wolf prey and wolves, scaled by the
maximum observed value.

It seems unlikely the interaction would be linear. Doubling the number of wolves with a set amount
of food once would likely have more of an effect on the raven population than doubling it again with
the same amount of food.


```{code-cell} r
source("practice-model-interactions.R")
```

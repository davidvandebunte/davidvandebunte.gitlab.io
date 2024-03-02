---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Exercise 7.68

+++

<!-- ![x](raster/2023-11-25T15-11-26.png) delete-me -->

> Apply the above definition to the "person $𝑠$ is worried about news $𝑡$" predicate from Example 7.65.
> 1. What open set is $∃(𝑡: 𝑇). 𝑝(𝑠,𝑡)$ for a person $𝑠$?
> 2. Does it have the semantic meaning you’d expect?

+++

## Author's solution

+++

> 1. The formula says that $∃(𝑡: 𝑇). 𝑝(𝑠,𝑡)$ "returns the union $V=\bigcup_{i}V_{i}$ of all the open sets $𝑉_𝑖$ for which there exists some $𝑡_𝑖 ∈ 𝑇(𝑉_𝑖)$ satisfying $𝑝(𝑠|_{𝑉_i}, 𝑡_𝑖) = 𝑉_𝑖$.” Substituting, this becomes “the union of all time intervals $𝑉_𝑖$ for which there is some item $𝑡_𝑖$ in the news about which $𝑠$ is worried throughout $𝑉_𝑖$.” In other words it is all the time that $𝑠$ is worried about at least one thing in the news. Perhaps when $𝑠$ is sleeping or concentrating on something, she is not worried about anything, in which case intervals of sleeping or concentrating would not be subsets of $𝑉$. But if $𝑠$ said “there’s been such a string of bad news this past year, it’s like I’m always worried about something!,” she is saying that it’s like $𝑉$ = “this past year.”
> 2. This seems like a good thing for “there exists a piece of news that worries 𝑠” to mean: the news itself is allowed to change as long as the person’s worry remains. Someone might disagree and think that the predicate should mean “there is one piece of news that worries 𝑠 throughout the whole interval 𝑉.” In that case, perhaps this person is working within a different topos, e.g. one where the site has fewer coverings. Indeed, it is the notion of covering that makes existential quantification work the way it does.

+++

## Alternative answer

+++

It's the union $V=\bigcup_{i}V_{i}$ of all the open sets $𝑉_𝑖$ for which there exists some $𝑡_𝑖 ∈ 𝑇(𝑉_𝑖)$ satisfying $𝑝(𝑠|_{𝑉_i}, 𝑡_𝑖) = 𝑉_𝑖$ (to repeat the definition). In other words, it's the times where the person $s$ is worried about at least one thing in the news (as in Example 7.65).

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

# Exercise 7.72

+++

<!-- ![x](raster/2023-11-25T15-16-19.png) -->

> Let $𝑆$ be the sheaf of people as in Section 7.4.3, and let $𝑗: \Omega → \Omega$ be “assuming Bob is in San Diego ...”
> 1. Name any predicate $𝑝: 𝑆 → \Omega$, such as “likes the weather.”
> 2. Choose a time interval $𝑈$. For an arbitrary person $𝑠 ∈ 𝑆(𝑈)$, what sort of thing is $𝑝(𝑠)$, and what does it mean?
> 3. What sort of thing is $𝑗(𝑝(𝑠))$ and what does it mean?
> 4. Is it true that $𝑝(𝑠) ≤ 𝑗(𝑝(𝑠))$? Explain briefly.
> 5. Is it true that $𝑗(𝑗(𝑝(𝑠))) = 𝑗(𝑝(𝑠))$? Explain briefly.
> 6. Choose another predicate $𝑞: 𝑆 → \Omega$. Is it true that $𝑗(𝑝 ∧ 𝑞) = 𝑗(𝑝) ∧ 𝑗(𝑞)$? Explain briefly.

+++

## Alternative answer

+++

1. Let's use "likes the weather" as suggested.
2. We'll let $s$ equal Bob to make this all simpler, although we could write it all for an arbitrary person. So $p(s)$ is a particular subset of times Bob likes the weather.
3. We translate this predicate to "Bob likes the weather or he is not in San Diego" using the "or not" translation discussed elsewhere. We expect this sheaf to return a subset of times, and this predicate should be able to return a subset of times.
4. Or more precisely $𝑝(𝑠) ≤_S 𝑗(𝑝(𝑠))$. While $p(s)$ is a particular set of times not qualified by anything, $j(p(s))$ is qualified by the requirement that Bob not be in San Diego. Most precisely, the subset of times that "Bob likes the weather" given by $p(s)$ should be a subset of the times that it's true that "Bob likes the weather or he is not in San Diego".
5. Yes; adding an additional qualifier of "Bob is in San Diego" should make no difference because we've already qualified the statement on that proposition. If Bob was not in San Diego, he's still not in San Diego.
6. Let's assign $q$ to "... is wearing red". Then "Bob both likes the weather and is wearing red, and is not in San Diego" should be equivalent to "Bob likes the weather and is not in San Diego, and Bob is wearing red and is not in San Diego".

+++

## Author's solution

+++

> 1. Take 𝑝(𝑠) to be “𝑠 likes the weather.”
> 2. Let 𝑈 be the interval 2019/01/01 – 2019/02/01. For an arbitrary person $𝑠 ∈ 𝑆(𝑈)$, $𝑝(𝑠)$ is a subset of $𝑈$, and it means the subset of $𝑈$ throughout which $𝑠$ likes the weather.
> 3. Similarly $𝑗(𝑝(𝑠))$ is a subset of $𝑈$, and it means the subset of $𝑈$ throughout which, assuming Bob is in San Diego, $𝑠$ liked the weather. In other words, $𝑗(𝑝(𝑠))$ is true whenever Bob is not in San Diego, and it is true whenever $𝑠$ likes the weather.
> 4. It is true that $𝑝(𝑠) ≤ 𝑗(𝑝(𝑠))$, by the ‘in other words’ above.
> 5. It is true that $𝑗(𝑗(𝑝(𝑠)) = 𝑗(𝑝(𝑠)$, because suppose given a time during which “if Bob is in San Diego then if Bob is in San Diego then 𝑠 likes the weather.” Then if Bob is in San Diego during this time then 𝑠 likes the weather. But that is exactly what 𝑗(𝑝(𝑠)) means.
> 6. Take 𝑞(𝑠) to be “𝑠 is happy.” Suppose “if Bob is in San Diego then both 𝑠 likes the weather and 𝑠 is happy.” Then both “if Bob is in San Diego then 𝑠 likes the weather” and “if Bob is in San Diego then 𝑠 is happy” are true too. The converse is equally clear.

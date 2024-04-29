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

# 2. What do groups look like?

+++

## 2.4 Cayley diagrams

+++

See also [Cayley graph](https://en.wikipedia.org/wiki/Cayley_graph).

+++

## 2.5 A touch more abstract

+++

Another way to describe what we're doing here is in the language of syntax and semantics. Everything we do must necessarily map to human language and our human problems. This section demonstrates how the same syntax (mathematical model) can have different semantics; it provides two examples of semantics for the same group. We seek to "generalize" both of these problems into one so we can study both of them at once.

+++

## 2.6 Exercises

+++

### 2.6.1 Basics

+++

#### Exercise 2.1 (📑)

+++

> In the rectangle puzzle, what actions were the generators? What other actions are there besides the generators?

+++

The generators were flip horizontally and vertically; the other distinct action is both a horizontal and vertical flip. There's also an identity action that's similarly always available. All these actions are their own reverse.

+++

The author's solution:

+++

> The two generators are the horizontal flip and vertical flip. The other actions in the puzzle are the non-action (do nothing) and the combined action "horizontal flip then vertical flip".

+++

#### Exercise 2.2

+++

> In the light switch puzzle, what actions were the generators? What other
actions are there besides the generators?

+++

The generators were flip the left and right flip; the other distinct action is flipping both at once. There's also an identity action that's similarly always available. All these actions are their own reverse.

+++

#### Exercise 2.3 (📑)

+++

> Can an arrow in a Cayley diagram ever connect a node to itself?

+++

We typically don't include the identity arrows, but we may in some cases for clarity.

+++

The author's solution:

+++

> Arrows that point from a node to itself represent the non-action. Typically such arrows are not included in the diagram, since they add clutter, but not any useful information.

+++

### 2.6.2 Mapmaking

+++

#### Exercise 2.4 (📑)

+++

> Exercise 1.1 of Chapter 1 defined a group. Create its Cayley diagram using the technique from this chapter. (Hint: This group is simpler than even those done
so far; the diagram will be small.)

+++

![x](2-6-ex-4-cyclic-group-2.svg)

+++

The author's solution:

+++

> ![x](2-6-ex-4-author-cyclic-group-2.svg)

+++

#### Exercise 2.5

+++

> Exercise 1.4 of Chapter 1 defined a group. Create its Cayley diagram using the technique from this chapter.

+++

![x](2-6-ex-5-cyclic-group-6.svg)

+++

Using [Cycle notation](https://en.wikipedia.org/wiki/Permutation#Cycle_notation):

+++

$$
\begin{align}
a = [(AB)(C)] \\
b = [(A)(BC)]
\end{align}
$$

+++

#### Exercise 2.6

+++

> Exercise 1.13 described an infinite group which can be generated with just one generator. Can you draw an infinite Cayley diagram for it? (Just draw a portion of the diagram that makes the infinite repeating pattern clear.)

+++

![x](2-6-ex-6-infinite-group-integers.svg)

+++

> How does that Cayley diagram compare to one for the group in Exercise 1.14 part (a)?

+++

It has the same structure (homomorphic):

+++

![x](2-6-ex-6-infinite-group-even-integers.svg)

+++

#### Exercise 2.7

+++

> Exercise 1.14 part (d) described a two-element group. Can you draw a Cayley diagram for it? Which arrow or arrows should you use and why?

+++

![x](2-6-ex-7-cyclic-group-2.svg)

+++

We only use the arrow for -1; the arrow for 1 is the identity.

+++

#### Exercise 2.8 (📑)

+++

> Section 2.2 introduced the rectangle puzzle. Imagine instead a square puzzle with its corners labeled the same way. Such a puzzle would allow a new move
that was not possible with the rectangle puzzle; you could rotate a quarter-turn clockwise.
>
> (a) Make the map of this group.

```{code-cell} ipython3
# !name='2-6-ex-8-square-puzzle-vertical' && ffmpeg -y -framerate 2 -pattern_type glob -i "${name}_*.png" ${name}.gif
```

We'll use 🟥 below for rotating to the right; here's an example cycle:

+++

![x](2-6-ex-8-square-puzzle-right.gif)

+++

We'll use 🟦 for a vertical flip:

+++

![x](2-6-ex-8-square-puzzle-vertical.gif)

+++

We will *not* use a horizontal flip as a generator, although it would be possible:

+++

![x](2-6-ex-8-square-puzzle-horizontal.gif)

+++

We could have also used a left rotation as a generator, or combinations of these moves. The map:

+++

![x](2-6-ex-8-square-puzzle.svg)

+++

See also [Cayley Diagram for $D_4$](https://nathancarter.github.io/group-explorer/CayleyDiagram.html?groupURL=https://nathancarter.github.io/group-explorer/groups/D_4.group) and [Dihedral group](https://en.wikipedia.org/wiki/Dihedral_group).

+++

> (b) Why is the quarter-turn move not "allowed" in the rectangle puzzle?

+++

#### Exercise 2.9 (📑)

+++

> Most groups can be generated many different ways, and each way gives rise to a corresponding way to connect a Cayley diagram with arrows. For example,
consider the group $V_4$, which we met in the rectangle puzzle. Let's shorten the names of its actions to $n$, $h$, $v$ and $b$, meaning (respectively) no action, horizontal flip, vertical flip, and both (a horizontal flip followed by a vertical flip).
>
> We saw that $h$ and $v$ together generate $V_4$. But it is also true that $h$ and $b$ together would generate $V_4$, or $v$ and $b$ together. (You can verify these facts by exploring the rectangle realm using these generators on your own numbered rectangle.)
>
> (a) Make a copy of Figure 2.9 and add to it a new type of arrow, representing the action b.

+++

> (b) Make a copy of your answer to part (a), with the arrows representing $h$ removed. How does your diagram show that $v$ and $b$ are sufficient to generate $V_4$?

+++

> (c) Make a copy of your answer to part (a), with the arrows representing $v$ removed. How does your diagram show that $h$ and $b$ are sufficient to generate $V_4$?

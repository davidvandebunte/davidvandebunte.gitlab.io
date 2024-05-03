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

# 1.5 Exercises

+++

## 1.5.1 Satisfying the rules

+++

### Exercise 1.1 (📑)

+++

> Place a penny and a nickel side by side on a table or desk. Consider just one action, the action of swapping the places of the two coins. Is this a group? (Check each of the four rules to see if they are true for this situation. Explain your conclusion.)

+++

- Rule 1.5: There is one action in the predefined list of rules (or in slightly different terms, one generator of two actions).
- Rule 1.6: The single action is its own reverse.
- Rule 1.7: Yes, we can be 100% confident of what will happen with every action or series of actions.
- Rule 1.8: Yes, e.g. performing the action twice will bring the system back to its initial state.

+++

The author's solution:

+++

> It is a group, as follows.
> - Rule 1.5 is satisfied because the problem specified a predefined list of actions that contained just one action.
> - Rule 1.6 is satisfied because swapping two things back is the same as swapping them in the first place.
> - Rule 1.7 is satisfied because swapping two things has a very predictable outcome.
> - Rule 1.8 is satisfied because any sequence of swaps is possible; swapping the two coins 100 times doesn't prevent you from doing it again, or 100 more times.

+++

### Exercise 1.2

+++

> Consider the same situation as in Exercise 1.1, but add a dime to the right of the other two coins. The only action is still that of swapping the places of the penny and nickel. Is this a group?

+++

Yes, though the number of generators (and actions) is the same. This group is "homomorphic" to the group from Exercise 1.1.

+++

### Exercise 1.3 (📑)

+++

> Exercise 1.3. Imagine that you have five marbles in your left pocket. Consider two actions, moving a marble from your left pocket into your right pocket and moving a marble from your right pocket into your left pocket. Is this a group?

+++

No, because the list of possible actions changes when you run out of marbles in one pocket (you can no longer move marbles out of that pocket).

+++

> It is not a group. Rule 1.8 is not satisfied; you cannot chain together any sequence of moves you like. If you try to move marbles from your left pocket to your right pocket twenty times in a row, you will find that it is not possible.

+++

### Exercise 1.4

+++

> Three walls in your bedroom hold pieces of art, one hung on each wall. You are rearranging them to see which arrangement best suits your taste. You cannot use the fourth wall, because it has a window.
>
> (a) Count the number of ways there are to rearrange the pictures, as long as only one is hung on each wall.

+++

All the permutations of `ABC` or $3! = 6$. Specifically `ABC`, `ACB`, `BAC`, `BCA`, `CAB`, and `CBA`.

+++

> (b) Consider two actions: You may swap the art on the left wall with the art on the center wall, and you may swap the art on the center wall with the art on the right wall. Can these two actions alone generate all of the configurations you counted?

+++

Yes, because e.g. you can move a picture on the left wall to any other position using these two actions (including get it back on the left wall).

+++

> (c) Does part (b) describe a group? If not, what rule or rules were broken?

+++

Yes, because:
- Rule 1.5: There's a predefined list of actions (two actions)
- Rule 1.6: Every action is its own reverse
- Rule 1.7: There's no element of chance in this game.
- Rule 1.8: Yes, because e.g. a left swap and a right swap can be combined.

+++

See also [Permutation group](https://en.wikipedia.org/wiki/Permutation_group).

+++

> (d) Now add a new action, moving all art from the right wall to the center wall, even if this causes there to be more than one piece of art there. Is this new situation a group? If not, what rule or rules were broken?

+++

This does not describe a group because the new action doesn't always have a reverse. Once you've collected more than piece of art on a wall, you can't break them up again.

+++

## 1.5.2 Consequences of the rules

+++

### Exercise 1.5 (📑)

+++

> Does Rule 1.8 imply that every group must contain infinitely many actions? Explain your reasoning carefully.

+++

As long as there's one generator you can compose it with itself an infinite number of times to produce an unlimited number of "actions" but we don't necessarily consider these actions distinct. If you e.g. switch the two coins in the example 1 or 3 times, you will get what we will consider the same action.

+++

The author's solution:

+++

> No, it does not, as we can clearly see by the fact that we have encountered several finite groups already! But more to the point, although Rule 1.8 requires that any combination of actions be an action, it does not require that it be a new action. For the group in Exercise 1.1, for instance, there are infinitely many action sequences we could list: "swap the coins once", "swap the coins twice", "swap the coins three times", etc., but that long, infinite list really only contains two different things. Swapping the coins once produces the same result as swapping them three times, so we do not consider them different actions in the group. Swapping the coins twice or four times has the same result as not swapping them at all.

+++

### Exercise 1.6

+++

> For each of Exercises 1.1 through 1.4 that actually described a group, determine exactly how many actions there are in that group. That is, do not count only the generators, but all possible actions obtainable using Rule 1.8.

+++

- Exercise 1.1: Identity and swap (2)
- Exercise 1.2: Identity and swap (2)
- Exercise 1.3: Not a group
- Exercise 1.4: Call the generators `a` and `b` (for swapping on the left, and swapping on the right). The action `ab` (first `a`, then `b`) is a distinct action, as well as `ba`. The action `aa` is a distinct action (identity), but `bb` is equivalent to it. The last distinct action is `bab` (for a total of 6).

+++

Feeling confident there are only 6 possible actions for Exercise 1.4 is possible because we listed the six possible configurations above: `ABC`, `ACB`, `BAC`, `BCA`, `CAB`, and `CBA`. Any other action must map the system's state to one of these six states and therefore must be equivalent to one of these other actions.

+++

In general, however, this is a hard problem. See [Word problem for groups](https://en.wikipedia.org/wiki/Word_problem_for_groups).

+++

### Exercise 1.7 (📑)

+++

> Consider again the situation from Exercise 1.1.
> (a) Only one action was given. By Rule 1.8, performing this action twice in a row is also a valid action. Describe it.

+++

This is the identity action, bringing you back to your starting state.

+++

> (b) Will every group have an action like this? Explain your reasoning carefully.

+++

Yes, because every action is reversible. Therefore the composition of any action and its reverse will be an identity action.

+++

The author's solution:

+++

> (a) Swapping the coins twice in a row is equivalent to the action "doing nothing" \
> (b) Every group will have such an action, because every action is reversible, and thus any action can be combined with its reversal to produce an action that does nothing.

+++

### Exercise 1.8

+++

> For each of the following requirements (a) through (e), devise a group that meets that requirement. (Groups always satisfy Rules 1.5 through 1.8; the requirements below are additional ones just for this exercise.) If some groups you've already encountered fit these requirements, you may feel free to reuse them.
>
> (a) The order in which actions are performed impacts the outcome.

+++

Exercise 1.4(b)

+++

> (b) The order in which actions are performed does not impact the outcome.

+++

Exercise 1.1

+++

> (c) There are exactly three actions.

+++

Rotating a triangle in one direction (see [Cyclic group](https://en.wikipedia.org/wiki/Cyclic_group)).

+++

> (d) There are exactly four actions.

+++

Rotating a square in one direction.

+++

> (e) There are infinitely many actions.

+++

Rotating a circle in one direction (see also [Circle group](https://en.wikipedia.org/wiki/Circle_group)). Or, the integers over addition.

+++

### Exercise 1.9

+++

> Can you devise a plan for creating a group with any given number of actions? (I do not mean a plan for creating a group with a specified number of generators, but rather a specified number of actions, once Rule 1.8 has been applied.)

+++

For a group with $n$ actions, rotating an $n$-gon (a regular polygon with $n$ sides) in one direction. That is, the cyclic group of order $n$.

+++

## 1.5.3 Breaking the rules

+++

### Exercise 1.10 (📑)

+++

> Devise a situation that satisfies all of the four rules except Rule 1.6.

+++

The number of items on a stack, where the generator is adding another item to the stack. In general, think of a [Monoid](https://en.wikipedia.org/wiki/Monoid). We could take Example 1.4(d) here, as well (moving all art to a center wall).

+++

The author's solution:

+++

> Many answers are valid here; this one is an example. Consider the list of actions containing only one thing, this action: Light a match and let it burn out. Assuming we're doing this with reliable matches in a controlled environment, the result is predictable. Assuming matches will continue to be manufactured indefinitely, you can do as many of this action in a row as you like. But it's definitely not reversible.

+++

### Exercise 1.11

+++

> Devise a situation that satisfies all of the four rules except Rule 1.7.

+++

The face shown by a coin, with two generators: (1) manually flipping the coin to get the opposite face or (2) randomly flipping the coin to get some random new face.

+++

### Exercise 1.12 (📑)

+++

> Devise a situation that satisfies all of the four rules except Rule 1.8.

+++

The example above of moving a finite set of coins between your left and right pant pockets (Exercise 1.3).

You could also simply make a rule that says consecutive actions are not allowed (disallow composition). The only action allowed is "move forward" which you can always do. You can move from:
- A to B
- B to C
- C to D
- D to A

You can also do all of these in reverse. But you can't directly move from A to C unless you take two actions.

+++

The author's solution:

+++

> Many answers are valid here; one example is the situation described in Exercise 1.3.

+++

## 1.5.4 Groups of numbers

+++

### Exercise 1.13

+++

> Pick any whole number and consider this set of actions: adding any whole number to the one you chose. This is an infinite set of actions; we might name them things like "add 1" and "add 17." Is it a group? If so, how small a set of generators can you find?

+++

Yes, with the single generator "add 1" (which has an implied reverse action "add -1").

Exercise 2.6 says this should have a single generator; you don't need to count "add -1" as a separate generator. That is, every generator (of a group) has an implied reverse action that you get for "free" as part of claiming it. From [Generating set of a group](https://en.wikipedia.org/wiki/Generating_set_of_a_group) (emphasis added):

> In [abstract algebra](https://en.wikipedia.org/wiki/Abstract_algebra "Abstract algebra"), a **generating set of a group** is a [subset](https://en.wikipedia.org/wiki/Subset "Subset") of the group set such that every element of the [group](https://en.wikipedia.org/wiki/Group_(mathematics) "Group (mathematics)") can be expressed as a combination (under the group operation) of finitely many elements of the subset *and their [inverses](https://en.wikipedia.org/wiki/Inverse_element "Inverse element")*.

+++

### Exercise 1.14

+++

> (a) What would be the answer to the previous exercise if we allowed only even numbers?

+++

Yes, with "add 2" as the single generator.

+++

> (b) What would be the answer to the previous exercise if we allowed only whole numbers from 0 to 10?

+++

No, because the list of actions can change (you can't "add 1" at the state of 10). Said another way, the group is not closed.

+++

> (c) What would be the answer to the previous exercise if we allowed all whole numbers, but changed the set of actions to multiplying by any whole number? (I do not ask you to consider those actions as generators, but as the complete set of actions.)

+++

No, because not every action is reversible (there's no division).

+++

> (d) What would be the answer to the previous exercise if we allowed only the numbers 1 and 1, and just two actions, multiplying by either 1 or -1?

+++

Yes, with the single generator of multiplying by -1 (its own reverse).

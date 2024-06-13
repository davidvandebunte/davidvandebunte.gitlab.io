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

# 7.6 Exercises

+++

## 7.6.1 Direct products

+++

### Exercise 7.1

+++

> How many elements are in each of the following groups?
>
> (a) C₂ × C₆

12

> (b) S₃ × A₅

15

> (c) C₃⁵, which means C₃ × C₃ × C₃ × C₃ × C₃

3⁵ = 243

+++

### Exercise 7.2

+++

> (a) Consider two Cayley diagrams, one for the group A with two arrow types (indicating two generators) and one for the group B with just one arrow type. How many arrow types will be in the Cayley diagram for A × B, constructed by Definition 7.1?

3

> (b) What is the answer if the diagram for A has n arrow types and the diagram for B has m?

n*m

+++

### Exercise 7.3 (📑)

+++

> For each of the following statements, determine if it is true or false.
>
> (a) If A and B are any two groups, then |A × B| = |A|*|B|.

True

> (b) The group C₃ × C₄ has the same elements as the group C₄ × C₃.

The names may be different, but the two groups are isomorphic.

> (c) The group A × B is abelian, for any groups A and B.

False

> (d) The group C₂ × C₂ has the same structure as the group C₄.

False

> (e) If A and B are any two groups, then A ⊲ A × B.

True

> (f) The group Dₙ has the same structure as the group C₂ × Cₙ.

False

+++

### Exercise 7.4 (📑)

+++

> (a) Create a Cayley diagram for C₄ × C₄, which can be called C₄², "cee four squared."

+++

![x](07-6-ex-04-a.svg)

+++

> (b) Create a Cayley diagram for C₃ × C₃ × C₃, which can be called C₃³, cee three cubed.

+++

![x](07-6-ex-04-b.svg)

+++

> (c) Create a Cayley diagram for C₂ × C₂ × C₂ × C₂, which can be called C₂⁴, cee two to the fourth.

+++

![x](07-6-ex-04-c.svg)

+++

> (d) Are C₄² and C₂⁴ the same?

No

+++

### Exercise 7.5

+++

> (a) Describe the construction of C₅ × C₁. To what is it isomorphic?

Start with C₅ and duplicate C₁ into every node. It is isomorphic to C₅.

> (b) Describe the construction of C₁ × C₅. To what is it isomorphic?

Start with C₁ and duplicate C₅ into every node (just one). It is isomorphic to C₅.

> (c) What can you say about C₁ × G and G × C₁ in general?

It will be equal C₁.

+++

### Exercise 7.6

+++

> If |A| = n and |B| = m, then what is |A × B|?

n*m

+++

### Exercise 7.7

+++

> Although all parts of this question can be answered after only having read Section 7.1, parts (b) and (c) are easier if you have also read Section 7.3.
>
> (a) Use direct product notation to describe the group depicted by the following Cayley diagram (shown from two different angles, to clarify its structure).
>
> ![x](07-6-ex-07-a-ques.svg)

+++

C₂ × C₃ × C₂

+++

> (b) The group C₁₀ is a direct product. What are its factors?

C₂ × C₅

> (c) Is the group depicted by the following Cayley diagram a direct product group? Justify your answer.
>
> ![x](07-6-ex-07-c-ques.svg)

No, it looks like C₄ × C₄ but notice the reversed blue arrows in the 2nd and 4th rows. If you take a quotient by the red C₄ arrows you'll see the blue arrows do not connect corresponding elements of the red C₄ cosets.

+++

### Exercise 7.8 (📑)

+++

> (a) If A and B are abelian, is A × B?

Yes

> (b) Justify your answer to (a) visually. If you answered yes, give evidence by explaining why the direct product process for two abelian Cayley diagrams must produce an abelian Cayley diagram. If you answered no, give Cayley diagrams for abelian groups A and B and the corresponding non-abelian group A × B.

See Figure 5.8; we want to argue this pattern will be produced across the entire diagram constructed via a direct product from two diagrams that already follow this pattern. When you perform a direct product you connect the corresponding nodes in the right factor (B) based on the arrows in the left factor (A).

Starting from some node $i$, a new arrow $〈a〉$ introduced by A will lead to some corresponding node $i'$ within a second copy of B. If you also follow the $j$ arrow from $i$ in the first copy of B to $ij$ you would have found it ran in "parallel" to the $j$ arrow from $i'$ to $i'j'$ in the copy of B. The arrow that must exist from node $ij$ via the new arrow $〈a〉$ to $i'j'$ completes the abelian pattern (see also Figure 7.14).

> (c) Justify your answer to (a) algebraically (either by reference to the groups' binary operations or their multiplication tables).

We want to show that in general $(a₁,b₁)*(a₂,b₂) = (a₂,b₂)*(a₁,b₁)$. Similar to section 7.1.4:

$$
(a₁,b₁)*(a₂,b₂) = (a₁*a₂,b₁*b₂) = (a₂*a₁,b₂*b₁) = (a₂,b₂)*(a₁,b₁)
$$

> (d) If A is non-abelian, what can you conclude about A × B?

It's not abelian.

> (e) Justify your answer to (d) visually (by reference to Cayley diagrams).

See Figure 5.8; we want to argue this pattern will not be followed somewhere in the diagram produced by the direct product operation. It will not be followed in any of the cosets of A in a A × B.

> (f) Justify your answer to (d) algebraically (either by reference to the groups' binary operations or their multiplication tables).

In terms of multiplication tables, the non-abelian nature of A will lead to a non-symmetric multiplication table because of asymmetry in the first of the two elements of the 2-tuple.

+++

### Exercise 7.9 (📑, ⚠)

+++

> A Cayley diagram for Q₄ appears in Exercise 4.4.
>
> (a) Reorganize the diagram to show the subgroup ⟨i⟩ and its left cosets. Is ⟨i⟩ a normal subgroup of Q₄?

+++

![x](07-6-ex-09-a.svg)

+++

The subgroup $⟨i⟩$ is $\{1, i, -1, -i\}$. The only left coset is $j⟨i⟩$ is $\{j, k, -j, -k\}$. The right coset $⟨i⟩j$ is $\{j, -k, -j, k\}$, the same, so this is a normal subgroup.

+++

> (b) Let's determine whether Q₄ is a direct product of ⟨i⟩ with some other subgroup A < Q₄. What size must A be?

Either two or four (based on Langrange's Theorem).

> (c) Based on part (b), what are the possibilities for A?

Only C₄. Both C₂ and V₄ are the right sizes but are not subgroups.

> (d) Is Q₄ a direct product ⟨i⟩ × A for some A? If so, what is A? If not, why not?

It's not a direct product for any A. If you take the quotient you can see it's a semidirect product; corresponding elements are not lined up with the blue arrows.

+++

### Exercise 7.10

+++

> Explain succinctly why A₄ is not a direct product ⟨x⟩ × A, ⟨y⟩ × A, or ⟨z⟩ × A for any group A.

All of ⟨x⟩, ⟨y⟩, and ⟨z⟩ are subgroups of order 2, and because |C × A| = |C|*|A| we know that the order of A must be 6. We also know that both C and A are subgroups (actually normal subgroups) of C × A. Because we know from Exercise 6.31 that there are no order 6 subgroups of A₄, we can say that none of ⟨x⟩ × A, ⟨y⟩ × A, or ⟨z⟩ × A can be valid direct products.

+++

### Exercise 7.11

+++

> Come up with a way to take any positive whole number n and create a group whose Cayley diagram requires at least n arrow types.

Take a direct product between n copies of C₂.

+++

### Exercise 7.12

+++

> Prove that A ⊲ A × B and B ⊲ A × B. You may find the equations on page 128 useful for an algebraic argument, or Figure 7.14 for a visual one.

+++

Assume we can generate all of A from one generator (it is a cyclic group). If so, we only need to show $⟨a⟩g = g⟨a⟩$ (i.e. $Hg = gH$) for all $g$ actions in $A×B$. If the elements of $A × B$ have the form $(a,b)$ this amounts to showing $⟨(a,e)⟩(a,b) = (a,b)⟨(a,e)⟩$, which is easy to show based on algebra similar to that on page 128. To be completely clear (see also [Normal subgroup](https://en.wikipedia.org/wiki/Normal_subgroup)), we must have that $(a_n,e)(a,b) = (a,b)(a_n,e)$ for all $(a,b) ∈ G$ and $a_n ∈ A$ where $a_n$ is a power of $a$.

To show $A ⊲ A × B$ for a non-cyclic group $A$, we need to consider more generators. Call the A generators $⟨a₀, a₁, ...⟩$. We can say $⟨(aₙ,e)⟩(e,bₙ) = (e,bₙ)⟨(aₙ,e)⟩$ for every generator $aₙ$ in $A$ based on logic similar to that of page 128, making this subgroup normal. That is, we did not need to assume a cyclic group (it's just an easier place to start).

+++

### Exercise 7.13

+++

> Draw a representative portion of the infinite Cayley diagram for the group Z₂.

+++

![x](07-6-ex-13.svg)

+++

## 7.6.2 Semidirect products

+++

### Exercise 7.14 (📑)

+++

> (a) Create and diagram the rewiring group for C₅.

+++

![x](07-6-ex-14-a.svg)

+++

> (b) Create and diagram the rewiring group for C₇.

+++

![x](07-6-ex-14-b.svg)

+++

> (c) What conjecture would you make about rewiring groups for Cₚ, when p is prime?

The rewiring group is of order p - 1, with the (p - 1) / 2 rotation providing a cyclic group covering the whole rewiring group (not just a subgroup).

+++

> (d) What is the rewiring group of S₃?

+++

![x](07-6-ex-14-d.svg)

+++

### Exercise 7.15 (📑)

+++

> (a) What is the semidirect product of C₄ with its rewiring group?

What is C₄'s rewiring group? We can reverse the arrows to get one other option, but you can't use r² to get another option in the group. That is, (r r²) (r³) (r⁴) produces a subgroup (isomorphic to C₂) rather than the whole group.

So the rewiring group is C₂:

+++

![x](07-6-ex-15-a.svg)

+++

The semidirect product of C₄ with this group (C₄ ⋊ C₂) is D₄.

+++

> (b) What is the semidirect product of C₆ with its rewiring group?

What is C₆'s rewiring group? You can reverse the arrows, but both r² and r³ will produce a subgroup. So the semidirect product is similar to above, but D₆ this time.

+++

> (c) Do you suspect that the semidirect product of C₅ with its rewiring group will follow the pattern suggested by parts (a) and (b)? Why or why not?

It won't follow, because C₅ has a more interesting rewiring group as covered in Exercise 7.15.

+++

> (d) Draw a Cayley diagram of the semidirect product of C₅ with its rewiring group.

With only 2/5 of the blue arrows, to keep the drawing readable:

+++

![x](07-6-ex-15-d.svg)

+++

> (e) Think about and then describe (without necessarily drawing it) the Cayley diagram for the semidirect product of C₇ with its rewiring group.

Similar to the above, but seven layers deep and with seven nodes in each layer.

+++

### Exercise 7.16 (📑)

+++

> What is the rewiring group of Z?

+++

![x](07-6-ex-16-a.svg)

+++

> Compute the corresponding semidirect product group.

+++

![x](07-6-ex-16-b.svg)

+++

## 7.6.3 Quotients

+++

### Exercise 7.17

+++

> Consider the quotient taken in Figure 7.23.
> (a) What is the subgroup by which the quotient is taken? Where in the figure can you see that subgroup?

V₄, repeated three times.

> (b) What is the order of that subgroup? How does the figure show that order?

Four, in each of the cosets.

> (c) What is the index of that same subgroup? How does the figure show that index?

Three, shown as the three groups of four.

> (d) Does A₄ have any subgroups of order 3? How does the figure show you such a subgroup, or show you that there are not any?

Yes, the blue arrows are a generator of a subgroup of order 3.

> (e) Can A₄ be divided by any of its other subgroups?

Per Exercise 6.31, there are no subgroups of order 6 to divide by. We've already divided by the subgroup of order 4. We can't divide by the group of order 3 as shown in Figure 7.26. A similar operation with a subgroup of order 2 fails:

+++

![x](07-6-ex-17.svg)

+++

Said another way, the order 2 subgroup is not normal (notice the left and right cosets aH and Ha are not equal, at least one vote against).

+++

### Exercise 7.18 (⚠)

+++

> For each of the following H and G (with H < G), attempt the quotient process from Definition 7.5. If it succeeds, show a diagram like Figure 7.20 and state the name of the quotient group. If the quotient operation reveals a direct or semidirect product structure, say which it is and name the factors. If the quotient operation fails, show a diagram like Figure 7.26.
>
> (a) G = C₄, H = ⟨2⟩

+++

![x](07-6-ex-18-a.svg)

+++

Left  cosets: ⟨2⟩, 1⟨2⟩ \
Right cosets: ⟨2⟩, ⟨2⟩1 \
Semidirect product \
Quotient group: C₂

+++

> (b) G = V₄ with generators named a and b, H = ⟨a⟩

+++

![x](07-6-ex-18-b.svg)

+++

Left  cosets: ⟨a⟩, b⟨a⟩ \
Right cosets: ⟨a⟩, ⟨a⟩b \
Direct product \
Quotient group: C₂

+++

> (c) G = C₁₀, H = ⟨2⟩

+++

![x](07-6-ex-18-c.svg)

+++

Left  cosets: ⟨a⟩, b⟨a⟩ \
Right cosets: ⟨a⟩, ⟨a⟩b \
Direct product \
Quotient group: C₂

+++

> (d) G = D₄, H = ⟨r²⟩

+++

![x](07-6-ex-18-d.svg)

+++

See Exercise 5.40 for a visual D₄. \
Left  cosets: ⟨r²⟩, r⟨r²⟩, f⟨r²⟩, fr⟨r²⟩ \
Right cosets: ⟨r²⟩, ⟨r²⟩r, ⟨r²⟩f, ⟨r²⟩fr \
Semidirect product \
Quotient group: V₄

+++

> (e) G = D₄, H = ⟨f⟩

+++

![x](07-6-ex-18-e.svg)

+++

See Exercise 5.40 for a visual D₄.

Left  cosets: \
⟨f⟩ \
r⟨f⟩ = {r, rf} \
r²⟨f⟩ = {r², fr²} \
fr⟨f⟩ = {fr, r³}

Right cosets: \
⟨f⟩ \
⟨f⟩r = {fr, r} \
⟨f⟩r² = {fr², r²} \
⟨f⟩r³ = {rf, r³}

Quotient operation failed.

+++

> (f) The group G shown in the Cayley diagram below, with H standing for the two-element subgroup generated by the green arrow.

+++

![x](07-6-ex-18-f-1.svg)

+++

View from the top (or bottom); quotient operation failed:

+++

![x](07-6-ex-18-f-2.svg)

+++

> (g) The group G shown in the same Cayley diagram (above), but this time with H standing for the two-element subgroup generated by the blue arrow.

+++

![x](07-6-ex-18-g-1.svg)

+++

View from the front (or back); quotient operation failed:

+++

![x](07-6-ex-18-g-2.svg)

+++

> (h) The group G shown in the Cayley diagram below (sometimes called G₄,₄), with H standing for the two-element subgroup generated by the red arrow

+++

![x](07-6-ex-18-h-1.svg)

+++

![x](07-6-ex-18-h-2.svg)

+++

Semidirect product \
Quotient group: D₄

+++

### Exercise 7.19

+++

> In any group G, the relationships G ⊲ G and {e} ⊲ G are true (where e stands for the identity element).
>
> (a) What is G/G?

{e}

> (b) What is G/{e}?

G

+++

### Exercise 7.20

+++

> (a) Develop a quotient procedure for multiplication tables. (Hint: You learned last chapter how to expose subgroups and their cosets.) Your procedure should succeed just when the subgroup by which you divide is normal. In that case, the result should be a multiplication table for the quotient group. Take care with how you name the elements in that table.

+++

The first step in the multiplication table quotient procedure is to organize the table's columns (and rows) by the subgroup and its left cosets; this is already done in the two multiplication tables in part (b).

After this organization, the subgroup and its left cosets should be listed underneath the subgroup in the first column of sub-tables (cells). Draw boxes around these cells and number the boxes from 1 to n (where n is the index of subgroup in the group).

Look for the same cells in the first row of sub-tables (cells) of the multiplication table; these are the right cosets of the subgroup. If the same sub-tables are not present, the subgroup is not normal and the quotient operation fails.

If the same sub-tables exist in the first row of sub-tables, number them just as you labeled the first column of sub-tables. Proceed to number the rest of the table using the indices established for the first column.

Collapse the sub-tables into a multiplication table (using the assigned sub-tables indices) to reveal the quotient group.

+++

> (b) Test your procedure on the following two multiplication tables. The left table is a multiplication table for S₃ organized by the normal subgroup ⟨r⟩. The right table is the same table, but organized by the non-normal subgroup ⟨f⟩.
>
> ![x](07-6-ex-20-ques.svg)

+++

Let's take the quotient of S₃ by the subgroup H = ⟨r⟩, using the table on the left above:

+++

![x](07-6-ex-20-1.svg)

+++

The quotient group is C₂:

+++

![x](07-6-ex-20-2.svg)

+++

The same approach with the table on the right fails:

+++

![x](07-6-ex-20-3.svg)

+++

> (c) Choose one of the groups from Exercise 7.18, create a multiplication table for it, and apply your technique to one of its subgroups. Was the subgroup normal? If so, what was the quotient group?

+++

We'll just suggest the answer to part (a), which will also result in $C_2$ given above:

+++

![x](07-6-ex-20-b.svg)

+++

> (d) Write your technique down carefully and clearly, using some of your work from this exercise as examples to illustrate your explanation.

+++

See above; it's not clear how this question is asking us to expand on that answer.

+++

### Exercise 7.21 (📑)

+++

> Explain why every subgroup of an abelian group is normal.

For a subgroup to be normal, all left cosets must equal the corresponding right coset. That is, for all g in G:

$$
gH = Hg
$$

Because the group is abelian, we know that for any H:

$$
gH = g\{e, h₁, h₂, ..\} = \{ge, gh₁, gh₂, ..\} = \{eg, h₁g, h₂g, ..\} = \{e, h₁, h₂, ..\}g = Hg
$$

+++

### Exercise 7.22

+++

> Is every quotient of an abelian group also abelian? Explain why. (Your answer to Exercise 7.20 may help.)

Yes; if the multiplication table was symmetric before it will remain so after the quotient operation.

+++

### Exercise 7.23

+++

> (a) Prove that if H < G and [G : H] = 2, then H ⊲ G.

If [G : H] = 2 then H only has one left coset, which must contain all elements in G that are not in H. By the same logic, there must be one right coset with all elements in G that are not in H; therefore the right and left cosets must be the same (containing all elements not in H).

> (b) What will be G/H in this case? Justify your answer.

C₂, because there is only one group of order 2.

> (c) What relationship does [G: H] have with |G/H| in general?

If $G/H$ exists, then $|G/H|$ should equal $[G: H]$ because $[G: H] = |G|/|H|$ and the quotient operation collapses $|H|$ elements into 1 in every coset.

+++

### Exercise 7.24

+++

> Recall the group ℚ (under addition) and the group ℚ* (under multiplication) introduced in Exercise 4.33.
>
> (a) Describe the quotient group ℚ/⟨1⟩

All the rational numbers greater than or equal to zero and less than one. The identity element is zero. The operation is addition module one.

We're dividing an infinite size group by an infinite size group to get an infinite size group. See also [Infinite set](https://en.wikipedia.org/wiki/Infinite_set) for thoughts on different infinities.

> (b) Describe the quotient group ℚ*/⟨-1⟩

All the rational numbers greater than zero. The identity element is one. The operation is still multiplication.

+++

## 7.6.4 Normalizers

+++

### Exercise 7.25 (📑)

+++

> Compute the normalizer of H in G for each of the following cases. None of these requires drawing; all are possible by thinking (and perhaps using your mind's eye).
>
> (a) G = C₉, H = ⟨3⟩

C₉

> (b) G is any group and H = G

G

> (c) G is any group and H = {e}

G

> (d) G = Dₙ and H = ⟨r⟩

Dₙ

+++

### Exercise 7.26

+++

> Illustrate the normalizer of H in G in each of the following cases, as Figure 7.29 did for ⟨f⟩ < D₆.
>
> (a) G = D₃, H = ⟨f⟩

+++

![x](07-6-ex-26-a.svg)

+++

> (b) G = D₄, H = ⟨f⟩

+++

![x](07-6-ex-26-b.svg)

+++

> (c) G = D₄, H = ⟨f, r²⟩

+++

![x](07-6-ex-26-c.svg)

+++

> (d) G = D₅, H = ⟨f⟩

+++

![x](07-6-ex-26-d.svg)

+++

### Exercise 7.27

+++

> From what you observed as you did Exercise 7.26, can you say for which $n$ the normalizer $N_{D_n}(〈f〉)$ is not equal to $〈f〉$?

+++

When $n$ is odd.

+++

## 7.6.5 Conjugacy

+++

### Exercise 7.28

+++

> What is the result of conjugating an element by itself?

The element, because g(g)g⁻¹ = g. That is, every element is conjugate with itself.

+++

### Exercise 7.29

+++

> Show that all of an element's conjugates have the same order as the element.

The order of an element $h$ is the smallest possible integer $m$ such that $hᵐ = e$. The order of any conjugate $ghg⁻¹$ is the smallest possible integer m such that $(ghg⁻¹)ᵐ = e$. We can simplify this second equation to:

$$
(ghg⁻¹)ᵐ = (ghg⁻¹)(ghg⁻¹)(ghg⁻¹) ... = ghᵐg⁻¹ = e
$$

Premultiplying by g⁻¹ and postmultiplying by g:

$$
\begin{align}
ghᵐg⁻¹ &= e \\
hᵐ &= g⁻¹eg \\
hᵐ &= e
\end{align}
$$

So for both h and all its conjugates, the order of the element is the smallest possible integer $m$ such that $hᵐ = e$.

+++

### Exercise 7.30

+++

### Exercise 7.31

+++

### Exercise 7.32

+++

### Exercise 7.33 (📑)

+++

### Exercise 7.34

+++

### Exercise 7.35

+++

### Exercise 7.36

+++

### Exercise 7.37 (⚠)

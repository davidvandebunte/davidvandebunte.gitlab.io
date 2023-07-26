# Improve SSC

Perhaps greater and less than is so important to humans because we often think in terms of gravity. Consider saying above and below or “as high as” rather than the other language when you’re stuck. To think in terms of preorders rather than linear orders is then to think in another dimension - left and right - as well. Two things can be the same height but not be “comparable” because they are at different places across left and right. It seems like it all comes back to our 3-dimensional thinking. Are meets the way to “go down” and joins the way to “go up” in this view? If you “want” to go up, do you use the join (i.e. addition or the logical or). In Cost, is this why we have to reverse the order? Why is I < in the definition of a V-cat?

Does even forming a sentence require thinking ahead (creating an action graph)? You sometimes write the first few words of a sentence while half-thinking, and then need to erase it when you realize what you actually want to say. You often try to consider all the possible responses someone could give to a text before you write it; the more you plan ahead the more likely you’ll be able to get them to respond in a way that’s OK with you. In some sense, talking is publishing.

You often want to redo old questions rather than checking the answer. Why? Do you want to confirm you remember all the dependencies that led to the result? If you wanted to rederive every result, then you wouldn’t be reading books written by others (essentially taking their answers). You also wouldn’t maintain any notes; you’d prefer to rederive the results from scratch regularly. The point of writing down the answer was for you to be able to refer to it later, and if you never refer to it the effort you put into writing down the answer was mostly wasted (at least with respect to you).

To some extent you've even memorized the numbers associated with definitions are part of reading this book (e.g. Definition 2.46). You've also likely memorized the location of results on pages. The location of results on pages is why many books always start chapters on only odd-numbered pages (so results stay on the same side of the page through minor edits of other chapters). Hence, you really don't need to publish what you've changed back to the source.

You can read commutative diagrams like geographic maps, where the map simply repeats itself in many places. Think through one example of where the commutative diagram would apply, and you'll likely understand the pattern.


## Replace references with web links

Your references are broken anyways, so why not replace them with web links? That's what you'd prefer anyways. It'd also make your PDF better than the original, in your opinion, and so useful to others (worth sharing).


## Boxes in boxes

A drawing of "boxes in boxes" could look quite different from the side.

If you think of this as a presentation of a category then is this dependent types? A set of a certain size.

![x](boxes-in-boxes.svg)


## Filters as graphs

Is there a "filter framework" in the public domain? It doesn't seem so, but see:
- [Filter graph - Wikipedia](https://en.wikipedia.org/wiki/Filter_graph)
- [Filter (software) - Wikipedia](https://en.wikipedia.org/wiki/Filter_(software))

Can you see Unix filters as defining a DAG, where the functions are the commands and the arrows in between are sets? That is, files are "sets" of lines and the filter runs on all lines in the set. The boxes are labeled with unix commands. We use "tee" to get two arrows from one output.


## Document how to visually take product orders

Add to [Product order](https://en.wikipedia.org/wiki/Product_order). You had to learn the hard way how to do this for non-total orders: see `pip-feasibility-relation.svg` for the start of how you learned to do it visually.


## Monotone maps

Consider parallel arrows, two perspectives on the same thing. What metrics are you tracking in your model? Is there a monotone map between them? For example, from F1 to an ILE. Is there a monotone map from the loss to the metrics you are measuring and care about?

The functor from your measure of a module's performance to your overall performance should ideally be monotonic. If it isn't, you won't be able to check module-level performance and be confident that it will correspond to system-level performance. If not then you have at least a non-ideal compression, a compression that is not just lossy but lossy but in the wrong way. Said another way, a compression can be "wrong" if it doesn't measure what you are interested in achieving at the next level up.

This is similar to how, when you need to start improving software, you should start by running it at the highest level that's reasonable (or better, one level above what you need to improve/change). You'll be much more immune to getting bogged down in details if you understand the big picture. If you do this, then you'll understand to what degree your module-level performance is a monotonic map to overall performance (what confidence you can have in the map).

If you don't preserve at the module-level the aspects of the problem you care about (at the most basic, preserving order), then you may have trouble (depends to what degree the map is not order-preserving).

Can you try to bite off too much before attempting to make changes? That is, start to make changes in a highly complex network when all you understand is how to run e.g. training (e.g. an object detector). No, generally speaking, but that assumes that others haven't already tried to optimize the settings you are tweaking. Said another way, if all you have is "hyperparameters" (settings you don't understand) then you and everyone else will be equally capable of checking performance (assuming your computer resources are the same). You can see humans as computers to get more done, too.

Consider breaking down your single arrow into two or more arrows in series. This corresponds to trying to gain more insight into a model through either measuring an intermediate, or reading the code for intermediates and writing tests around them.

Consider the implications of this for new developers, as well. Ideally we start them at the highest level we consider and they work down to some specific task. If that will take too much time, though, we need to give them some specific task within the larger network, and they will need to trust the optimization task they've been given has value at the next level up.


## Start with evaluations

Should you start with improving metrics in many nets? If you don't have the feature you're measuring in the loss then any achievements you gain may be temporary if the model changes in other ways (no monotone map from the loss to our metrics). But, it’s good to start with a test before adding the training feature so we know what difference we’re making if we were to include it. Once you have the test, then you can work on fixing the map incrementally.

You can also start by measuring something someone else didn't and then argue it's more important than the aspects they had optimized for (e.g. because of changing requirements).


## What is sound and complete?

To understand these terms, you're likely going to need to understand some logic (i.e. calculus). Propositional calculus is the simplest; see [Propositional calculus - Soundness and completeness of the rules](https://en.wikipedia.org/wiki/Propositional_calculus#Soundness_and_completeness_of_the_rules) to prove these properties on it. As mentioned in [Soundness](https://en.wikipedia.org/wiki/Soundness), it seems likely this completeness here is not the same as in [Gödel's incompleteness theorems](https://en.wikipedia.org/wiki/G%C3%B6del%27s_incompleteness_theorems).

![x](ssc/math-vs-logic.svg)


## Commutative diagrams

Consider the original commutative diagram, what you think of when you think of the [Commutative property](https://en.wikipedia.org/wiki/Commutative_property):

![x](commutative-square-cat-of-sets.svg)

We assume this expresses something along the lines of $ab = ba$. But is $ab$ the 2 top-right arrows, though, or the 2 bottom-left arrows?

It depends on whether you put ⨟ or ∘ in the middle of $ab$. If you put ⨟ in the middle, then $ab$ is the top-right arrows. That is, this depends on your convention for composition.

When you posed the question, you implicitly meant × (multiplication); you could have easily meant + (addition) as well. In both cases, you assume a symmetric/commutative operator and so confuse yourself about which is which. You need to go back and forget that these operators are commutative; only then can you ask if they are commutative. If you do that then you would replace the operator ×/+ by e.g. · (as in [Monoid](https://en.wikipedia.org/wiki/Monoid)) or something else that doesn't imply commutativity to you.

It's likely that · is a poor choice most of the time, however, because it does imply commutativity to many people (just as concatenation did when you posed this question). It also doesn't provide any sense of direction (only that $ab \neq ba$) if you want to also interpret the operator as a composition operator. You could come up with your own convention, but that could easily lead to confusion. In Visual Group Theory (page 85) the author confusingly defines f·g and f∘g to both equal f⨟g; this is confusing because Wikipedia's convention is now that f∘g is the opposite of f⨟g (so f⨟g = g∘f).

Said another way, you "know" that $a⨟b \neq b⨟a$ and $a∘b \neq b∘a$. The · operator is more ambiguous and so you have to check the context.


## Arrow categories

![x](ssc/simplex-arrow-category.svg)


## Compression and preservation

Notice the language of models and morphisms between them in [Strict 2-category - Doctrines](https://en.wikipedia.org/wiki/Strict_2-category#Doctrines). You should often see morphisms as data, as in higher category theory. This is strangely similar to your "improve improve" documents as well; you treat a "process" as data and construct a second process (an "improve" process) to transform it. You can call of these processes, n-cells, or n-morphisms (the word doesn't matter).

As discussed in Chp. 1, most of our models are compressions of the natural world. In our brains we maintain causal compressions of the much more complicated computing engine that is nature. In computers we maintain causal compressions of the models in our brain. We expect a CNN to preserve at least some features of our visual cortex:

![x](cnn-as-lossy-compression.svg)

This compression is always lossy, but can we choose which losses to take? What do you know about your model in nature? That's what you want to preserve in your mental/computer models.

What *can* we preserve now? We discussed preserving joins and meets in Chp. 1, which seems like something you'd want to preserve in almost any model compression. It also seems quite natural to want to preserve composition, as we discussed in Chp. 3 around functors (e.g. preserving order with monotonic functions).

A [Linear map](https://en.wikipedia.org/wiki/Linear_map) preserves vectors addition and scalar multiplication.

In image processing, see other examples of preservation in [machine learning - What is translation invariance in computer vision and convolutional neural network? - Cross Validated](https://stats.stackexchange.com/questions/208936/what-is-translation-invariance-in-computer-vision-and-convolutional-neural-netwo). In e.g. topdown lidar imagery someone might be interested in rotational equivariance.

### Classification

Draw (1.5) mapped to the bools. This whole example could be seen as a classification task. For classification, we typically want translation invariance: moving an object in an image should not change the image's classification.

### Object detection

For object detection we typically want translation equivariance; see [Equivariant map](https://en.wikipedia.org/wiki/Equivariant_map). Said another way, this preserves the operation of symmetry transformations. Recognize that a model is different with different inputs applied to it; these are not the same and we can identify at least part of the map between them:

![x](ssc-preserve-translation-equivariance.svg)

### Adding software complexity

When we add new code to existing software, we often want to maintain all our previous features. Sometimes this is as simple as adding an if statement and handling new cases, directly adding more code paths. That map between the old and new software is obvious in this case, but what if that's not enough? Consider adding an FPN, or converting a single-frame model to multiple frames.

To refactor means to maintain the same behavior while changing the code to support new features. Version control tracks your refactoring. Every commit is a map from the old software to some new version that is "better" in some way, which typically means not losing features. It's critical to have this history when some feature is lost (a bug/defect, specifically a regression). A regression is always associated with some commit, a map between the old and new software. You can't test everything; these maps are critical to understanding what happened when something breaks.

Smaller commits makes verification that these maps are as expected easier. That is, incremental changes may *seem* to be a slower path to your goal, but it's often the case that doubling the size of a step is more than twice as expensive as two smaller steps to verify (for other developers, and oneself). We can also run into working memory limitations if we make our steps too large.


## Composition of relations and matrix multiplication

How are these related? You're familiar with both, but it seems like they sometimes express nearly the same thing. See:

- https://en.wikipedia.org/wiki/Composition_of_relations#Composition_in_terms_of_matrices
- https://en.wikipedia.org/wiki/Binary_relation#Matrix_representation

A simple example with 2×2 matrices that shows a connection to the notation of quantales:
- https://twistedelephants.wordpress.com/2012/05/13/relation-composition-as-matrix-multiplication/

The connection to categories:
- https://math.stackexchange.com/questions/4548276/why-do-the-composition-of-relations-and-the-matrix-product-look-so-alike


## Section 4.5.2


*Exercise* 4.65.

In the paragraph above this question, the author is defining **1** to have a single object 1. Every morphism in a $\mathcal{V}$-category must be also be assigned an element in $\mathcal{V}$, so he also assigns to the single morphism (the identity morphism on 1) the object *I*.

A 𝓥-profunctor $\rho_\mathcal{X}: \mathcal{X} × \textbf{1} ⇸ \mathcal{X}$ is a 𝓥-functor $\rho_\mathcal{X}: (\mathcal{X} × \textbf{1})ᵒᵖ × \mathcal{X} → \mathcal{V}$. Because $\mathcal{X}$ is enriched in $\mathcal{V}$, we know that $\mathcal{X}({x,y})$ is an object of $\mathcal{V}$. Let's define $\rho_\mathcal{X}(x,1,x') := \mathcal{X}(x,x')$ (an isomorphism as required).

Similarly, a 𝓥-profunctor $\lambda_\mathcal{X}: \textbf{1} × \mathcal{X} ⇸ \mathcal{X}$ is a 𝓥-functor $\lambda_\mathcal{X}: (\textbf{1} × \mathcal{X})ᵒᵖ × \mathcal{X} → \mathcal{V}$ defined $\lambda_\mathcal{X}(1,x,x') := \mathcal{X}(x,x')$.


*Exercise* 4.66.

How does this selection of a dual make sense in terms of $\textbf{Prof}_\textbf{Bool}$? What does the categorical product $\mathcal{X}^{op} × \mathcal{X}$ look like?

Every object in $\textbf{Prof}_V$ should have a dual. Writing the relevant morphisms as $\mathcal{V}$-profunctor:

$$
\rho_\mathcal{X}: \mathcal{X} × \textbf{1} ⇸ \mathcal{X} \\
\lambda_\mathcal{X}: \textbf{1} × \mathcal{X} ⇸ \mathcal{X} \\
\rho^{-1}_\mathcal{X}: \mathcal{X} ⇸ \mathcal{X} × \textbf{1} \\
η_\mathcal{X}: \textbf{1} ↛ \mathcal{X}^{op} × \mathcal{X} \\
ε_\mathcal{X}: \mathcal{X} × \mathcal{X}^{op} ↛ \textbf{1} \\
\mathcal{X} × η_\mathcal{X}: (\mathcal{X} ↛ \mathcal{X}) × (\textbf{1} ↛ \mathcal{X}^{op} × \mathcal{X}) =
\mathcal{X} × \textbf{1} ↛ \mathcal{X} × (\mathcal{X}^{op} × \mathcal{X}) \\
$$

Writing the relevant morphisms as $\mathcal{V}$-functor:


## Algebraic structures

See:

- [Outline of algebraic structures](https://en.wikipedia.org/wiki/Outline_of_algebraic_structures)
- [Algebraic structure](https://en.wikipedia.org/wiki/Algebraic_structure)
- [Concrete category](https://en.wikipedia.org/wiki/Concrete_category)
- [Template:Algebraic structures](https://en.wikipedia.org/wiki/Template:Algebraic_structures)

Here's an example to anchor off of (could update to [File:magma to group.svg](https://commons.wikimedia.org/wiki/File:Algebraic_structures_-_magma_to_group.svg) as well):

![x](https://upload.wikimedia.org/wikipedia/commons/3/3f/Magma_to_group4.svg)

In [Algebra [cats]](https://typelevel.org/cats/algebra.html) and [Outline of algebraic structures](https://en.wikipedia.org/wiki/Outline_of_algebraic_structures) the same information that this preorder ([File:Magma to group4.svg](https://commons.wikimedia.org/wiki/File:Magma_to_group4.svg)) expresses is provided in a table. Still, the colors of the arrows are helpful to indicate what structure is being added. That is, a typical preorder only has booleans (an arrow or not) between elements, while this colored drawing allows for 3 (and in general more) properties to be quickly recalled.

You could see the nodes/objects as categories and the arrows as coming from a set of algebraic features. That is, this presents the category of small categories enriched in certain algebraic features. You could add an arrow for commutative (selected yellow below) and add a [Commutative monoid](https://en.wikipedia.org/wiki/Monoid#Commutative_monoid) to the drawing. This is definitely collecting butterflies; you should also consider which structures are important or common.

In this context a colored arrow means *adds* some structure specific to the color. For example, in [File:Magma to group4.svg](https://commons.wikimedia.org/wiki/File:Magma_to_group4.svg) a Monoid with invertibility is a Group. Follow the arrows in reverse for an "is a" relationship followed by "with"; e.g. a Group is a Semigroup with invertibility and identity.

It's no mistake that this drawing is of a partial order with 8 elements. We could construct it by taking the product of 3 two-element partial orders, with each two-element partial order representing the addition of some property/adjective (a checkbox in the table representations).


### Structure, space, or algebra?

Although all these words show up regularly in the study of algebraic structures, they are essentially synonyms in the sense that they are all "structures" in the sense of being a set or sets with an operation or operations defined on them (the article [Mathematical structure](https://en.wikipedia.org/wiki/Mathematical_structure) limits the definition of structure to being defined on only one set). Don't be bothered by the inconsistency in language that often occurs. We'll use AS for [Algebraic structure](https://en.wikipedia.org/wiki/Algebraic_structure) in the following, since it's becoming the anchor word.

See also [Structure (mathematical logic)](https://en.wikipedia.org/wiki/Structure_(mathematical_logic)).


#### Space vs AS

Why do we have all these nearly equivalent words? The terms "space" and "structure" exist alongside each other primarily for historical reasons; see [Space (mathematics)](https://en.wikipedia.org/wiki/Space_(mathematics)). In practice this means you'll see the term "space" more often when a discussion turns to geometric rather than algebraic concerns. We are straddling this line in [Vector (mathematics and physics)](https://en.wikipedia.org/wiki/Vector_(mathematics_and_physics)) with the quote:

> A vector space formed by geometric vectors is called a Euclidean vector space, and a vector space formed by tuples is called a coordinate vector space.

You'll see the same Euclidean/coordinate (i.e. space/structure) language explained in [Real coordinate space](https://en.wikipedia.org/wiki/Real_coordinate_space).

Similarly, the article [Group action](https://en.wikipedia.org/wiki/Group_action) feels the need to awkwardly state "space or structure" early on and often switches between the words.


#### Algebra vs AS

The article [Commutative ring](https://en.wikipedia.org/wiki/Commutative_ring) states that commutative algebra is about the study of commutative rings, which are typically described as algebraic structures (not algebras). This is because the term "algebra" without an article refers to a "field of study" in mathematics; see [Algebra](https://en.wikipedia.org/wiki/Algebra) (notice this article is written in 162 languages). That is, the term "algebra" in this context is useful to avoid the verbose "field of study" or "broad part of mathematics" someone would otherwise need to use. Why not use the word "math" though? As in "linear math" (linear algebra) or "abstract math" (abstract algebra)? Most likely, only to sound fancy.

This language gets especially confusing in cases like the following from [Algebra](https://en.wikipedia.org/wiki/Algebra):

> Sometimes, the same phrase is used for a subarea and its main algebraic structures; for example, [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra) and a [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra_(structure)).

With an [Article (grammar)](https://en.wikipedia.org/wiki/Article_(grammar)), an [Algebra over a field](https://en.wikipedia.org/wiki/Algebra_over_a_field) is simply an example of an algebraic structure. These are the most "structured" or complicated algebraic structures because they stack on top of vector spaces even more operations. The fact that an [Algebra over a field](https://en.wikipedia.org/wiki/Algebra_over_a_field) is the starting point on Wikipedia is a bit unfortunate because it seems like most examples easily generalize to an [Algebra over a ring](https://en.wikipedia.org/wiki/Algebra_over_a_field#Generalization:_algebra_over_a_ring) (e.g. [Associative algebra](https://en.wikipedia.org/wiki/Associative_algebra)).

Why do we often use the letter $K$ for a field rather than $F$? One possibility (or at least a mnemonic) is that the "c" in "vector" sounds like K, and a "vector" space is defined over a field. The (historical) language of "algebra over a field" may be related to this: the concept of an "algebra over a field" is an extension of a vector space, which seems to often be conflated with the concept of a field. We could read this as an "algebra over a vector space" instead, and it's likely most people would understand what was meant (though this is even more verbose).


### Two binary operations

These are the algebraic structures with "One binary operation on one set"; can you do the same for structures with two operations? Starting with the same colors as [File:Magma to group4.svg](https://commons.wikimedia.org/wiki/File:Magma_to_group4.svg) (RGB), but with dark colors for multiplication (×) and light colors for addition (+). We'll expand on the operations in [Algebra [cats]](https://typelevel.org/cats/algebra.html).

The corresponding category is marked to the bottom left of some defintions, where you'll find the rules for preserving structure between different examples (in the definition of the homomorphism). The arrows between these categories indicate "full subcategory" rather than the addition of some property/constraint/structure.

Start with the smallest possible examples (2-3) in every case (e.g. ℤ/4ℤ), so that you can potentially provide drawings. Also as part of avoiding infinite. You should strive to provide non-trivial examples, though, which makes this harder than simply providing the smallest possible example.

If you take "is a" to mean "has inside it all examples" then you'd get a bunch of examples of everything by just going up the "is a" chain. It's a "subset of" relationship as well.

When you link to an example, link to the longest possible explanation of the example you can find (not just where you originally found it).

Prefer the term "Noncommutative ring" to be more specific, since in some contexts "Ring" may imply a commutative ring. Prefer the term "Semiring" to "Rig" only because the former is more common and consistently used on Wikipedia; it's also much easier to quickly search for ("rig" is a part of many words, requiring whole word search). But see [semiring in nLab](https://ncatlab.org/nlab/show/semiring) and [rig in nLab](https://ncatlab.org/nlab/show/rig).

We "generalize" when we go from thinking about specific examples in a category to thinking in terms of the category (what structure all the examples have in common), and we "generalize" when we remove property/constraints/structure (following arrows in the reverse direction).

Notice you've already started on the "One set with no binary operations" diagram in Exercise 5.10, with FinSet, FinRel, etc.

Said another way, the "is a" relationship can hold because one object has more constraints (more structure) on it than something it is an instance of (Y "is a" X because all examples of Y have more structure than all examples of X). The "is a" relationship can also hold because Y is simply an example of X (not thinking of the potential many examples of Y and X). We could think more deeply and put boxes in boxes; but between the examples in separate boxes there is presumably no relationship (no morphisms) unless you go up to a common level and use the morphisms at that level. That is, use e.g. prop functors, monoidal functors, or functors to preserve what structure the two objects do share.


### Properties of categories

Consider the following diagram, now one level "up" in the sense of thinking about properties/constraints/structure you can add to categories. But is it part of **Cat** if it includes **Cat**?

It could be drawn similar to the algebraic diagrams above. In both cases we are adding something with all of our arrows, whether we are assigning new properties or assigning arguments (calling constructors, so to speak). In the first case we add a property to all examples in a set/class ("modify" the set/class relative to its previous definition); in the second case we add a property to only an element ("modify" the element relative to its previous definition).

This drawing assumes some categories (e.g. **Rel**) are only defined as monoidal categories in one way. In fact, there are often multiple ways to define a category as monoidal (different options for the monoidal product). It should include what monoidal product is being used in its examples.

The link https://en.wikipedia.org/wiki/Compact_category redirects to Autonomous category. Which term do you prefer? With rigid, it seems there are three now:
- https://math.stackexchange.com/questions/4548276
- https://ncatlab.org/nlab/show/rigid+monoidal+category

This diagram started as a list of common [Enriched category](https://en.wikipedia.org/wiki/Enriched_category).


### All examples

Be careful with the word "example" (which shows up all over these notes). Is a collection of examples an example of something? If you're using the word analogously to "element" in a set, then you're going to run into Russell's paradox if you consider a collection of examples as an example in some other collection of examples.

Instead, invent words to create collections of collections of examples. Call them sets, categories, collections, [Class (set theory)](https://en.wikipedia.org/wiki/Class_(set_theory)), [Conglomerate (mathematics)](https://en.wikipedia.org/wiki/Conglomerate_(mathematics)), etc. until you're sick of coming up with words. Or start using 0-category, 1-category, 2-category, etc. as in [n-category](https://ncatlab.org/nlab/show/n-category). From that page:

> Especially as n increases, there is a plethora of different definitions of n-categories, some differing in generality others different-looking but secretly equivalent. A (woefully incomplete) list is given below, with pointers to dedicated entries. Part of the subject of higher category theory is to understand, organize, systematize and, last not least, apply these definitions. (It is the “n” in “n-category” that gives the nLab its name.)

However, the definitions do seem to agree that a [0-category](https://ncatlab.org/nlab/show/0-category) is a set, and a 1-category is a regular category.

In SVG you should link boxes to the word you want to be using for the collection (boxes can be linked, just like text). You could even provide a separate TOC, and color boxes (perhaps shades of gray) for the word that should be used with them.

It seems like the word "collection" is the most informal and therefore a good default (for unlinked boxes). See:
- [elementary set theory - What are the differences between class, set, family, and collection?](https://math.stackexchange.com/questions/172966/what-are-the-differences-between-class-set-family-and-collection)

Perhaps a "collection" is something that must be constructed one-by-one, not defined via properties. That is, the word "example" may be appropriate for a collection. Of course, what makes an example belong to your collection? If you don't have a rule, you could put anything into it. In some sense this is what gray boxes are; there's only a notion that these belong together.

See [Is there a category of categories?](https://math.stackexchange.com/questions/750731/is-there-a-category-of-categories). You could draw a large CAT box around your whole drawing, but it probably wouldn't be helpful. Similarly you could draw a large [Algebraic structure](https://en.wikipedia.org/wiki/Algebraic_structure) box arond a large section of these notes, because this term is again rather general.


### Managing definitions

Working through this exercise, it's clear that there are so many definitions you're going to struggle to get them all on one diagram. As discussed in [Ring (mathematics)](https://en.wikipedia.org/wiki/Ring_(mathematics)), many authors define a ring differently depending on the context. And why not? These definitions (like any structure) should only be evaluated relative to your objectives.

Even if you *wanted* to define global terms, the terms are going to get incredibly long as you add more and more adjectives. You'll need more and more adjectives (or alternatively, to invent new words) only because your namespace is going to fill (requiring rework of your drawing, as well). It's critical to delete/archive code for the same reason. Still, you need a large vocabulary to be able to interpret as much as possible (as long as you're given context). Your notes are your own vocabulary; you may need to invent new words (or make longer words) in them so you can actually pull together logic that was previously in different contexts.

For example, prefer the term "Noncommutative ring" internally to be more specific, though this will usually correspond to the unadorned "Ring" when you encounter that term.


### Major connections

![x](major-connections.svg)


### Other

Consider finding the same in a programming language as well; see:
- https://typelevel.org/cats/typeclasses.html#type-classes-in-cats
- [discopy/discopy: Architecture](https://github.com/discopy/discopy#architecture)

Perhaps you still need your own in your own notes, to include e.g. [Quantale](https://en.wikipedia.org/wiki/Quantale)? In your own notes you want to see what you've understood in the past so you can think about what might be easy to construct from what you already know. In general, this is true for most drawings (you only include on them what you understand).

How do you use categorical logic in Python? Much may need to be custom; see [Computational Category Theory in Python I: Dictionaries for FinSet | Hey There Buddo!](https://www.philipzucker.com/computational-category-theory-in-python-i-dictionaries-for-finset/). However, this mentions the promising [Welcome to Hypothesis! — Hypothesis 6.71.0 documentation](https://hypothesis.readthedocs.io/en/latest/). See also [Computational Category Theory in Python III: Monoids, Groups, and Preorders | Hey There Buddo!](https://www.philipzucker.com/computational-category-theory-in-python-3-monoids-groups-and-preorders/).


# 6.2 Colimits and connection


## 6.2.1 Initial objects


### *Exercise* 6.3

1. The relation with zero morphisms (besides the identity morphisms).
2. A relation with one extra morphism (either from a → b or b → a).
3. The preorder relation with both a → b and b → a.


### *Exercise* 6.6

Example `1.` has a single initial object a, because there's still an identity morphism on a in the free category.

Example `2.` has a single initial object a, because the free category (unlike a preorder) has a morphism for every path. That is, there's a morphism from a to c that isn't explicitly shown.

Example `3.` has no initial object because no object has a morphism to every other object.

Example `4.` has no initial object because a has many morphisms to it from itself.


### Define structure-preserving

A major motivation of category theory (going back to section 1.1) is "structure" preservation. The term is used all over [Morphism](https://en.wikipedia.org/wiki/Morphism#Examples). We've gained intuition for what "structure" is through many examples, but is there a more concrete definition? The short answer is no; what it means to preserve structure completely depends on the context. The word "structure" may have more specific meanings in specific contexts (see [stuff, structure, property in nLab](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property)), but in the context of what it means to be a morphism (i.e. something that is structure-preserving) this can mean many things.

One kind of example is given in [Morphism § Examples](https://en.wikipedia.org/wiki/Morphism#Examples) under:

> - In the category of small categories, the morphisms are functors.
> - In a functor category, the morphisms are natural transformations.

In Definition 5.11 (and in Rough Definition 6.68) we'll see examples of functors that actually preserve more than what plain functors do. These are structure-preserving maps (morphisms) as well, in some category similar to **Cat** (where plain functors are the morphisms).

These examples are for "strict" categories, as defined in [Higher category theory](https://en.wikipedia.org/wiki/Higher_category_theory). There are many more possible definitions of structure-preserving in this domain. From [n-category](https://ncatlab.org/nlab/show/n-category):

> Especially as n increases, there is a plethora of different definitions of n-categories, some differing in generality others different-looking but secretly equivalent. A (woefully incomplete) list is given below, with pointers to dedicated entries. Part of the subject of higher category theory is to understand, organize, systematize and, last not least, apply these definitions. (It is the “n” in “n-category” that gives the nLab its name.)

The term "morphism" was also apparently originally used in category theory as an abstraction of the notion of homomorphism, apparently in order to advance the field of topology. This creates examples of morphisms of almost a completely different kind:

> - In the category of topological spaces, the morphisms are the continuous functions and isomorphisms are called homeomorphisms. There are bijections (that is, isomorphisms of sets) that are not homeomorphisms.
> - In the category of smooth manifolds, the morphisms are the smooth functions and isomorphisms are called diffeomorphisms.

Part of the problem in defining what it means to preserve "structure" is that we may not agree on what structure is important to preserve. Every structure-preserving function ("map") must forget some structure; we wouldn't call it a map if it was nothing but an identity (nothing changed). This disagreement about what is important to preserve leads to a wide variety of definitions.

It may be best to completely avoid the word "structure" and rather say what structure you are preserving. Don't say structure-preserving, for example, when you mean identity-preserving. The latter is just as many letters and is more specific.

It's interesting that the word "morphism" now means structure preserving, when the prefix that would indicate it should be structure preserving (in Greek) has been taken away. For example, [Isomorphism](https://en.wikipedia.org/wiki/Isomorphism) means "equal" form (equal "structure" or shape). [Homomorphism](https://en.wikipedia.org/wiki/Homomorphism) means "same" form though this is due to a mistranslation; it should have been "similar" form (and you should think of it that way).

Can we see structure-preserving morphisms as preserving context? Since what it means to be structure-preserving is so variable, this may be acceptable. A morphism, functor, homemorphism, homomorphism, etc. help you keep what you already knew from one context and use it in another context (either duplicating your knowledge base to reduce or edit it, or building it up without duplication).


### Define morphism

If you could think of a small category as a partial magma with identity and an associative partial function, then a functor might preserve this structure, without having to think about all the structure that is presumably preserved in the morphisms (which could be of any kind). A morphism is a bit more than this, though, because a morphism must also be defined whenever composition is possible (when the target of one morphism matches the source of another). It's in this sense that we say a functor is composition-preserving; because (in the language of Definition 3.6) a "composite" morphism must be defined in a category for every two morphisms that can compose. Said another way, we cannot use just any associative partial function.


### Why functors?

It can be easy to read the definition of a functor without thinking about why they are defined the way they are. From [Functor § Properties](https://en.wikipedia.org/wiki/Functor#Properties)

> Two important consequences of the functor axioms are:
>
> - F transforms each commutative diagram in C into a commutative diagram in D;
> - if f is an isomorphism in C, then F(f) is an isomorphism in D.

So if in one category you have that g ∘ f = h, as in (from [Morphism](https://en.wikipedia.org/wiki/Morphism)):

![x](https://upload.wikimedia.org/wikipedia/commons/e/ef/Commutative_diagram_for_morphism.svg)

Then a functor will ensure this commutative diagram is also a commutative diagram in the second category. In this drawing from [Functor](https://en.wikipedia.org/wiki/Functor#Properties), you can see the previous commutative diagram on the bottom and top:

![x](https://upload.wikimedia.org/wikipedia/commons/b/b3/Commutative_diagram_of_a_functor.svg)

As discussed above, what makes a morphism a morphism is that the "composite" morphisms exist. That is, the commutative triangle given above is what defines a morphism in the context of a category. You can see the same drawing in [Category (mathematics)](https://en.wikipedia.org/wiki/Category_(mathematics)):

![x](https://upload.wikimedia.org/wikipedia/commons/f/ff/Category_SVG.svg)

See a slightly more involved but similar definition in [functor](https://ncatlab.org/nlab/show/functor).

The second property is also significant:

> - if f is an isomorphism in C, then F(f) is an isomorphism in D.

Let's say you had the following category:

![x](ssc/why-functors-1.svg)

Define a function (an attempt at an endofunctor) that maps every object and morphism to itself, except that it switches the morphisms $id_B$ and $h$ (notice this disrespects identity-preservation because $F(id_B) = h ≠ id_{F(B)} = id_B$). While we still have a commutative diagram corresponding to $g⨟f = id_B$ (namely $g⨟f = h$) we failed to preserve the isomorphism.

It may be more appropriate to call functors commutative-diagram-preserving and isomorphism-preserving, rather than composition-preserving and identity-preserving. The former more likely describes what someone wants from them, while the latter more likely only describes the mechanics.

For a slightly more complicated example of failing to preserve the identity (in the case of only one object), see [Monoid § Monoid homomorphisms](https://en.wikipedia.org/wiki/Monoid#Monoid_homomorphisms).


### Define stuff, structure, properties


The article [stuff, structure, property in nLab](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property#more_examples) provides a tempting definition of "structure" that could potentially free this word from its expected ambiguity (perhaps all three of these things are examples of "structure"). In the context of Exercise 6.7, this could help make it easier to guess what from Definition 5.36 (of a rig) we need to maintain. Which of the items in this list are stuff, structure, and properties? If remembering properties implies we also remember stuff, then perhaps we only need to worry about some these items and get the others to follow along. For example, see [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism). That article concludes at the start that because a group homomorphism preserves the group operator it must also preserve identities and inverses. Similarly, see the start of [Ring homomorphism](https://en.wikipedia.org/wiki/Ring_homomorphism).

This simple relationship is also implied by the comment:

> It is worth noting that this formalism captures the intuition of how “stuff”, “structure”, and “properties” are expected to be related:
>
>    - stuff may be equipped with structure;
>    - structure may have (be equipped with) properties.

See also this quote from [stuff, structure, property § More examples](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property#more_examples):

> The embedding of abelian groups into all groups, F: Ab → Grp is faithful and full, but not essentially surjective.

Unfortunately, it's not that simple. The language of [k-surjective functor](https://ncatlab.org/nlab/show/k-surjective+functor) at first seems to imply that with increasing k more "structure" is preserved. In fact, different values of k and combinations of k imply different kinds of "structure" (meaning stuff, structure, properties) is forgotten. See:

![x](ssc/functor-types.svg)

The author often presents algebraic structures as tuples, as in Exercise 6.7. For the homomorphism to preserve structure, it must preserve all the structure in the tuple. However, there can also be "structure" *between* the elements of these tuples, such as (in Exercise 6.7) the distributive property. In other cases the author seems to have an understanding of stuff, structure, properties as he lists them separately (e.g. Definition 3.6, Definition 3.35).

One way to see the stuff, structure, properties breakdown is in terms of a finite presentation of a category. If you see a category as a database (Chp. 3) then this is more obvious based on inspecting the type theory example [structure § GroupDataStructure](https://ncatlab.org/nlab/show/structure#GroupDataStructure). The properties correspond to the equations at the bottom of the diagram, the structure to the morphisms in the category, and the stuff to the objects in the category. Rather than a finite number of equations, there are equations that apply globally. For example, in the definition of [Property (mathematics)](https://en.wikipedia.org/wiki/Property_(mathematics)), we say that it must apply across all examples. Similarly, for a commutative diagram to "commute" means it applies in all cases. A [Universal property](https://en.wikipedia.org/wiki/Universal_property) extends a "traditional property" in being also true of an associated morphism (rather than just an object).

Another reason that this logic doesn't apply to Exercise 6.7 is that a homomorphism is not a functor. Both are examples of morphisms (are "structure" preserving in at least some sense) but a homomorphism is only preserving of *some* kind of structure on top of a set, and a functor is identity and composition preserving. It is true that rig homomorphisms happen to form a category (see [Rig](https://ncatlab.org/nlab/show/Rig)), but an endofunctor on that category would need to apply to every rig (not be defined between rigs). A rig does have some internal compositional structure to preserve, however, on its two monoids.

See also the much more detailed original paper on this topic, which explains e.g. why all these functors can be seen as surjective (and why an "injective" function across sets can even be seen as surjective). In particular, [section 2.4, p. 15](http://arxiv.org/PS_cache/math/pdf/0608/0608420v2.pdf#page=15) and [section 3.1, p. 17](http://arxiv.org/PS_cache/math/pdf/0608/0608420v2.pdf#page=17). The stuff/structure/property conversation comes up in more detail in [Forgetful functor](https://en.wikipedia.org/wiki/Forgetful_functor), relating it to logic.

An outstanding issue is the following statement from [full functor](https://ncatlab.org/nlab/show/full+functor):

> For ordinary functors this may sound odd, because there is no real sense in which “full” modifies “faithful.”


*Exercise* 6.7

Consider part `1.`. Recall Definition 5.36 alongside this tuple. The sets $R$ and $S$ have no structure to preserve. To preserve the structure of the other elements of a rig, we will at least need the two rules the author provided:

1) $f(0_R) = 0_S$
2) $f(r_1 +_R r_2) = f(r_1) +_S f(r_2)$

We'll also at least need the following rule for the multiplication monoid:

3) $f(1_R) = 1_S$
4) $f(r_1 *_R r_2) = f(r_1) *_S f(r_2)$

The last bullet point in Definition 5.36 implies we should preserve the absorbing element zero ($f(0_R) = 0_S$) but this is already satisfied by condition `1.` above.

Do we also need to preserve commutativity of the addition monoid? I'd guess no; why? We can see the combination of `1.` and `2.` above as a functor, because a monoid with one element is effectively a category with a single object. By preserving the monoid operation we effectively preserve composition, because all commutative triangles in a monoid flatten into a linear chain. Any functor will end up being an equivalence of categories because the functor is only defined from one object to one object. The commutative property is a "property" in the language of [stuff, structure, property](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property), and therefore should be preserved by an equivalence of categories (which "forgets nothing" where nothing means none of stuff, structure, properties).

What does it mean to preserve the distributive property given in part (c) of Definition 5.36? If it's a property, it seems like it would be the same situation, so we'll assume it will be preserved without more rules.

Note that [Ring homomorphism](https://en.wikipedia.org/wiki/Ring_homomorphism) only requires {`2.`, `3.`, `4.`} and takes `1.` as a consequence; it's likely the proof/derivation uses negative elements. For a definition that only requires {`1.`, `2.`, `4.`}, see [Ring Homomorphism - from Wolfram MathWorld](https://mathworld.wolfram.com/RingHomomorphism.html).


For part `2.` can we use a one-element set? See [Field with one element](https://en.wikipedia.org/wiki/Field_with_one_element); at least for a field this isn't a well-defined concept. However, why can't the multiplicative identity equal the [Additive identity](https://en.wikipedia.org/wiki/Additive_identity)? See [Additive identity § Properties](https://en.wikipedia.org/wiki/Additive_identity#Properties); there's no hard reason this isn't possible for a ring. In fact, this is known as the [Zero ring](https://en.wikipedia.org/wiki/Zero_ring).

However, the zero ring cannot serve as an initial object in **Rig** because we can still preserve structure and map the one element in this structure to either the additive or multiplicative identity in many other rigs (such as e.g. the natural numbers). That makes two morphisms (homomorphisms) from the zero ring to the natural numbers, when an initial object must only have one.

Having both a multiplicative and additive element implies (via the distributive property) that some other element 1+1 must exist, and via mathematical induction this implies we must have at least the natural numbers in an initial object. Are the natural numbers an initial object in **Rig**? There is exactly one morphism from them to the zero ring (all elements go to zero).

Without reading it, this solution looks long. For likely solutions to this question (check before checking the back of the book), see:
- [Rig in nLab](https://ncatlab.org/nlab/show/Rig)
- [rig in nLab](https://ncatlab.org/nlab/show/rig)


### Interpretations of zero

The symbol 0 gets used in higher mathematics for much more than the number zero; see [Zero element](https://en.wikipedia.org/wiki/Zero_element). In part (d) of Definition 5.36 (a dependency of Exercise 6.7) it's specifically identified as an absorbing element, besides being the additive identity. Since we're in a section on initial objects, and have already learned about terminal objects, it may be worth looking at the concept of a [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)) (which is both initial and terminal).

All over the article [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space), the word "trivial" is used almost as a synonym for zero object. At the start:

> This article is about trivial or zero algebraic structures.

The article [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects) redefines "zero object" but links to [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space) and specifically mentions:

> This is the origin of the term "zero object".

In [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects), the symbol 0 is often used for initial objects (though the author uses ∅). It's likely this is because 0 serves as the additive identity and so seems natural alongside the symbol + often used for the coproduct. The symbol 1 is similarly often used for terminal objects because it is the identity with respect to the categorical product. The article also mentions:

> Cat, the category of small categories with functors as morphisms has the empty category, 0 (with no objects and no morphisms), as initial object and the terminal category, 1 (with a single object with a single identity morphism), as terminal object.

While it often works to use 0 for an initial object and 1 for a terminal object, this also not a specific approach. It can also be confusing when a category has a "zero" object that is not initial (as in **Ring**/**Rig**, where the zero ring/rig is terminal).


*Exercise* 6.8




### *Exercise* 6.10

Call $!_{c_2}$ the unique morphism from $c_1$ to $c_2$. Call $!_{c_1}$ the unique morphism from $c_2$ to $c_1$. Then both are isomorphisms, because $id_{c_1} = !_{c_2} ⨟ !_{c_1}$ and $id_{c_2} = !_{c_1} ⨟ !_{c_2}$.


## 6.2.2 Coproducts


*Exercise* 6.13




### *Exercise* 6.16

$$
\begin{align}
[f,g](apple1) = a \\
[f,g](banana1) = b \\
[f,g](pear1) = p \\
[f,g](cherry1) = c \\
[f,g](orange1) = o \\
[f,g](apple2) = e \\
[f,g](tomato2) = o \\
[f,g](mango2) = o
\end{align}
$$


*Exercise* 6.17

In Definition 6.11 we said that there is a unique morphism from the coproduct $A+B$ to all objects $T$ and pairs of morphisms $(f: A → T, g: B → T)$. Clearly $A+B$ exists because the category 𝓒 has coproducts, and $C$ can serve as one of these objects $T$ because it has appropriate functions $f$ and $g$. Taking $C$ as the object $T$ in diagram (6.12),  we can conclude that part `1.` and `2.` are true from the fact that the diagram commutes.

For part `3.`, we know that the morphisms $f ⨟ h$ and $g ⨟ h$ and exist by simply composing morphisms, and therefore that $D$ can also serve as a $T$ in the definition and that there is some unique morphism from $A + B$ to $D$ we can call $[f ⨟ h, g ⨟ h]$. But $[f,g] ⨟ h$ also exists by simply composing morphisms, and therefore must equal $[f ⨟ h, g ⨟ h]$.

For part `4.` we know that the morphisms $ɩ_A$ and $ɩ_B$ exist because all coproducts exist, and therefore that $A+B$ can serve as a $T$ in the definition and that there is some unique morphism from $A + B$ to $A + B$ that we can call $[ɩ_A, ɩ_B]$. But $id_{A+B}$ exists by definition of $A+B$ being an object in the category, and therefore must equal $[ɩ_A, ɩ_B]$.


*Exercise* 6.18

For part `1.` is this simply constructing the copairing of the two morphisms?

For part `2.` see the diagram (6.12) and put $∅$ on the right. That makes $ɩ_∅$ a unique morphism, and $g$ a unique morphism. Is the composition $ɩ_∅ ⨟ [f,g]$ also unique? What about the unique morphism across the top of the diagram from $∅$ to $A$?


## 6.2.3 Pushouts

See [Pushout (category theory)](https://en.wikipedia.org/wiki/Pushout_(category_theory)); contrast with [Pullback (category theory)](https://en.wikipedia.org/wiki/Pullback_(category_theory)) (from section 3.5.3).


*Exercise* 6.24




*Exercise* 6.26




*Exercise* 6.28




## 6.2.4 Finite colimits


*Exercise* 6.35


*Exercise* 6.41


## 6.2.5 Cospans


*Exercise* 6.48


*Exercise* 6.49


# 6.3 Hypergraph categories

See [Review "Seven-Sketches suggestions" - Google Docs](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit).

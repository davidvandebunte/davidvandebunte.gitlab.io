# Improve SSC

Perhaps greater and less than is so important to humans because we often think in terms of gravity. Consider saying above and below or “as high as” rather than the other language when you’re stuck. To think in terms of preorders rather than linear orders is then to think in another dimension - left and right - as well. Two things can be the same height but not be “comparable” because they are at different places across left and right. It seems like it all comes back to our 3-dimensional thinking. Are meets the way to “go down” and joins the way to “go up” in this view? If you “want” to go up, do you use the join (i.e. addition or the logical or). In Cost, is this why we have to reverse the order? Why is I < in the definition of a V-cat?

Does even forming a sentence require thinking ahead (creating an action graph)? You sometimes write the first few words of a sentence while half-thinking, and then need to erase it when you realize what you actually want to say. You often try to consider all the possible responses someone could give to a text before you write it; the more you plan ahead the more likely you’ll be able to get them to respond in a way that’s OK with you. In some sense, talking is publishing.

You often want to redo old questions rather than checking the answer. Why? Do you want to confirm you remember all the dependencies that led to the result? If you wanted to rederive every result, then you wouldn’t be reading books written by others (essentially taking their answers). You also wouldn’t maintain any notes; you’d prefer to rederive the results from scratch regularly. The point of writing down the answer was for you to be able to refer to it later, and if you never refer to it the effort you put into writing down the answer was mostly wasted (at least with respect to you).

To some extent you've even memorized the numbers associated with definitions are part of reading this book (e.g. Definition 2.46). You've also likely memorized the location of results on pages. The location of results on pages is why many books always start chapters on only odd-numbered pages (so results stay on the same side of the page through minor edits of other chapters). Hence, you really don't need to publish what you've changed back to the source.

You can read commutative diagrams like geographic maps, where the map simply repeats itself in many places. Think through one example of where the commutative diagram would apply, and you'll likely understand the pattern.


## Replace references with web links

Your references are broken anyways, so why not replace them with web links? That's what you'd prefer anyways. It'd also make your PDF better than the original, in your opinion, and so useful to others (worth sharing).


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

### Classification

Draw (1.5) mapped to the bools. This whole example could be seen as a classification task. For classification, we typically want translation invariance: moving an object in an image should not change the image's classification.

### Object detection

For object detection we typically want translation equivariance; see [Equivariant map](https://en.wikipedia.org/wiki/Equivariant_map). Said another way, this preserves the operation of symmetry transformations. Recognize that a model is different with different inputs applied to it; these are not the same and we can identify at least part of the map between them:

![x](ssc-preserve-translation-equivariance.svg)

### Adding software complexity

When we add new code to existing software, we often want to maintain all our previous features. Sometimes this is as simple as adding an if statement and handling new cases, directly adding more code paths. That map between the old and new software is obvious in this case, but what if that's not enough? Consider adding an FPN, or converting a single-frame model to multiple frames.

To refactor means to maintain the same behavior while changing the code to support new features. Version control tracks your refactoring. Every commit is a map from the old software to some new version that is "better" in some way, which typically means not losing features. It's critical to have this history when some feature is lost (a bug/defect, specifically a regression). A regression is always associated with some commit, a map between the old and new software. You can't test everything; these maps are critical to understanding what happened when something breaks.

Smaller commits makes verification that these maps are as expected easier. That is, incremental changes may *seem* to be a slower path to your goal, but it's often the case that doubling the size of a step is more than twice as expensive as two smaller steps to verify (for other developers, and oneself). We can also run into working memory limitations if we make our steps too large.


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

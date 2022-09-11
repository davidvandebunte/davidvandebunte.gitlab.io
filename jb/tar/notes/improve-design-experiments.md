# Improve design experiments

# TODO-rib: When should you reduce inductive bias?

See:
- [Inductive bias](https://en.wikipedia.org/wiki/Inductive_bias)

# TODO-dr: Should you reduce the dimensionality of your inputs?

Add a reduce-dimensionality.md article.

The model is not the same as the real thing; you almost always simplify the real world to put it
into a model. So it's almost never a question of whether or not to reduce dimensionality, but
whether you can afford to reduce it more (for your particular task).

A greater simplification lets you attend to more at once, at the cost of effectively letting you see
less detail in every item because it's more simplified. For example, a planning git graph has many
tasks that are all drastic simplifications of the full task. Some of the worst aspects of it are
that you can't really rearrange the items in the graph without understand them in enough detail to
understand their dependencies. Still, the graph is useful because it lets you see (attend to) more
at once. Said another way, it provides a useful abstraction.

Similarly, to "load" code into your head by reading it is actually to decompress it into natural
language (increasing dimensionality). You often think of compressing code into natural language,
because documentation is often shorter than the code. The reason this isn't "compression" is that
documentation is also much less complete (detailed) than code. Documentation attends to less, but
can be more detailed because of that. Watch out for code that throws away details, however, in the
sense of throwing away long variable names in exchange for single letter names (or even more so,
when compiling to a binary). Ideally the documentation is in the code so nothing gets lost (avoid
lossy compression), or at the least you retain links to documentation (as e.g. .md files.

Should code have minimal comments so you can avoid conflicts only due to documentation changes? You
should deal with documentation conflicts separately than code conflicts, even if you are dealing
with them in the same commit. If you see natural language as compressing to code, and plain text
code as compressing to binaries, then this is similar to the question of whether to include symbols
in your binaries. Most of the time, you don't need to. In fact, if you allow different people to
have a different understanding of the code (e.g. Bayesian vs. Frequentist, or simply based on
different documentation) then you don't want to include all possible interpretations. What is
"tricky" (needing comments) may be different to different people. See also Linus' thoughts in
[a/lt-debugger](https://lwn.net/2000/0914/a/lt-debugger.php3); you found this link in [Forcing
people to read and understand code instead of using comments, function summaries and debuggers? -
SESE](https://softwareengineering.stackexchange.com/questions/201657).

Said another way, don't use a fork of the code to make comments. Comment on the code through
documentation; your fork should only remove and simplify code. You also like that this lets you fit
more code onto your screen at once (that you've understood). If you do need to make comments inline
to avoid the split-attention effect, then you can move them out of the code once you understand it
and you have your first conflict.

Is a picture worth a thousand words? It depends on the picture, and what kind of task you need to do
with it. Why aren't you asking about the resolution of the image?

Could you use PCA to come up with initial weights to help ease the training of a net? That is,
manually strip out as many variables as you want, use that as the dimensionality of a matrix, and
then let the net learn to tweak the weights of the projection matrix as well.

See:
- [Dimensionality reduction](https://en.wikipedia.org/wiki/Dimensionality_reduction)

Tag search on SE: [Highest scored 'dimensionality-reduction' questions - CV](
https://stats.stackexchange.com/questions/tagged/dimensionality-reduction).

Is multicollinearity really much of a problem as long as you are doing some dimensionality
reduction anyways? See:
- https://en.wikipedia.org/wiki/Dimensionality_reduction#Dimension_reduction

This is related to whether you should ever add a new variable to a model. Does the variable matter?
See also:
- [Latent variable](https://en.wikipedia.org/wiki/Latent_variable)
- [correlation - In supervised learning, why is it bad to have correlated features? - DSSE](
https://datascience.stackexchange.com/questions/24452/)
- [What is dimensionality reduction? Difference between feature selection and extraction? - DSSE](
https://datascience.stackexchange.com/questions/130/)

Once you define this better, replace the link to Wikipedia with your own article in your public
notes (run a git grep to find the link you have now).

What if your input data had redundancies? The neural network can't tell you it is ignoring some of
your inputs. Should you always use PCA or an autoencoder to help remove the unnecessary information?
If it just learns to ignore the data in the first few layers it's not a big deal, though.
[1]: https://stats.stackexchange.com/questions/70899/what-correlation-makes-a-matrix-singular-and-what-are-implications-of-singularit
[2]: https://en.wikipedia.org/wiki/Dimensionality_reduction#Feature_selection

# TODO-rbsap

Commenting on [](./se/relationship-between-svd-and-pca.md).

Why is `flip_signs` necessary? See also [linear algebra - Calculating SVD by hand: resolving sign
ambiguities in the range vectors. - Math SE](https://math.stackexchange.com/questions/1805191/).

See point `4.`. What are loadings?

See point `7.`. Why would anyone want to perform PCA on a correlation matrix rather than a
covariance matrix? Related to [Principal component analysis - Further considerations](
https://en.wikipedia.org/wiki/Principal_component_analysis#Further_considerations).

See also [Highest scored 'linear-algebra' questions - Math SE](
https://math.stackexchange.com/questions/tagged/linear-algebra).

# TODO-mspca

See the first answer to [Making sense of principal component analysis, eigenvectors & eigenvalues -
CV](https://stats.stackexchange.com/a/140579/189415). Missing the [Spectral theorem](
https://en.wikipedia.org/wiki/Spectral_theorem) dependency.

# TODO-ce: Is "cross-entropy" a useful abstraction?

You should write out or add to your own notes in SR2 on this topic. That is, publish an article in
your own words. You like how this article uses Wikipedia images, just like you intend to:
- https://glassboxmedicine.com/2019/12/07/connections-log-likelihood-cross-entropy-kl-divergence-logistic-regression-and-neural-networks/

Closer to understanding the Kullback-Leibler Divergence:
- https://www.countbayesie.com/blog/2017/5/9/kullback-leibler-divergence-explained

Colah's take on information theory:
- https://colah.github.io/posts/2015-09-Visual-Information/

This loss is not strictly required for classification, and actually may be suboptimal:
- [Disadvantages of using a regression loss function in multi-class classification - Cross Validated](
https://stats.stackexchange.com/questions/568238)

However, this loss is still useful for e.g. generative models:
- https://openai.com/blog/generative-models/#moregeneralformulation

This loss can be interpreted in many different ways:
- https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence#Interpretations

See also:
- [Cross entropy](https://en.wikipedia.org/wiki/Cross_entropy)

See also:
- [machine learning - Why do cost functions use the square error? - DSSE](
https://datascience.stackexchange.com/questions/10188/why-do-cost-functions-use-the-square-error)
- [machine learning - Neural networks: which cost function to use? - DSSE](
https://datascience.stackexchange.com/questions/9850/neural-networks-which-cost-function-to-use)
- [machine learning - Cross-entropy loss explanation - DSSE](
https://datascience.stackexchange.com/questions/20296/cross-entropy-loss-explanation)
- [machine learning - The cross-entropy error function in neural networks - DSSE](
https://datascience.stackexchange.com/questions/9302/the-cross-entropy-error-function-in-neural-networks)

See also:
- [intuition - What is perplexity? - Cross Validated](
https://stats.stackexchange.com/questions/10302/what-is-perplexity)
- [Perplexity - Wikipedia](https://en.wikipedia.org/wiki/Perplexity)

# TODO-unsup: Do you prefer unsupervised to supervised learning?

## Estimate value

You're already quite familiar with the latter, at least relatively speaking. Seek novelty.

You drive improvements to signs based on what you discover in unsupervised learning. Why wouldn't
you expect a deep learning model to do the same? If you can detect patterns, you can assume some
kind of structure. If you can assume some kind of structure, you can make a net that is much more
efficient than a completely general learner (or reuse a net you have based on the same common
mathematical structure). In fact, you often see solutions that fit the tools you already know. That
is, you prefer to use dicts and map a lot when you code only because you know them. Similarly,
people have filter bubbles and try to come up with economic solutions that fit the simple models
they already know (e.g. laissez-faire is always better).

It's like detecting patterns is the first step in the scientific process; it's how you establish
i.e. come up with educated guesses or working hypotheses.

You're not the only one thinking like this. The large transformer models are being pretrained on
unsupervised data before supervised learning. These models scale with more data:
- https://ai.stackexchange.com/questions/22581

In general, you have a lot more unsupervised training data. It's much cheaper to manage, understand,
etc. You don't have to rely on another team to get you what you need.

Hinton is deeply suspicious of supervised learning for a reason. See the end of this article for a
brief summary of his preference for unsupervised learning:
- https://venturebeat.com/2020/12/16/at-neurips-2020-researchers-proposed-faster-more-efficient-alternatives-to-backpropagation/

Is your role as a developer to do the pattern recognition for a network that can't yet do so for
itself? If you see an image, you know to model it with a convolutional network. In general, you make
the decision about how to model a system and make architectural choices based on the mental library
of model pieces you know may help build a useful mode for your new problem. Is your library
expanding?

Is unsupervised learning similar to Bayesian statistics? It seems like you can only argue against in
terms of efficiency:
- [When (if ever) is a frequentist approach substantively better than a Bayesian? - Cross
  Validated](https://stats.stackexchange.com/questions/194035/when-if-ever-is-a-frequentist-approach-substantively-better-than-a-bayesian)

# TODO-cycl: How is cyclomatic complexity measured?

Should you set a limit on this in pylint? Right now you ignore all those errors, mostly because you
don't understand the metric.

Cyclomatic complexity is related to Betti numbers:
- [Cyclomatic complexity - Wikipedia](https://en.wikipedia.org/wiki/Cyclomatic_complexity#Definition)

# TODO-idb: How does one quickly identify the bottleneck in a computer program?

The idea here is to provide a context for studying Turing machines and computability, complexity,
etc. There are also a lot of notes to move on this subject. So in some sense, it's exploring the
domain to come up with better questions.

# TODO-catt: What's a simple high-level summary of category theory?

It would have been helpful to have category theory when you were revewing linear algebra while
trying to understand the projections into a space that the KQ matrices do in KQV attention. Almost
every concept you were trying to understand had an alternative explanation in terms of category
theory. You should definitely organize your notes on the topic as part of this effort; perhaps
that's the first step. Once your own notes are organized, then you "explore domain" by simply
reading the notes of others (reading e.g. Wikipedia). You don't have to be writing notes to be
exploring a domain; reading is exploring as long as you are understanding and have a goal.

Math is critical not only because it has already created a large body of language (unique words) to
describe concepts, but also because it is old and therefore already holds many places in the English
namespace. You want to understand linear algebra *better* by understanding it from another
perspective (as well as group theory). I'd say linear algebra is the basis for pretty much all
machine learning (tensors). You should have a solid understanding in linear algebra before trying to
generalize it, however. It's also critical because it defines the data structures that we use; focus
on data structures first. Should you start with an article on the importance of mathematics? When
exploring, for example, you need some general guidelines about how to explore (prefer math). You
also see mathematical models apply to an *infinite* number of training examples, rather than a
natural number (no matter how big). You can't just follow curiosity (the curiosity gradient,
novelty), unless curiosity is based on the problems you've experienced in the past.

In the past you've experienced being able to answer a question you had on one page of Wikipedia by
almost randomly following links and then see it show up elsewhere. Because of the connectedness of
mathematics, many concepts are discussed in multiple places. That is, you don't need to keep track
of your mental train of questions as much as you would have to with another resource and another
topic. It's like following links in a consistent set of notes that you hope your own will be
someday. In fact, if you don't find the answer elsewhere it may not be an important answer.

It seems better to study category theory before topology. You already have two examples (group
theory and linear algebra) you can generalize from, and you have a lot of background in general. You
can also use category theory in other places besides math, such as functional programming. It's a
way to make your brain remember more things:
- https://mathoverflow.net/a/132490/118552

Understanding category theory is like importing a library dependency, rather than taking
dependencies on individual functions. In general seeing a "theory" after a name is a good indicator
that you need to make a concerted effort to learn something, similar to a library.

Wikipedia is an excellent source for learning mathematics. You've read their whole page of caveats
on the topic, and you agree with it. However, any study of mathematics requires some reference
material as you work (to go along your primary material), and Wikipedia is excellent in this area.
For example:
- https://en.wikipedia.org/wiki/List_of_named_matrices#/media/File:Taxonomy_of_Complex_Matrices.svg

https://en.wikiversity.org/wiki/Introduction_to_Category_Theory
https://en.wikipedia.org/wiki/Category_( mathematics)#Examples
https://en.wikibooks.org/wiki/Category_Theory
https://en.wikipedia.org/wiki/Function_(mathematics)#Other_terms
https://en.wikipedia.org/wiki/Category_(mathematics)#Examples

Distinguish between these slightly different terms:
- https://en.wikipedia.org/wiki/Homomorphism (morphism i.e. almost category theory)
- https://en.wikipedia.org/wiki/Homomorphism#Examples
- https://en.wikipedia.org/wiki/Homeomorphism (topology)

You care about applications to linear algebra:
- https://en.wikipedia.org/wiki/Linear_map#Algebraic_classifications_of_linear_transformations
- https://en.wikipedia.org/wiki/Covariance_and_contravariance
- https://en.wikipedia.org/wiki/Covariance_and_contravariance_of_vectors

See all the examples here:
- https://en.wikipedia.org/wiki/Function_space

You mostly understand free groups, can you tackle other free objects?
- https://en.wikipedia.org/wiki/Monad_(functional_programming)#Free_monads

Now that you understand homomorphisms, the relationship between morphisms and
homomorphisms may be more understandable:
- https://en.wikipedia.org/wiki/Morphism
- https://en.wikipedia.org/wiki/Homomorphism

Notice the picture of ab = ba on this page:
- https://en.wikipedia.org/wiki/Commutative_property

This is the same way that commutativity is described visually in VGT. It's the
same pattern you see in commutative diagrams as well:
- https://en.wikipedia.org/wiki/Commutative_diagram

Document how Boolean algebra is a Magma

You understand homomorphisms for groups now, which is part of category theory:
- https://en.wikipedia.org/wiki/Fundamental_theorem_on_homomorphisms

Universal property example:
- https://en.wikipedia.org/wiki/Direct_product_of_groups#Universal_property

In VGT a question went over commutators. Can you understand how they are
functors?
- https://en.wikipedia.org/wiki/Commutator_subgroup#Abelianization

Binary operation vs binary relation
https://en.wikipedia.org/wiki/Binary_operation#Binary_operations_as_ternary_relations

https://www.cs.toronto.edu/~sme/presentations/cat101.pdf

https://math.stackexchange.com/questions/312605/what-is-category-theory-useful-for

https://en.wikipedia.org/wiki/Functional_programming
https://en.wikipedia.org/wiki/Mathematical_logic

Thought you already had this link:
https://arxiv.org/pdf/1612.09375.pdf

https://cs.stackexchange.com/questions/3028/is-category-theory-useful-for-learning-functional-programming

https://en.wikipedia.org/wiki/Dynamic_dispatch
- Notice the types in this example - dividend and divisor can be matrices,
  floats, etc. Work through an example like this (with mathematical sets/types)
  and relate it to category theory.
- Also, Nick talks about dispatch a lot in his code.
- See dispatch methods here:
  https://docs.python.org/3/library/functools.html#module-functools

https://en.wikipedia.org/wiki/Higher-order_function

## Category theory and design

In any design, draw the category theory diagram first (diagram chasing?) and then think hard about
the categories of your inputs and outputs. List in? Dict in? Image in? Once these are well defined
you can use a large math vocabulary to identify what kind of operation you need (e.g. a
catamorphism) and then you can translate that to the language of functional programming (e.g. Nick
wanted to use "partition" in a different way based on his math understanding). Large vocab allows
for a large library of functions you can look up with a web search and then not not need to
implement yourself. They provide the morphisms, like miniature prebuilt nets.

See also:
- https://arxiv.org/abs/1803.05316
- https://www.amazon.com/Invitation-Applied-Category-Theory-Compositionality/dp/1108711820/ref=pd_rhf_d_se_s_bmx_gp_sccl_2_2/146-4077274-9552853?pd_rd_w=ipMxe&content-id=amzn1.sym.a37143c8-fb69-4f07-9e47-0a21fb07ca6d&pf_rd_p=a37143c8-fb69-4f07-9e47-0a21fb07ca6d&pf_rd_r=ZWCW54GJREC3GYW0SH2B&pd_rd_wg=IYx1C&pd_rd_r=eb4b2052-a511-4f6f-b96f-50a5782f0416&pd_rd_i=1108711820&psc=1

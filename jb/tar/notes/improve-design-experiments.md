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
- https://math.stackexchange.com/a/3478519/245548

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


# TODO-visc: Do visual proofs imply the importance of causality?

Do we learn so much faster with a visual of something because logic is ultimately based on
causality, and a visual makes it "clear" (faster) how one thing causes another? When you have to
read, you have to figure out for yourself what the causes are, perhaps by reading a whole paragraph
or more.

In the same way, a computer program is a much more "compact" (compressed) version of a causal
diagram (something visual). If you have a visual representation of code, you can "read" it much
faster.

It seems like you want to prefer natural logic systems to Hilbert style:
- https://en.wikipedia.org/wiki/Propositional_calculus#Example_2._Natural_deduction_system
- https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence#General_formulation

The former (natural) likely fit closer to causual statements that are common to natural language.
For example, see the counterfactual conditional that starts this topic:
- https://en.wikipedia.org/wiki/Paradoxes_of_material_implication

In the words of Curry, don't run away from paradoxes.

If you see the human brain as emulating the natural world, then the electrical impulses across
neurons should roughly correspond to more complicated activity (a compressed version of) what
happens in the world. This fits causality as being based in local interactions in the physical
world. We've created computers that emulate the human brain, to some extent, also using electrical
impulses at the microscopic level.


# TODO-sscb: Should you fork the content of SSC?

It would make coming back to the material later easier (fix errors). That'd make your own answers on
the topic much cleaner.

Would the authors want to put the source of the book up on GitLab or GitHub so that others can
suggest edits to the source rather than in a Google Doc? You're also not sure if you're forking an
old version of the content.

You could get the same effect by simply copying and pasting any updates they make into your own
build of the pdf. You really only need to copy and paste seven or so files.


# TODO-cuhc: What is a short summary of the Curry-Howard Correspondence?

See:
- https://duckduckgo.com/?q=curry+howard+correspondence&t=newext&atb=v310-1&ia=web
- https://courses.cs.cornell.edu/cs3110/2021sp/textbook/adv/curry-howard.html
- https://cs3110.github.io/textbook/chapters/adv/curry-howard.html


# TODO-cycl: How is cyclomatic complexity measured?

Should you set a limit on this in pylint? Right now you ignore all those errors, mostly because you
don't understand the metric.

Cyclomatic complexity is related to Betti numbers:
- [Cyclomatic complexity - Wikipedia](https://en.wikipedia.org/wiki/Cyclomatic_complexity#Definition)


# TODO-prit: How do you prove it?

You are bad at proofs (maybe because they are hard, though). You typically start using a result
(like code) and then only "prove" it (work out the bugs) once you've been using it some time. The
downside to this approach is that it's not necessary when you're not working with data, but
definitions. Whenever you're trying to prove something, you should use this list:
- https://en.wikipedia.org/wiki/Mathematical_proof#Methods_of_proof

You've avoided proofs (and math) in the past because you feel like all you're doing is symbol
manipulation, looking for just the right symbols to come together (solving the word problem by
simple exploration). A computer should be able to quickly present to you all the deductions you can
come up with from certain facts, it seems. Is the issue that humans typically don't provide it with
enough facts? We have a lot of knowledge we could forget to share. See also:
- https://en.wikipedia.org/wiki/Proof_(truth)
- https://en.wikipedia.org/wiki/Proof_assistant
- https://en.wikipedia.org/wiki/Interactive_proof_system
- https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence
- https://github.com/coq/coq
- https://en.wikipedia.org/wiki/Automated_theorem_proving
- https://paperswithcode.com/task/automated-theorem-proving
- https://en.wikipedia.org/wiki/Proof_theory
- https://en.wikipedia.org/wiki/Proof_calculus

Does SymPy provide anything to automate this? No, it looks like it's unrelated.

Notice the curry-howard correspondence has huge implications to how you take notes; you design your
`.md` files to be functions. Generally speaking you should refine them so that they all "prove"
something even if only probabilistically (see `!w Bayesian logic`).

Consider this list of which tools have formalized which of many famous theorems to decide which to
work with. You can also use this list as a way to learn how to do a proof with relevant examples
(e.g. whatever proofs or topics you are currently learning about):
- https://www.cs.ru.nl/~freek/100/
- https://web.archive.org/web/20080105074243/http://personal.stevens.edu/~nkahl/Top100Theorems.html

You should probably start by reviewing propositional calculus, the basis for other logical calculi:
- https://en.wikipedia.org/wiki/Propositional_calculus
- https://en.wikipedia.org/wiki/Propositional_calculus#Basic_and_derived_argument_forms

A proof is the process of building a function; we always start from what we know and start this
search process in the direction of where we think we may find value. You can take your premises and
randomly combine them to try to discover something new, or take specific premises and combine them
through educated guesses to try to go in a specific direction of a desired result. A proof is not
just the process of creating many more true statements (propositions) from old ones; it's about
generating *valuable* propositions (reusable, achieve human needs). In fact, you should prefer the
term "operator" to "function" for this purpose; see [Operator (mathematics) -
Wikipedia](https://en.wikipedia.org/wiki/Operator_(mathematics)). Or should you not? At some point
you need to be recursive and say either a function that takes a function or an operator that takes
an operator.

This search was particularly interesting with respect to Execise 2.45, part `2.`. You had to guess
(as hypotheses) different kinds of functions: addition, polynomial, exponentiation, constant,
piecewise, etc. In some sense there's creativity here; in another sense you're simply going through
a list of potential functions (perhaps only those you know). You could see the requirements (of a
monoidal monotone, in this case) as your constraints or in general a list of relations that must
hold (like a list of images when training a net). If a neural network can approximate any function,
how well does it approximate an exponential function? It was the answer here. See also:
- [Hyperbolic growth](https://en.wikipedia.org/wiki/Hyperbolic_growth)
- [Rectifier (neural networks)](https://en.wikipedia.org/wiki/Rectifier_(neural_networks))


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

https://en.wikipedia.org/wiki/Function_(mathematics)#Other_terms

You care about applications to linear algebra:
- https://en.wikipedia.org/wiki/Linear_map#Algebraic_classifications_of_linear_transformations
- https://en.wikipedia.org/wiki/Covariance_and_contravariance
- https://en.wikipedia.org/wiki/Covariance_and_contravariance_of_vectors

See all the examples here:
- https://en.wikipedia.org/wiki/Function_space

Document how Boolean algebra is a Magma

You understand homomorphisms for groups now, which is part of category theory:
- https://en.wikipedia.org/wiki/Fundamental_theorem_on_homomorphisms

In VGT a question went over commutators. Can you understand how they are
functors?
- https://en.wikipedia.org/wiki/Commutator_subgroup#Abelianization

https://math.stackexchange.com/questions/312605/what-is-category-theory-useful-for

https://en.wikipedia.org/wiki/Functional_programming
https://en.wikipedia.org/wiki/Mathematical_logic

A "Basic category theory" pdf:
- https://arxiv.org/pdf/1612.09375.pdf

https://en.wikipedia.org/wiki/Dynamic_dispatch
- Notice the types in this example - dividend and divisor can be matrices,
  floats, etc. Work through an example like this (with mathematical sets/types)
  and relate it to category theory.
- Also, Nick talks about dispatch a lot in his code.
- See dispatch methods here:
  https://docs.python.org/3/library/functools.html#module-functools

https://en.wikipedia.org/wiki/Higher-order_function

An interesting open-source task would be how to perform the bitmap tracing that Inkscape does more quickly and efficiently (when you have e.g. a PNG to convert to SVG). It'd be related to topology as well as machine learning.


# Data vs Theory

Some problems are best solved with data, and some with theory. This is the idea behind Cynefin domains, and it's relevant to deciding whether to use an ML model or write traditional code. It's only through experience with a particular problem that you learn whether it's best solved with theory or data.


# Loss curves

Deep learning is bad for human learning if you don't ever get anything from the curves. If you can't explain crazy loss curves you aren't learning to interpret. Like managing people, there's only so much to learn at this high level of abstraction and noise.

Should you expect a long-term difference between the training and validation curves, even if you aren’t overfitting? If there’s a major gap between the two, that suggests your ground truth or model has issues because it is failing to learn the patterns in the data. If your ground truth was random noise, you’d see the training performance go up with no change in validation performance. In some sense, this is overfitting though. What if you had all the random noise to train on that you could want? You’d see neither the training nor the validation performance increase. The training performance would never increase because the network weights would continue jumping around on the random noise in the training data. Should you add this to a review of the “overfitting” page on Wikipedia? You should review Wikipedia pages, why not? Your book is about reading between the lines and giving longer explanations. In fact, you’d really like to turn *all* your notes into commentary on Wikipedia rather than on other references, then put as much as possible directly into the Wikipedia source.

You also like this idea of shallow commentary because it will make it easier to apply improvements to the source (Wikipedia) and keep you near the source. You don't have to organize your notes if you already have the structure of Wikipedia to organize around; when you read a book you have the structure of the pedagogical material to organize around (which makes learning faster).

What should have been a clue that you were not overfitting is that training performance (0.45) was still lower than validation performance (0.52). Besides the number of epochs, you can also consider whether you are overfitting based on how many training examples you have per class. What are the rules for that? Should you add all this to the Wikipedia page on overfitting? You’re really trying to infer something causal here; draw a DAG with dataset size as an input, number of epochs, and outputs of the validation and training scores. That is, add a document based on the question: Is model training experiencing overfitting? Still, you are still at least partially overfitting at the end of training when your training score is near 0.8 and your validation score is near 0.5; one is absolutely lower than the other.


# Data distributions don't always matter

Should we really be incrementally increasing the size of datasets? It seems like waste a lot of time trying to fit models to small/medium datasets when there should really only be two sizes: Super small (to overfit) and full size. You need to step up incrementally only to avoid creating too much data that is unnecessary to avoid overfitting. Running anything but overfitting experiments on these intermediate datasets isn't highly valuable, because you don’t know that the results will generalize to a new larger dataset. If you build too large a dataset, you can always cut it down.

How would the distribution of the input data *not* effect results? I think you didn’t experience success in the past with adjusting distributions because you were always validating against some other dataset. The dataset is the truth, including its distribution. The positive/negative distribution is a truth claim about how likely you expect to see signs in the wild (not just where in the sweep image). Think of a model in SR2; in that context it’s much more clear that the distribution really matters. In the end, they optimize in the same way. Of course, what if you are fitting f(x) = x and you have more than enough data? It doesn’t really matter if all your data is in the first or third quadrant; you already have too much data (you really only needed two tuples, if your model was sufficiently simple) and so the distribution isn’t going to matter. How many parameters do you have in your model? It’s always a good question to start with. It’s also an easy thing to change to get better performance. One of the best things you could do in order to get a better sense of how to train models at work is to practice on small models like this one. That is, learn from examples. Do this as part of documenting your process on how to optimize any model.

You often think of adding new data to a machine learning model to help you get the answer you want. Why are you adding new data? Often you need the new data to help you recover what reality was originally like. That is, the machine learning model is actually an inverse function - the inverse of e.g. a lidar and imagery data collection function. By adding new data to the model, you’re helping ensure the model is injective/faithful (and therefore invertible). Think instead in those terms directly. What can you do to make sure the data collection function doesn’t compress to such an extreme degree that it is no longer injective and surjective? It’s cheaper to compress more, so clearly there’s a conflict between cost and performance. For example, the SweepFCN models effectively do sparse sampling of the point cloud (it’s cheap, and still gives a good enough answer). Add data to make the external causal process injective and therefore invertible so you can write or create an inverse function.


# TODO-ctca: How do category theory and order theory relate to causality?

See [Causality](https://en.wikipedia.org/wiki/Causality). One could see the lack of preservation of
joins and meets as a way of losing history in causal DAGs. For example, if you have the number 12
you can't say for sure if it was generated by 6 * 2 or 3 * 4.

Design experiment should have all your long shot ideas (big experiments). Parse a causal graph, somehow, from text with e.g. a transformer model. Check the same model works elsewhere in the same corpus. Involves parsing then immediately running, that is, parsing a function to then run on the same material. Recursively improves the model. Could also make improve improve process, for the parsing. It's ironic computers are so good at parsing a causal graph from a programming language but not from natural language; it seems they struggle with both probability and what ifs.

# Could codesign work on neural networks?

Could you use Cost-weighted graphs to design network topology? For example, the transformer model was designed based on network distances. Of course, this is also related to co-design.

# Are morphisms equivalent to RL actions?

Are morphisms analogous to actions? Are we able to abstract so far because we've made everything "improve" actions but many deep? Thinking more concretely in terms of Set, you can see many of the morphisms as sets of tuples (see currying question). Morphisms between these sets of two-tuples would then be improvements. Beyond this, you're moving to morphisms between sets of four tuples, unless you start to create abstractions (new words) (seems necessary).


# How do causality and logic compare?

In terms of a causal diagram, a “fact” is a piece of data (true statements). That is, you can take e.g. the fact that [V is a symmetric monoidal preorder] (alternatively, an “observation” about the world) to not just imply [(- + v) is a monotone map], but in some sense to be a causal implication of the preceding statement. That is, we use our casual faculties to perform mathematical proofs. In the case of math, there is only black and white (true and false). But, is logic really equivalent to causation? In other places, it seems this isn’t the case. Perhaps it’s only the case that logic diverges from causality when uncertainties (probabilities) or what-ifs are involved.

You can also easily construct results based on different axioms; the same fact can be an axiom or a derived result. Which approach is better? If we use our causal faculties for logic, then it's easier to see how the same thing could happen in two different ways.


# Partition the set of nouns

In abstract algebra you use properties/adjectives/constraints applied to old words to come up with new facts (often, new words). Or we define a new adjective, which effectively partitions the set of nouns. Both of these activities create taxonomies (class hierarchies):
- [Map of lattices - Wikipedia](https://en.wikipedia.org/wiki/Map_of_lattices)
- https://en.wikipedia.org/wiki/List_of_types_of_functions
- https://commons.wikimedia.org/wiki/File:Algebraic_structures_-_magma_to_group.svg
- https://en.wikipedia.org/wiki/List_of_named_matrices
- You should do the same for preorders, based on SSC (symmetric, monoidal or unital + associative, closed, has all joins). It would actually extend the map of lattices drawing.


# TODO-cbow: Is composition a binary operation?

See [Binary operation](https://en.wikipedia.org/wiki/Binary_operation), where it clearly seems to be
one. That is, you should be able to see $\circ$ as a binary operation just like $\ast$ and $+$.

However, the page [Function composition -
Wikipedia](https://en.wikipedia.org/wiki/Function_composition) makes no link to this other article,
except at the very bottom where the article is listed under the "Binary operations" category:
- https://en.wikipedia.org/wiki/Category:Binary_operations

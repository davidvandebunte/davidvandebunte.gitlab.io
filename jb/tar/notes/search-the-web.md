# Search the web

## Estimate value

A specialization of [](./expand-focus.md) specific to the problem of finding external pedagogical
materials.

## Design test

[rlv]: https://en.wikipedia.org/wiki/Relevance
[qb]: https://en.wikipedia.org/wiki/Quality_(business)
[dq]: https://en.wikipedia.org/wiki/Data_quality

The result of this process should be a list of resources that score highly according to measure of
both [Relevance][rlv] and quality. See [](./evaluate-pedagogical-tool.md) for the "quality" scoring
criteria used here. For other potential measures see [Quality (business)][qb] and [Data
quality][dq]. See also [Relevance (information retrieval)](
https://en.wikipedia.org/wiki/Relevance_(information_retrieval)).

[prir]: https://en.wikipedia.org/wiki/Precision_and_recall#Definition_(information_retrieval_context)

Said another way (and simplifying to only a binary relevance metric), this process should provide
higher precision searches because you are applying extra filters down to a higher quality subset of
the internet. See [Precision and recall - Definition (information retrieval context)][prir]. See
also [Evaluation measures (information retrieval)](
https://en.wikipedia.org/wiki/Evaluation_measures_(information_retrieval)).

### Leave negotiability

Should your stopping point be a certain number of documents? It may be better to provide a range,
so you can stop based on how the search is going. Was the last document you discovered better than
the previous? How much better? How much extra time did it take to find?

You can't be sure a question, even if it matches your question word for word, is being asked in the
same context or provides a sufficiently detailed answer. All results are only probabilistic; as you
work through this limited set of search results you'll need to continue to decide which to focus on.

There's always a balance between finding a resource that perfectly answers your question (high
relevance), and a resource that is high quality. You should "score" every resource by both its
relevance and it's general quality. How you weigh relevance and quality should depend on the
relative confidence you have that the question you're working on is more important than other
related questions. When you were picking between different potential questions to answer, how did
the question weights differ? Did you actually come up with the question *because* you noticed an
article on it somewhere (found an interesting question while exploring)? Said another way, if you
find a high quality resource that answers a related question, should you be opportunistic and read
it instead?

How much you favor high-relevance documents to high-quality documents will depend on how focused
your research is in the moment (more focused rather than basic/exploratory will favor
high-relevance documents i.e. those you already understand). See [](./set-goal.md). However, a high
quality resource may still be a cheaper solution only because it provides better documentation.

A perfect system would provide you with a document that exactly answered your query, but that would
be the equivalent of asking an educated person for the answer (expensive). Not only would the person
need to address the specific question, they'd have to answer it in words you understand. In some
sense, they'd be doing your job (sounds good, but rare).

What's the relative value in web searching relative to reading? How much time should you spend
searching relative to the time you spend reading? You aren't learning much when you web search; it's
a rather shallow process. You will typically get more from a conversation with a single webpage than
a conversation with your search engine (i.e. put slightly more weight on high quality documents).
For example, you're often relieved to go e.g. on vacation and only be able read documents rather
than weigh them.

## Estimate cost

See also [Document retrieval](https://en.wikipedia.org/wiki/Document_retrieval).

### Apply default filters

We all know paywall sites that we ignore in search results because they may not even let you see
what you want to see. Why not filter them to avoid wasting any attention on them? Use [uBlacklist](
https://iorate.github.io/ublacklist/docs) to block websites like this, or to filter websites you've
checked the license on using the process in [](./evaluate-pedagogical-tool.md).

### Focus your search

The web is a huge place, and trying to search all of it using only a few words is unlikely to
produce the documents you are interested in. Why? Your search tool doesn't have enough information
about how you score documents. Every word you type in your search is a filter in some sense, though
in that case the terms can interact. The longer your query, the more likely you'll get what you
want.

Ate you answering a question? If so, be sure to write out at least all the keywords in the question.
You can skip generic words like "What" and "Why" if you want, but these do help search.

See the "Search Operators" in [DuckDuckGo Search Syntax | DuckDuckGo Help Pages](
https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/) for generic tips for improving
your results.

#### Search by website

Once you've taken the time to build a solid query, reuse it. Use the same query on several websites
you prefer to work with, listed here in order of preference.

Useful research websites in a rough priority order based on [](./evaluate-pedagogical-tool.md):

##### Stack Exchange

[egr]: https://ai.stackexchange.com/questions/21810/what-is-a-fully-convolution-network
[aes]: https://duckduckgo.com/?q=fully+convolutional+network+stackexchange&t=newext&atb=v310-1&ia=web

See [DuckDuckGo !Bang](https://duckduckgo.com/bang) for one way to filter by website. The downside
to bangs is that they (often) use the scoring method provided by the website, which is typically
inferior to a general search engine's algorithms (i.e. DuckDuckGo). If you don't want to type out
`site:` (you must be quite busy) an alternative is to simply add the domain as a search term (e.g.
[fully convolutional network stackexchange at DuckDuckGo][aes]. For example, try to find [What is a
fully convolution network? - AISE][egr] using both `!sx` and using the previous search; DuckDuckGo
helps you find this reasonably high quality resource much faster. Bangs you do not use, for this
reason:

```
!sod (SO with DuckDuckGo) or !ov (SO with it's own search)
!sx
```

Why stack exchange? It's also editable, and is CC BY-SA like Wikipedia (see [What is the license for
the content I post? - Help Center - Stack Overflow](https://stackoverflow.com/help/licensing)). It
also keeps track of your activity to some degree; see my answer in [How can I view vote history from
all Stack Exchange sites? - Meta Stack Exchange](https://meta.stackexchange.com/a/379518/1208843)
however. Try to make a comment or some other change to bookmark that you've made a significant
investment in understanding a question and answer. If you have many links you want to provide,
consider creating your own answer. See the *sxda* bookmark for [User davidvandebunte
- Stack Exchange - activity](https://stackexchange.com/users/309544/davidvandebunte?tab=activity).

##### Wikipedia

```
!w
!wt
```

Why Wikipedia? It's editable and CC BY-SA. It also tracks where you've been; see [User contributions
for Davidvandebunte - Wikipedia](
https://en.wikipedia.org/wiki/Special:Contributions/Davidvandebunte).

##### Papers with code

```
!pwc (uses the search built into paperswithcode.com)
```

Use [Papers With Code (`pwc`)](https://paperswithcode.com/) to find the SOTA on the benchmark that
most closely matches your workload. Even if you don't use the SOTA because it's e.g. too expensive,
the list should include all models evaluated on the dataset.

##### Programming references

```
!py
!sympy
!pytorch
!wolf
```

##### Personal bangs

```
!maps
!gcal
!drive
!e
!a
```

### Explore by website

Have you found "gold" on certain [Websites](https://en.wikipedia.org/wiki/Website) in the past? You
may want to mine them by e.g. their own scoring criteria or by simply browsing what's available.

One major downside to this approach is that you aren't coming to the material with your own
question, asking what you want of it (fitting it into your own knowledge) rather than having it tell
you what is valuable or useful. By definition, it's also widening your focus, taking you away from
whatever you were currently working on. It can also be hard to remember when you last "mined" a
website; what is new?

Some of these "blogs" are also written like advertisements. They are designed to cause you to panic;
the authors talk as if they are about to hit AGI because that's what they want their stakeholders to
think. If you see impressive results investigate how they achieved it, and you'll be less impressed.

Still, don't hate their success. They are successful because they are taking the time to demo,
unlike many authors. They're learning fast. Reading what they're doing has been one great way to get
yourself to stop maintaining large bodies of your own notes; you've often seen them doing work
you've already been considering (such as writing source code) and their advertisements drive you to
learn new topics (e.g. Transformers). To some extent these sites have earned your priors, like a
brand.

Semantic scholar (`!s2` uses the search built into semanticscholar.org) only provides articles that
aren't behind a paywall. This site makes it easier to follow references in papers by turning them
into links. See:
- [Semantic Scholar](https://www.semanticscholar.org/)
- [Semantic Scholar](https://en.wikipedia.org/wiki/Semantic_Scholar)

Some websites don't seem searchable via DuckDuckGo; you must go to them specifically. Use [Connected
Papers](https://www.connectedpapers.com/) to find high-scoring papers that are closely related to a
topic you are already focusing on.

Other resources:
- [Highest scored questions - CSSE](https://cs.stackexchange.com/questions?tab=Votes)
- [DeepMind - Research](https://www.deepmind.com/research)
- [Meta AI Blog](https://ai.facebook.com/blog/)
- [OpenAI Blog](https://openai.com/blog/)
- [NVIDIA Blog](https://blogs.nvidia.com/)
- [Highest scored questions - Cross Validated](https://stats.stackexchange.com/questions?tab=votes&page=1)
- [Home - colah's blog](https://colah.github.io/)

Limit the number of websites you regularly visit, to make relearning from them easier and focus your
investments. To learn to use a website is an investment in itself, such as e.g. learning how to
insert a reference on Wikipedia, where to find activity history, or how to construct links to
specific answers on SE. If you need to relearn a topic, it will help to be able to relearn from an
easily accessible website (one that shows up quickly in search). Websites even have certain layouts
that you get used to and therefore lead to less "surprise" when you go to a completely new page on
the same site. That is, you'll hit a memory-guided [Saccade](https://en.wikipedia.org/wiki/Saccade)
more often.

#### Wikipedia

The equivalent of high scoring articles on Wikipedia is "Good" or "Featured" articles. It's much
harder to judge which of these are worth reading, and there's a higher barrier to entry for
influencing how an article is ranked (who knows how?). See for example:
- [Wikipedia:Good articles/Mathematics](https://en.wikipedia.org/wiki/Wikipedia:Good_articles/Mathematics)

### Stick to your keyboard

Use `H` and `L` rather than the left and right arrows on your keyboard so you don't lose your hand's
home position.

#### Copy text

One option is to use vimium's `/` then `n` (see [Find Mode | Vimium][fm]) to searching with `Ctrl-F`
(or `F3`). The copying process:
1. After reaching the text, hit `v` to enter [Visual Mode | Vimium][vm].
1. Use any of the characters mentioned in the documentation (e.g. `w`, `e`) to select text.
1. Hit `y` to copy.

Hit `N` to go back in your search; `n` does not wrap back to the top. Use `c-[` rather than `Esc`
with Vimium. You can also hit `v` then use `/` to search (opposite order). The downside to this
approach is vimium's search doesn't highlight all instances of a word.

[fh]: https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly#w_miscellaneous

You can also use `F7` to enable "Caret browsing" in Firefox (see [Keyboard shortcuts - Perform
common Firefox tasks quickly | Firefox Help][fh]). Vimium also has a caret mode where you can use
keys from vim rather than the arrow keys. Hit `c` from visual mode.

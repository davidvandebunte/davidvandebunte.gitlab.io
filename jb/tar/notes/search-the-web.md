# Search the web

## Estimate value

A specialization of [](./explore-domain.md) specific to the problem of finding external pedagogical
materials.

## Design test

The result of this process should be a list of resources that score highly according to your values
in this area. See [](./evaluate-pedagogical-tool.md) for the scoring criteria used here.

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

See the "Search Operators" in [DuckDuckGo Search Syntax | DuckDuckGo Help Pages](
https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/) for generic tips for improving
your results.

#### Search by website

Think about whether you can take part of your search and turn it into a specific website to search.
This gives you better search results - results that are more relevant, higher precision (precision
in the sense of P/R) because you are applying an initial filter down to a higher quality subset of
the internet.

See [DuckDuckGo !Bang](https://duckduckgo.com/bang) for one way to filter by website. Useful
research bangs in a rough priority order based on [](./evaluate-pedagogical-tool.md), that also
lowers the priority of reading existing habits:

```
!sod (SO with DuckDuckGo) or !ov (SO with it's own search)
!s2 (semantic scholar's search)
!pwc (search for paperswithcode.com)
!sx
!py
!wolf
!sympy
!w
!wt
!pytorch
```

Use [Papers With Code (`pwc`)](https://paperswithcode.com/) to find the SOTA on the benchmark that
most closely matches your workload. Even if you don't use the SOTA because it's e.g. too expensive,
the list should include all models evaluated on the dataset.

If you're using semantic scholar (`!s2`) you'll only get articles that aren't behind a paywall:
- [Semantic Scholar](https://www.semanticscholar.org/)
- [Semantic Scholar](https://en.wikipedia.org/wiki/Semantic_Scholar)

Why stack exchange? It's also editable, and is CC BY-SA like Wikipedia (see [What is the license for
the content I post? - Help Center - Stack Overflow](https://stackoverflow.com/help/licensing)).

Useful personal bangs:
```
!maps
!gcal
!drive
!e
!a
```

[egr]: https://ai.stackexchange.com/questions/21810/what-is-a-fully-convolution-network
[aes]: https://duckduckgo.com/?q=fully+convolutional+network+stackexchange&t=newext&atb=v310-1&ia=web

The downside to bangs is that they (often) use the scoring method provided by the website, which is
typically inferior to a general search engine's algorithms (i.e. DuckDuckGo). If you don't want to
type out `site:` (you must be quite busy) an alternative is to simply add the domain as a search
term (e.g. [fully convolutional network stackexchange at DuckDuckGo][aes]. For example, try to find
[What is a fully convolution network? - AISE][egr] using both `!sx` and using the previous search;
DuckDuckGo helps you find this reasonably high quality resource much faster.

Some websites don't seem searchable via DuckDuckGo; you must go to them specifically. Use [Connected
Papers](https://www.connectedpapers.com/) to find high-scoring papers that are closely related to a
topic you are already focusing on.

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

Helpful resources:
- [DeepMind - Research](https://www.deepmind.com/research)
- [Meta AI Blog](https://ai.facebook.com/blog/)
- [OpenAI Blog](https://openai.com/blog/)
- [NVIDIA Blog](https://blogs.nvidia.com/)
- [Highest scored questions - Cross Validated](https://stats.stackexchange.com/questions?tab=votes&page=1)
- [Home - colah's blog](https://colah.github.io/)

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

---
title: "Share to Blog"
date: 2021-12-24
tags: ['share']
---

[sn]: {{< relref "share-notes.md" >}}

Part of [Share Notes][sn].

# Cost

In order of cost.

## Backport

[backport]: https://en.wikipedia.org/wiki/Backporting

Expect to follow a merge workflow. That is, you will need to backport the commits you want to a more
public domain (see [Backporting][backport]). Typically you start by identifying what changes you
could publish:

```sh
git diff --diff-filter=ad public/master private/master
```

If there's something to do, you switch to the public branch and pull in what you can:

```sh
git restore -p -s private/master content/post/example.md
```

Next review the diff, and finally review the rendered version.

See also:
- [How to get just one file from another branch? - SO](https://stackoverflow.com/a/2364223/622049)
- [A detailed answer on `git restore` - SO](https://stackoverflow.com/a/60855504/622049)

## Update Publication Date

Readers (including the author) like to see the date that content was posted. The older the content,
the less likely it is to be useful (most people check the year on blog posts). For example, when was
this blog post put up? Docker is a fast moving technology; is this still the best practice?
- https://vsupalov.com/buildkit-cache-mount-dockerfile/

As the author of a blog, when you go to the front page of your blog, can you find what you're
looking for? If you want stay in focused work on your most recently published work, you should
update the date so you can easily find what you're publishing on the front page.

## Optimize for Search Engines

You don't have to get your articles to show up in Google or DuckDuckGo; get a larger website to do
the SEO for you by linking from them. For example, link to your articles from an SO question so you
can find it in search later. With this approach you'll just have a single level of indirection after
you search.

For example, this profile links to this blog:
- https://github.com/davidvandebunte

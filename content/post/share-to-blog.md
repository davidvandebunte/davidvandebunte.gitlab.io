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
public domain (see [Backporting][backport]). Start by identifying what changes you could publish:

```sh
git diff --diff-filter=ad public/master private/main
```

If there's something to do, switch to the public repository and pull in what you can:

```sh
git switch master
git restore -p -s main content/post/example.md
```

Next review the diff, finally review the rendered version, then push.

The public repository should only pull prepared content from the private repository. If you create
new content on the public repository you have to backport it to the private repository, and do so
immediately. If you don't, you may forget which repository has the latest version of an article (the
implicit assumption is the private repository always has the latest).

Whenever you switch back from the public to the private repository, acknowledge that the private
repository has the latest content with a trivial merge:

```sh
git switch main
git merge -s ours public/master
```

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

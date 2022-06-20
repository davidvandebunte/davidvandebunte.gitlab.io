# Maintain focus

## Estimate value

Generalizes many processes. To make your mind attend to the same:
- Large scale goal, see [](./set-subgoal.md).
- Section of your notes, see [](./organize-notes.md).

% Code: `refactor-code.md`

Deliver value in terms of improvements to whatever state you were previously focusing on changing.

[cl]: https://en.wikipedia.org/wiki/Cognitive_load

Your short-term memory can only attend to so much, which we will refer to as your [Cognitive
load][cl]) and is generally referred to as what you are "attending to" in the short-term.

If you open more text editor or web browser tabs, you are decreasing your ability to focus on the
set of windows you already have open; see [Attention - Exogeneous and endogeneous orienting](
https://en.wikipedia.org/wiki/Attention#Exogenous_and_endogenous_orienting). That is, the windows
you have open will either need to be forgotten (totally acceptable, just close them) or they will
eventually jump back into your focus through exogeneous orienting when you e.g. need visual space on
your computer monitors and you have to go through all your windows. You can't focus on anything new
unless you have monitor space.

If you don't stay safely under your visual space limits over the course of e.g. several days, you'll
eventually hit an idea spike, run out of space, and then potentially lose valuable thoughts by
dumping them to an unorganized location you never return to. On the other hand, if you don't give
yourself enough context when working on a problem (from e.g. several days of memory), you won't
think as deeply into your problem and achieve greater insights (better deep rather than shallow
internal representations).

## Design test

Attend to the same goal or task. To analogize to the work of training a net, continue
backpropagation on the same training example.

Analogous to "Sustained" or "Selective" attention in the model of Sohlberg and Mateer; see
[Attention](https://en.wikipedia.org/wiki/Attention).

## Estimate cost

Close your eyes; this avoids exogeneous orienting.

### Search your web browser

Do a search for a word on your existing browser tab. It's likely what you see will be more
appropriate than a global web search.

Use `%` to search open tabs rather than opening a new one. See [Search open tabs in Firefox |
Firefox Help](https://support.mozilla.org/en-US/kb/search-open-tabs-firefox). When you use this in a
new tab, the new tab is automatically removed when you select an existing tab.

Simply click on links rather than Ctrl-click to avoid excessive tabs, as well. Use Ctrl-click when
you want to expand your scope (see [](./expand-focus.md)), effectively adding a new goal.

### Zoom out

It helps to be able to zoom in more as you get more invested in a webpage. This is similar to how
math (e.g. numbers) and code is a more compressed version of natural language; variable names are
often too short. What you gain is the ability to attend to more at once. Prefer to do this on a
per-site basis to avoid global tweaking; site owners have likely already tweaked their context to
browser defaults. For now you "Zoom Text only" to avoid tweaking the site owner's image sizes. See
[Font size and zoom - increase the size of web pages | Firefox Help](
https://support.mozilla.org/en-US/kb/font-size-and-zoom-increase-size-of-web-pages?redirectslug=Page+Zoom&redirectlocale=en-US)
and [Change the fonts and colors websites use | Firefox Help](
https://support.mozilla.org/en-US/kb/change-fonts-and-colors-websites-use).

Your zoom settings are site-specific, unfortunately (not tab-specific). That is, if you set your
zoom to 90% on one Wikipedia page it will apply to all Wikipedia pages (though not other websites).
You've zoomed way in by default on your own website (it's easy for you to consume). Your text editor
should already be "zoomed" to let you fit as much as possible on a screen.

% See TODO-dr for other thoughts on how compression helps you attend to more at once.

### Estimate first

You should be able to provide some estimate of how hard a question is to answer before you expand
your focus. Is this a quick search or something that will take an hour?

#### More than 5 minutes

Take notes when you want to attend to more weights deeper into your recent thoughts. Notes force
your focus on a certain train of thought by making it real on your screen (and in front of your
eyes, regularly forcing the context back into focus through exogeneous orienting). It's a way to
assist your own limited ability to think deeply into your current context.

Said another way, to take notes is not only to serialize your thoughts long-term. It's also to
serialize them temporarily (e.g. over the next 5 minutes) to force you into focus. Is this a good
practice? It keeps you on focus, but would make answering verbal questions (keeping your train of
thought) difficult because you'd be out of practice. You wouldn't be able to think without your
notes. For estimates of less than 2 minutes, perhaps you should not even use your notes (this
probably happens naturally, though).

Notes are also good evidence that you know the exact question you want, and that you're going to use
good searching tools e.g. [](./search-the-web.md) to answer the question (dependency). It also
indicates that you've thought enough about the question to believe that it is a strict dependency;
you've read alternative explanations and they do not solve the problem. There's always more than one
way to solve a problem (understand). You'll also want the question written down in case you get
interrupted somehow.

Try to answer the question from your own notes (like an open note test) before moving on to a web
search. Why? You do have a preference for e.g. Bayesian to Frequentist statistics. More importantly,
you may be able to skip the step of web searching if you already have already collected good
pedagogical resources on a topic. You'll be able to learn much faster from resources you've already
evaluated for quality and skimmed.

If you're working from both a primary and supplementary article, give more space to the
supplementary article by putting it in a different browser window and a different monitor. It's not
easy to rapidly switch back and forth between two tabs and still understand, especially if you need
to open more tabs once in a while. See [shortcut key to detach a tab in firefox (move tab to new
window) - SU](https://superuser.com/a/1514487/293032); to re-attach use a similar strategy.
Alternatively, always keep two Firefox windows open, one leaning SE and one leaning Wikipedia.

#### More than 1 hour

In some sense this is a "little failure" because your own language was not enough (with the
resource) to solve the problem. When you run into a "little success" you naturally go through
closing tabs and windows that are no longer relevant. You should do the same for little failures;
serialize what you've learned so you can add a dependency (unfortunately expanding scope) i.e.
construct an abstraction. If the estimate is large, then in order to avoid spilling notes (see
[](./maintain-focus.md), you will need to narrow your focus to some degree. See
[](./narrow-focus.md)).

##### Save the dependency

At the least, you know you've discovered a dependency if you can't answer a question without opening
another tab. There may be another way to construct your new abstraction, and in the short-term you
should usually look for alternative solutions. Even if you do so, however, to understand the problem
from this additional perspective requires this dependency.

Why save the dependency, even if you don't fill it in now? You'd ideally like to understand the
abstraction from as many perspectives as possible so you don't forget it and so that you can quickly
relearn the concept from e.g. a different, shorter perspective. If you can rederive the result from
this new perspective, you may eventually be able to reduce duplication in your mental networks (the
whole point of math and notes).

Therefore, at the least, add the dependency to a local planning git graph and a link/keyword in the
notes where you are discussing the problem. You need the link/keyword so you can find the "missing"
concept later when you are grepping for e.g. mathematical keywords that may be worth learning about.
You need the local planning graph so you remember why the concept would have been useful. A question
may not be enough to motivate returning to the dependency.

Another major reason to save off (write down) missing dependencies is it motivates completion. You
do not need to understand all material from every possible perspective (e.g. frequentist
interpretations, in some cases); by saving off the missing perspectives you will feel you are able
to move on. For a SE answer, this is like adding a private comment, one that is not appropriate for
the public domain because you haven't done sufficient research to answer it on your own (but also
don't want to). Said another way, you're stripping out minor alternative goals. The result (in your
notes) is a mix of a reminder TODo and unresolved questions.

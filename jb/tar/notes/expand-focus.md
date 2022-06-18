# Expand focus

## Estimate value

Generalizes many processes. To make your mind attend to more:
- External web resources, see [](./search-the-web.md).
- General world state, see [](./set-wide-goal.md) or [](./set-deep-goal.md).

You can expand your focus with the purpose of either decreasing costs or finding value. That is,
either considering how you can share code/weights/ideas between two tasks you must do, or mining for
value.

Build better internal representations in order to make solving future problems more efficient.

## Design test

In general, increase the amount of state you are attempting to attended to. This may be natural
language in your notes, your open browser tabs, the weights in a net being trained, or the weights
on the neurons in your brain. Imagine you could see your own weights in your brain. What new set of
mental weights are you attending to with this new text editor or web browser tab?

In the context of the [Attention](https://en.wikipedia.org/wiki/Attention) article, expanding your
focus to a place of [Simultaneous](https://en.wikipedia.org/wiki/Attention#Simultaneous) attention.
You will typically be attending to more state through abstractions.

### Divided attention

Expanding your focus is not the same as "Alternating" or "Divided" attention in the model of
Sohlberg and Mateer, or to [Human multitasking](https://en.wikipedia.org/wiki/Human_multitasking).
In general it's not about switching tasks or controlling your attention, but merely about looking at
the bigger picture.

### Find value

See [](./set-wide-goal.md) and [](./set-deep-goal.md).

Unorganized notes generally indicate you really want to focus on a topic, but believe there is value
in a thought you should save for later. You can add these (or any other thoughts) to the set of
notes you are attending to, without making them show up in `git` as uncommitted changes, by adding
them to a file in your text editor but not saving the file (e.g. `:w` in `vim`). Another option is
to open a "reminder tab" in your web browser and move it out of the way.

### Decrease costs

To analogize to the work that nets do, you may be temporarily switching to task A (a different
perspective) from task B in an effort to help you perform better on task B (in the long term). Of
course, you expect to see better performance on task A in the short term.

Transfer learning occurs when subnets are trained on two different tasks in series (e.g.
classification and object detection). When we do this kind of transfer learning we often throw away
our ability to do the original task (classification) but there's no reason that head needs to be
thrown away. What if we went back to training for classification a few more times, even if object
detection is our final goal? If the loss continues to go down, why not? We typically do not automate
transfer learning techniques, even if we used them to train a model that is used in e.g. production
(which is unfortunate).

In the language of focus, you can see this as going in and out of focus on different tasks. When the
net is attempting to perform classification, it is attending to both the weights that are solely for
classification and the shared weights used for both classification and detection. It could regularly
expand its focus to all tasks it can perform, however, and then narrow back into the detection task
(assuming it was last working on classification).

Expanding your focus is also sometimes similar to increasing your batch size in training. That is,
you are sometimes only looking for a different perspective on the same problem in a new web article.
Perhaps you started a web search looking for a higher-quality web article, but are satisfied to only
find a similar quality resource that provides a second or third perspective. The upside is that two
perspectives can help you learn; see [](./evaluate-pedagogical-tool.md) for thoughts on multi-modal
resources. The downside is that increasing your batch size may be an indicator that you are
searching hopelessly for a resource that is already in your own words; the cost of a larger batch
size is freezing part of your network. See also [Continuous partial attention](
https://en.wikipedia.org/wiki/Continuous_partial_attention).

## Estimate cost

Close your eyes; this avoids exogeneous orienting.

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

Use `%` to search open tabs rather than opening a new one. See [Search open tabs in Firefox |
Firefox Help](https://support.mozilla.org/en-US/kb/search-open-tabs-firefox). When you use this in a
new tab, the new tab is automatically removed when you select an existing tab.

### Deep notes

Take notes when you want to attend to more weights deeper into your recent thoughts. Notes force
your focus on a certain train of thought by making it real on your screen (and in front of your
eyes, regularly forcing the context back into focus through exogeneous orienting). It's a way to
assist your own limited ability to think deeply into your current context.

Said another way, to take notes is not only to serialize your thoughts long-term. It's also to
serialize them temporarily (e.g. over the next 5 minutes) to force you into focus, and searching
your own mental networks for answers rather than others. Is this a good practice? It keeps you on
focus, but would make answering verbal questions (keeping your train of thought) difficult because
you'd be out of practice. You wouldn't be able to think without your notes. For estimates of less
than 2 minutes, perhaps you should not even use your notes (this probably happens naturally,
though).

### Estimate first

You should be able to provide some estimate of how hard a question is to answer before you expand
your focus. Is this a quick search or something that will take an hour?

Do a search for a word on your existing tab. It's likely what you see will be more appropriate than
a global web search.

For estimates of more than 5 minutes, you should write down (in your notes) your question before
opening a new tab to try to answer the question. This is good evidence that you know the exact
question you want, and that you're going to use good searching tools e.g. [](./search-the-web.md) to
answer the question (dependency). It also indicates that you've thought enough about the question to
believe that it is a strict dependency; you've read alternative explanations and they do not solve
the problem. There's always more than one way to solve a problem (understand).

For estimates of more than 5 minutes, you should also try to answer the question from your own notes
(like an open note test) before moving on, because you do have a preference for e.g. Bayesian to
Frequentist statistics. More importantly, you may be able to skip the step of web searching if you
already have already collected good pedagogical resources on a topic. You'll be able to learn much
faster from resources you've already evaluated for quality and skimmed.

For an estimate of more than 5 minutes, you'll also want the question written down in case you get
interrupted somehow.

In some sense this is a "little failure" because your own language was not enough (with the
resource) to solve the problem. When you run into a "little success" you naturally go through
closing tabs and windows that are no longer relevant. You should do the same for little failures;
serialize what you've learned so you can add a dependency (unfortunately expanding scope).

At the least, you know you've discovered a dependency if you can't answer a question without opening
another tab. There may be another way to solve the problem, but to understand the problem from the
particular perspective you are considering this concept is a dependency. You can add the dependency
to your future git graph, if it's worth it (you aren't finding an alternative solution after web
searching alongside notes for a few hours) then replan.

In order to avoid spilling notes (see [](./maintain-focus.md), you will need to narrow your focus to
some degree. See [](./narrow-focus.md)).

### Wide notes

Run `git grep` for all the key words in question, and use or delete your old thoughts. This is the
equivalent of querying your own notes.

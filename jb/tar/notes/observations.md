---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Unorganized

Let's say you have an interruption Y come in (maybe a thought) that is slightly more important than what you are doing X, but requires much less working memory and therefore will almost surely be possible later. If you take away from your time in focused work (something that requires a lot of working memory) to do this task then you will likely not accomplish X by the end of e.g. your timebox. This creates a situation where you are doing something that is less important than your highest-priority task, but overall lets you get more done. You're trading off thoroughput (i.e. learning) for responsiveness. It seems like this is why you need unorganized notes. All learning makes this tradeoff; think of someone going to college rather than starting to work at a factory.

If you aren't addressing your unorganized notes, you aren't doing important work. If you aren't producing unorganized notes, then you aren't efficiently solving your problems.

Insisting on having no unorganized notes can also be shallow. You can force no `unorganized.md` to exist, but that only forces one level of organization. When will you structure second-level concepts? Even worse, some files can become dumping grounds for nearly unorganized notes. It may even be better to wait to organize (compress) your observations, at least to some extent, until you get to a point where you can compress them all at once in focused work (unless the compression is clearly not lossy i.e. no loss of generality).

Generally speaking, unorganized content is an artifact of prioritization. As you work you should constantly be pushing the most promising ideas you have to the bottom of a short list of things you are working on. Work on these first, to make forward progress on the topic you are focused on (using all your working memory on your primary task). When you're done, everything less important than your primary task will be left in your wake higher in your document. It's not that these are less important at a global level than your primary task; they may even be more important areas to explore (you don't know). To have spent time on them as you encountered them, however, would prevent you from making deep forward progress on what you previously believed (with a global view) was most important and you can't say definitely that your new areas to explore are the most globally important thing to do until you return to a global view.

+++

## Z-level prioritization

Organizing notes should be first and foremost about prioritization. Visually, you could think about it similarly to how you see Z levels in a drawing. It should be OK to push things all the way down behind everything you're looking at now as long as you know that you know that you're going to be able to remember to look it up later (e.g. friends-and-relations.svg). Ideally, everything that you do supports something that is "visible" to you. If it doesn't support something visible, then perhaps you shouldn't be doing it. If it isn't a significant part of supporting the visible things, then it's less important to work on. Should you set priorities via a picture of disjoint sets of what you care about in your life? Perhaps you could use this to learn layers in Inkscape. It seems like people would dominate the highest levels, then technology to support people at lower levels.

You like how this approach is similar to the concept of compression. At work, you'd make the "visible" elements things like F1 score. The causal logic is then from the back to the front of the image. You also like how this lets you take advantage of three dimensions (at least think in it) when typically Inkscape is limited to two. You also like how this focuses your "attention" as in attention mechanisms on the most important things, with exogeneous orienting. You've already been thinking to require a time axis on all causal diagrams (making it explicit so you assign some units/scale to it and label it for others). Of course, you could also make the time axis in the Y direction (vertical) and give more Z levels to more important goals (but this seems less natural). Your "improve improve" tasks would also naturally go to deeper Z levels.

Ironicallly, you may want to save the time dimension into Z-levels (or layers) so that if you ever want to create a visualization of your layers as a GIF (exporting as batch) the time dimension in your GIF will match the time dimension you were thinking about.

Should this view reflect how you spend your time? No, because many things are important to you but aren't going to take your time. Your child's health may be important to you, but you have others to help with it (including the child, eventually) and you're not an expert in healthcare. That is, if you're not the best at something but it's important to you, outsource it. Said another way, some things are important, but that doesn't mean you can control them (or choose to control them).

You also like how this system makes your values theoretically measurable (in terms of e.g. area) but also clearly not particularly objective (so you don't agonize over the numbers). It also makes your values relative, which should really help you think about them.

![x](z-level-compression-example.svg)

No design strategy is perfect, and unfortunately engineers often like to approach design in different ways (e.g. a codesign diagram vs. a gantt chart). It seems like the most critical part of designing a design approach should be making what's most valuable most focal, however.

Nearly the same thing can be done with text, by making plain text into links. Let's say you had a link from one document A, to another B, to another C. If you move the link from B to C to the article A by e.g. mentioning the word somewhere (or even just adding the link to some related word) you're making the lower-level content more focal. Perhaps you could use links as a simpler form of the z-level based prioritization.

Another way we do the same thing with text is by pushing language into version control. When you are reviewing changes in `git diff` you can `git add` and commit anything you no longer want to be focal.

Another way to do the same is simply having a backlog, putting what you think should be most important at the top.

+++

## Improve share notes

You should see your notes as a set, partitioned between public/private/work. The partitioning happens on disk, in files. Get that Venn diagram right. You have notes that are shared between work/private that e.g. need to have their own place within your master repo. Your drawing of this division should include the paths you've allocated for these partitions.

![x](example-notes-partition.svg)

+++ {"tags": []}

## Rclone

Why not `cp`? You'll often want to confirm checksums to avoid e.g. corrupt PNG files that kill training (on questionable spinning disks or SSDs). Both `rsync` and `rclone` can do this. You would much rather wait for a slightly longer copy than have a corrupt file on your disk. Even if you totally trust the disks on your local filesystems, let's say you need your disk for something besides a copy/move (like training). You could stop the move or copy, and restart it later. There's a cost to this, of course, but it's not terrible. You also get progress indication, and better/clearer logging (something rather than nothing). You could take over the half-finished `cp` command someone else started and move instead. You can also control whether large/small files get moved first for performance optimization.

It doesn't really seem like there's much a reason to use `rsync` either. See [Difference between Rclone and Rsync when syncing to the Local Filesystem? - Help and Support - rclone forum](https://forum.rclone.org/t/difference-between-rclone-and-rsync-when-syncing-to-the-local-filesystem/3088/4). Why? You can use it for transfer both to and from remote locations (AWS) as well as between local disks. That is, one interface for everything.

Why not use the AWS CLI? `rclone` is an open-source tool while the AWS CLI is tied to Amazon (maybe not the code, but the service behind it). The AWS CLI is also awful to install; there doesn't seem to be a good way. You also get much better progress indication, less verbose/clearer logging, better filtering, and performance optimization (using e.g. all of your NIC).

Even if you don't use `--max-backlog=-1` with rclone to get overall progress, it shows you MiB/s. Usually this is enough for you to project when you'll be done - you know how many TB you need to move.

See also your comments in learn-unix-utilities.md about `cp -r` confusion. See also [ubuntu - How to copy-merge two directories? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/149965/how-to-copy-merge-two-directories/149986#149986). You aliased `rsync` to `ry`, should you alias `rclone` to `rc`? Or create a `cp` alias that uses `rclone`?

+++ {"tags": []}

## Review code

Linting standards create another barrier to entry. You couldn't do a wiki like edit. But don't lint markdown?

How do you feel about approvals on code reviews in general? It's another barrier to entry.

Part of the power of “no” is saying "no" to code reviews. It’s better to say no than nothing. If it doesn’t break anything, then you can treat the content as “don’t care” in your mind.

+++

## Memorization vs. working

Are you looking to memorize content, or just solve a problem? If it's the latter then you can open up a bunch of tabs and just reference them. If you want to remember/memorize something then you should limit yourself to 5-10 tabs, forcing yourself to remember what you can't pull up as easily.

+++

## Classifiers as organizers

A classifier (see [Statistical classification](https://en.wikipedia.org/wiki/Statistical_classification)) induces a partition on a set. Is it the individual classification, or the organization of examples into partitions that really adds value for humans? Knowing a stop sign is coming up wouldn't be useful if you didn't know other kinds of signs that are not stop signs.

We could really go one step beyond classification into non-overlapping sets to provide an order on these sets (e.g. a preorder). Organization into trees (think of common dictionary data structures) is in general an efficient way to retrieve information, both mentally and in a computer. It'd be much easier to describe to someone all the kinds of signs in the world with a tree than a list. See [Categorization](https://en.wikipedia.org/wiki/Categorization) (a synonym for classification) for some thoughts on the psychological aspects involved; is this why category theory is so fundamental to mathematics as well? Are adjectives fundamental to how we think?

+++ {"tags": []}

## Maintain light git history

Having a single git repo with many working trees is essentially the same as a single dvc cache. Until looking up objects gets slow, there's really not a downside to it.

You could pull in a repo without all its history (thinking of HDMA) by stripping history (see [How to Use Git Shallow Clone to Improve Performance | Perforce](https://www.perforce.com/blog/vcs/git-beyond-basics-using-shallow-clones)) and pushing that to some backup location. You can pull that into history, but on the branch that you have that is the original repo you can use a remote that is the original repo with all its history. In other words, you really like the idea of subtree merge (which effectively does this, but with one commit).

+++

## Skipping questions

Why do we skip questions, to come back to them later? Even if we've read all the prerequisites that we need to answer the question, we may not have enough of them memorized to be able to construct the answer using both our memorized logic and working memory. By reading and answering beyond the question, we'll have more time to memorize more of the prerequisities in the context of new problems that are more motivating and novel than the question we've been re-reading.

+++

## Quote Wikipedia

Rather than trying to freeze links to Wikipedia, copy/paste (the same way you would copy/paste code) the content you want into your own material with a quote. This is equivalent to forking the content in a more limited way; you likely didn't read the whole article anyways (and should say so if you did). You can also do this with more than Wikipedia as well; you never read a whole article anywhere on the internet.

Should you have tasks to understand Wikipedia with other articles/content as your alternatives? Rather than the reverse. You'd perhaps only end up reading part of the other content, which could be hard (Wikipedia is better as a reference i.e. for one article at a time).

+++

## Prefer fact to answer

Rather than "q-" and "a-" should you think in terms of "q-" and "f-" where f stands for fact? You like how this contrasts with counterfactual. It's also a fact that "Son child Dad" not so much an answer (the fact can exist without someone asking the question). You can also state the same fact in the opposite way with "Dad parent Son" without regard to any question. It also makes it clear you rely on these "facts" being absolutely true, with no uncertainty. This is related to your recent approach where many experiments (facts) are required to answer a question more confidently (never completely, if the question is large at all). That is, you can really only answer really specific questions fully confidently. See:
- https://en.wikipedia.org/wiki/Fact
- https://en.wikipedia.org/wiki/Question_(disambiguation)
- https://en.wikipedia.org/wiki/Answer

Perhaps you can also get more specific with question, perhaps only allowing why questions (why-):
- https://en.wikipedia.org/wiki/Why

+++

## Short action graph

Part of the struggle with an action graph (git-like graph) is that if you're working iteratively, it's usually small and short. That is, you shouldn't spend too much time in planning, which is scheduling. As long as you know where you "are" at the moment, then an iterative approach can work well.

Perhaps analysis paralysis happens precisely because it's at the border of action and planning, a strange place for our thought processes.

You should have only "actionable" items on your graph, that is, things don't take 20 years (though this depends on the circumstance). The shorter your items, the less likely you'll need to reorganize the chart in a major way.

+++ {"tags": [], "jp-MarkdownHeadingCollapsed": true}

## Fix slow build

Prefer to local nginx server because it's faster, and encourages you to change your code to make it faster:
- file:///home/vandebun/source/personal-notes/bazel-bin/jb/extract_build_book/tmp/_build/html/notes/about.html

Of course you'll always have a slow build because you need to convert a docker image to the OCI format, then back to a docker image to do docker_run_and_commit. This really slow feedback is bad for publishing. When you're trying to organize your notes in a way that involves renames and riskier changes, this drastically slows down progress. It has been especially frustrating today when you’re trying to clean up the JB cache after some renames. You’re not going to reorganize your notes unless it’s fast to do so.

This also has some nasty side effects when you're doing straightforward work. Even if you don't make any mistakes, while the build is running you have to make new comments in either a Google Doc or in local files that you then may have to undo or put in a separate commit if you do need to make any minor fixups.

BTW, to fix a broken jb build (because of renames) you have to (1) pull the latest jupyter_cache directory (and database) into your local copy of the repo (1) delete the entries from 2 tables in the SQL database and (3) as you get “KeyError: 'Cache record not found for NB with hashkey: 181d0c3c549e42ec794c4f93bcbae029'” errors, delete them from the cache as in “rm -rf jb/jupyter_cache/executed/181d0c3c549e42ec794c4f93bcbae029/”. It’s the third step that is painfully slow (once you discover it’s what you need to do).

Faster than step (3) is to take note of the cache md5 keys in step (2) in the `nbcache` table and delete them then.

It seems quite likely you're going to have to go back to docker to be able to use the GPU anyways (assuming you are interested in that). But based on this issue, it seems it's possible:
- https://github.com/containers/podman/issues/15863

You are interested in podman for rootless containers and avoiding all the headaches associated with file permissions when you use docker run. Besides all the extra code you need to write, this has led to e.g. slow builds when your UID is other than 1000 at work (affecting more than just you, and you on multiple machines). In fact, could this be a quick solution to your slow build? If you use podman does it suddenly go away? You should start by getting rid of the GitLab build, though.

That's not all there is to a rename; you also have to change the entries in the TOC and add redirects to `public/_redirects`. It's really not a surprise that you avoid this.

You should always build and commit the jb cache locally, to get in that habit. Don’t let GitLab build it. You need a script to automatically commit and push it, as you have elsewhere.

This slowness also drastically slows you down when you want to add a package to your docker image. You often don’t bother because you don’t want to wait. You’d like to install Xarray right now. It seems like Xarray is how to represent a "database" in the sense of SSC. When you use pandas, it's not clear that dimensions are the same (even if they are the same length). You'd also like to be able to name pandas dataframes. Of course, you may want custom multiplication of arrays anyways.

If you want to "Prefer to local nginx server" can you get rid of the `pn-nginz` container? This exists in a broken state when you reboot vdd and so makes GitLab builds break. You're also spamming your repo with a bunch of tags (`test-jupyter_cache ...`) right now, which probably also wastes a little space in s3.

+++

## Prefer dashes to underscores

Prefer dashes to underscores in filenames and directories. So they show up properly in search:
https://stackoverflow.com/q/119312/622049

Also avoids shift; i.e. faster to type.

However, you should prefer underscores for python scripts you may later need to import (to avoid a rename when you do want to do so).

+++

## Time snacks

Set min 45 minute timer for snack, then have a bigger snack. Don't have one piece of a carrot at a time.

Also have the snack the first time you check the timer and it's OK to. You like how this doesn't interrupt you, the same as setting your watch for Salmon to finish. It seems like you're training yourself to *not* constantly think about food; thinking about food doesn't mean that you're going to get food. Perhaps the same should be applied to when you wake up at night. If it's not past a certain time, you don't get a snack. You'd need your watch (or some clock) by your bed.

You like how this is also a reminder to drink water, and perhaps check your email. It's essentially a time to deal with all pending interrupts, seeing yourself as a computer.

Can you train yourself not to have snacks, though? Hunger is not something that is amenable to simple training; it's too fundamental. More likely you just need to plan on having bigger snacks if you find yourself constantly interrupted by thinking about snacks (and have less at dinner).

+++

## Abstractions, the necessary evil

You can take any particular thought/note and put it somewhere in your notes. What if you have more than one thought, though? Perhaps a whole section. You can really only organize a whole section if you form it into a clean abstraction (e.g. break it up a bit) and then take the clean abstractions you get out an organize them (as a new "whole") into some other larger abstraction.

An abstraction assumes structure, however, and in the process of organizing around one structure you may build a large network that is actually not the best structured for other or all problems.

You could see all your unorganized notes (e.g. a sentence) as an "observation" in order to be able to interpret it as a fact. Then you collect these observations/facts into more organized notes, structuring as abstractions. But in some sense every abstraction is an observation as well; if you do x then y results (a function) is as much an observation/fact as a more plain fact like giraffes are tall. See also:
- https://en.wikipedia.org/wiki/Observation

See in particular the section on "Bias" in `!w Observation`. All observations are made within your existing structure:
- https://en.wikipedia.org/wiki/Schema_(psychology)

+++

## Improve organize notes

Everything has been said before, probably even by you (in your notes).

+++

## Bazel vs. dvc

From [Overview | Data Version Control · DVC](https://dvc.org/doc/user-guide/overview#build-automation-tools):

> DVC uses file timestamps and inodes* for optimization. This allows DVC to avoid recomputing all dependency file hashes, which would be highly problematic when working with large files (multiple GB).

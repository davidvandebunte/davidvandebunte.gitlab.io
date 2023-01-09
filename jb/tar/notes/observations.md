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

+++

## Z-level prioritization

Organizing notes should be first and foremost about prioritization. Visually, you could think about it similarly to how you see Z levels in a drawing. It should be OK to push things all the way down behind everything you're looking at now as long as you know that you know that you're going to be able to remember to look it up later (e.g. friends-and-relations.svg). Ideally, everything that you do supports something that is "visible" to you. If it doesn't support something visible, then perhaps you shouldn't be doing it. If it isn't a significant part of supporting the visible things, then it's less important to work on. Should you set priorities via a picture of disjoint sets of what you care about in your life? Perhaps you could use this to learn layers in Inkscape. It seems like people would dominate the highest levels, then technology to support people at lower levels.

You like how this approach is similar to the concept of compression. At work, you'd make the "visible" elements things like F1 score. The causal logic is then from the back to the front of the image. You also like how this lets you take advantage of three dimensions (at least think in it) when typically Inkscape is limited to two. You also like how this focuses your "attention" as in attention mechanisms on the most important things, with exogeneous orienting. You've already been thinking to require a time axis on all causal diagrams (making it explicit so you assign some units/scale to it and label it for others). Of course, you could also make the time axis in the Y direction (vertical) and give more Z levels to more important goals (but this seems less natural). Your "improve improve" tasks would also naturally go to deeper Z levels.

Ironicallly, you may want to save the time dimension into Z-levels (or layers) so that if you ever want to create a visualization of your layers as a GIF (exporting as batch) the time dimension in your GIF will match the time dimension you were thinking about.

Should this view reflect how you spend your time? No, because many things are important to you but aren't going to take your time. Your child's health may be important to you, but you have others to help with it (including the child, eventually) and you're not an expert in healthcare. That is, if you're not the best at something but it's important to you, outsource it.

![x](z-level-compression-example.svg)

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

# Prefer fact to answer

Rather than "q-" and "a-" should you think in terms of "q-" and "f-" where f stands for fact? You like how this contrasts with counterfactual. It's also a fact that "Son child Dad" not so much an answer (the fact can exist without someone asking the question). You can also state the same fact in the opposite way with "Dad parent Son" without regard to any question. It also makes it clear you rely on these "facts" being absolutely true, with no uncertainty. This is related to your recent approach where many experiments (facts) are required to answer a question more confidently (never completely, if the question is large at all). That is, you can really only answer really specific questions fully confidently. See:
- https://en.wikipedia.org/wiki/Fact
- https://en.wikipedia.org/wiki/Question_(disambiguation)
- https://en.wikipedia.org/wiki/Answer

Perhaps you can also get more specific with question, perhaps only allowing why questions (why-):
- https://en.wikipedia.org/wiki/Why

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

# Bazel vs. dvc

From [Overview | Data Version Control · DVC](https://dvc.org/doc/user-guide/overview#build-automation-tools):

> DVC uses file timestamps and inodes* for optimization. This allows DVC to avoid recomputing all dependency file hashes, which would be highly problematic when working with large files (multiple GB).

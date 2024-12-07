---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Organize notes

+++

Your notes are a more persistent (see [Persistence](https://en.wikipedia.org/wiki/Persistence_%28computer_science%29)) version of your mental sub-networks; they are (arguably) much larger than your mental sub-networks but slower to load (tradeoff). Your notes are not what you know (your biological neural network, BNN). As such, they are are prone to "degradation" as you learn more (your BNN gets ahead of your notes) and as your mind throws away what were once mentally active thoughts/notes from working memory, long-term memory, etc. (you forget). See also [Working memory](https://en.wikipedia.org/wiki/Working_memory).

+++

All your notes were also not taken at the same time; you likely had different contexts in mind when you took all of them (especially if they are in e.g. different files or formats). Therefore there's a significant chance that you took notes that "conflict" even in your own mind, when you see them next to each other.

+++

The value in organizing your notes is that you'll be able to "fix" undesirable differences between your notes and your BNN.

+++

## Fewer conflicts

+++

Fixing conflicts are especially valuable, since making a mistake in your notes (similar to making a mistake on an academic test) makes it highly likely you'll remember the thought. Not only will you remember the thought, it will likely be important to remember, and you'll have fewer notes making reloading the instructions into your memory faster.

+++

However, achieving conflict reduction doesn't require explicitly going to look for notes that are conflicting. The best way to reduce internal conflicts in your notes is likely just to search for notes that are similar to what you are thinking about at the moment.

+++

## Faster mental reloading

+++

Organizing your notes is valuable in the sense that they become more readable, which allows you to use them more for refreshing mental networks. Even if conflicts don't exist, you may be able to tweak wording, remove redundant thoughts, relearn from a public resource, and make other changes to make reading the notes you read regularly faster next time. In symbols:

+++

$$
\frac{\partial Value}{\partial SizeNotes} =
\frac{\partial Value}{\partial ModelReloadSpeed}
\frac{\partial ModelReloadSpeed}{\partial SizeNotes}
$$

+++

If these are both high, consider making a ∂SizeNotes. For example, could you change ModelReloadSpeed to 8 minutes from 10 minutes with a ∂SizeNotes? Do you use it once a week? Then you save 2 minutes/week. See the end of [](./estimate-improvement-value.md) for a similar example; it's critical to do this calculation before any large organizing effort because sometimes you aren't reading your own notes (in certain areas) anymore.

+++

Your ModelReloadSpeed is analogous to checkpoints in PyTorch; being able to reload your thoughts quickly is important to be able to continue to improve those thoughts incrementally (every time you come across a situation where you need them). This includes checkpointing the whole model, and gradient checkpointing during a forward pass. In general, you're restoring activations.

+++

Archiving notes in version history is removing duplication between your memorized mental functions and your notes. One major implication of this is that when you [share notes](./share-notes.md) you're often only sharing highly compressed mental functions that may sometimes only be useful to you; one cost of sharing notes is that you often need to [redact](./redact.md) content, in particular your own jargon. This usually means higher quality notes for your readers.

+++

Reducing the size of your notes is equivalent to being able to think more deeply about a topic, where "deep" in this context means between multiple levels of mental functions. Not only are you thinking deeply while in focused work through the temporary memorization of large chunks of your notes, you are making it easier to think more deeply the next time you open your notes. That is, by removing notes you reduce the length of the notes you need to read in every file before you follow a link to another file.

+++

### Fewer unmemorized networks

+++

Your mind has a pointer to your notes. From there, your notes have pointers to other content your mind has consumed in the past. Your mind keeps tracks of double and triple pointers to help it get back to content that is knows has the answer to problems it is looking into. For example, you often remember you can get to some web resource through your notes.

+++

Organizing your notes makes function discovery faster. That is, replace a search of your notes with a jump to the notes you know have a solution or partial solution, or perhaps with a jump to some place in your notes that is closer to what you are looking for.

+++

Said another way, notes you leave unorganized are often those you are happy to only be able to find in a search, or are happy to not be able to find quickly.

+++

However, removing unmemorized networks is of limited value. If you aren't reading digital notes any longer, likely because they've been superseded, do they need to be removed? It takes to read old notes, even if they are completely obvious and easy to read. We don't save the paper exercises we did in middle school when we learned basic mathematics; at some point we're able to rely on references (such as Wikipedia) if recall is necessary at all. Said another way, unused notes don't have as high a maintenance cost as unused code. The best way to remove distracting notes is likely just to search for notes that are similar to what you are thinking about at the moment, and remove them when they are distracting you.

+++

## Faster prioritization

+++

Clean notes make prioritization easier; if you can easily see the big picture as you follow [Plan personal week](./plan-personal-week.md) it's easier to backpropagate from what you want to do to how to do it. Said another way, organizing (removing notes) lets you think more deeply as explained above, and with respect to your values as well as your costs.

+++

When would you sit down and focus on math? The benefits of learning some math concept will likely apply to many functions all over your whole life network. Most of the time, though, you can "get by" without learning the math in a particular area. That is, learning a mathematical concept often reduces duplication across your whole life network (making it more efficient) but you can't see that duplication unless it's easy to see the big picture.

+++

Said another way, an action to learn some math concept has cost lowering value in many places across your life network. You need to take the time to enumerate and then add these objective function terms (even if informally) to get the proper weight for a mathematical learning action.

+++

It's usually more important to organize your notes so you can see subjective weight than it is to put numerical estimates on the actions you plan to do (which is why it's rare to get to numberical estimates). The uncertainties would be so large on numerical estimates they'd be nearly useless.

+++

How do you make big decisions, such as getting married or switching employers? These are difficult probably partially because they imply a global setting of priorities, which implies a global organization of your notes. That is, you need to have a global understanding of your values and common costs and how switching employers may help you achieve your values or lower the cost of tasks you commonly do. If your notes aren't organized, you can't quickly change jobs. This is a major risk; your status can change quickly at any job.

+++

Spending more time organizing notes is like using [Hamiltonian Monte Carlo](https://en.wikipedia.org/wiki/Hamiltonian_Monte_Carlo) rather than the [Metropolis–Hastings algorithm](https://en.wikipedia.org/wiki/Metropolis%E2%80%93Hastings_algorithm) or Gibbs sampling. According to Jayne's principle, spending a little more time thinking about what your next step will be can give you dramatically better results.

+++

### Identify 10x credit

+++

Few people consider the double, triple, or 10x credit you can often get in certain areas. For example, learning a new math concept or natural language model (abstraction) might be useful in a huge number of the future projects you hope to work on in your life. More often we find what feature would be most valuable in the component we are looking at in the moment (in the largest context we decide to plan within) and pursue that.

+++

It's only after reviewing a huge amount of your notes (which include various e.g. life goals and projects) that you'll be able to see if you're getting double or 10x credit from a particular abstraction. As you organize your notes more, more of it will become links to external resources as you exhaust your own thoughts, or come to questions you know you could answer better with outside resources.

+++

In school, professors often trying to encourage a big picture view through projects. This is similar to a PhD, the ultimate school-based project. They want you to see take a bunch of coherent notes for the project, even if you don't connect them at a whole life level. Your notes can theoretically fill this role at the whole-life level.

+++

You need to regularly organize to compress questions that are essentially equivalent or highly related. That is, you can reduce your backlog of open questions by finding nearly equivalent questions. If every question has a "target" of value for what it intends to cover, you can expand the "target" to cover more questions (get them out of the high-level view).

+++

## More self-discovery

+++

Would you rather discover some concept by building the concept up in your own notes, or by reading it in a book? If you read it in a book first, you'll need to slowly connect it back to all the language you already use to describe the world. Sometimes, reading a book is only about learning new words for concepts you could already explain in your own words (your own functions).

+++

If you discover it by building it up in your own words (deriving it yourself) you'll already have a connection to your own words. You won't need to slowly piece together how the new concept fits into your own notes, and reorganize files and functions appropriately.

+++

In some sense, having a version of all concepts you care about in your own words is like allowing yourself to make your own definitions (like the author of many textbooks must do). These articles will pursue definitions that match Wikipedia, but when Wikipedia's definitions aren't enough we'll come up with our own (essentially comment on a bunch of Wikipedia articles in a new article). That is, these articles (and anyone's own notes) attempt to build a "mountain" of knowledge; to do so requires tracking custom dependencies in case the mountain must be rebased.

+++

Would you rather archive or forget? At least when you archive, you have a choice. Don't throw away ideas that you put a lot of thought into at one point; at least you learned that you spent too long trying and failing to reinvent the wheel.

+++

In theory, you should be able to web search the answers to all your questions by finding the answer on SO. The issue is that you often don't have the words until you organize your notes how to succintly find what you're looking for online. Still, you can start every question with a web search and iterate on the question wording.

+++

When all your thoughts are connected and your notes are clean, every project becomes less risky in terms of whether you're going to fail to learn anything long-term. If you take on a project where you don't understand all the justifications for what you're doing, not only are you going to be more likely to fail to get it to work, you're not going to remember what you did learn if you don't get it to work (because you'll assume what you learned wasn't helpful, and won't know what you missed). If you build up your thoughts based on other thoughts in your notes, then even if you fail farther downstream you'll still have built up some knowledge. In some sense, this is encouraging the "small" in INVEST strategy.

+++

An inability to fall asleep from not being able to stop thinking indicates just how important self reflection (taking notes) is. If it were optimal for us to lay down and immediately fall asleep, many more people would have the ability.

+++

### Avoid duplicate learning

+++

You should pursue difficult goals, so that you don’t get lost in simple online classes (that you’ve learned before and are just refreshing yourself on). Is it better to attempt to learn from something really complex, as opposed to too simple? You can always fill in holes with a web search. But if it's too simple, you're stuck wasting your time. If you’ve learned something once (linear algebra, programming language, etc.) you shouldn’t take a class or whatever to relearn the basics. You can fill in the missing holes in your knowledge as you work on higher-level goals by just googling it.

+++

This implies you should actually prioritize learning activities based on holes in your knowledge (good questions) rather than based on the recommendation of someone else (e.g. a professor or curriculum) once you are "drowning in software" (i.e. notes) as you get older. Start from your notes. This approach also avoids relearning new words for the same concept, as you may have experienced while reading e.g. statistics textbooks.

+++

### Relative to experimentation

+++

All the work you do to solve problems at your job is only in hope of finding errors in your ways of thinking (i.e. learning). Organizing your notes, on the other hand, is a much more direct way to uncover your thinking errors so you can fix them. You can do a lot of work and discover no errors when you're writing code when your notes are full of questions you haven't been able to answer.

+++

Said another way, why work on a personal project (e.g. predicting your weight) if your goal is to learn? If you want to learn, that is, fill in the most critical holes in your knowledge, go for that directly by organizing your notes. This is the same experimentation vs. theory choice we make when we're working on refactoring code; usually prefer theory.

+++

### Separating truth and optimization

+++

Many engineers feel they want to focus on optimization to some particular truth, and aren't as interested in e.g. how exactly e.g. a traffic sign is defined (the truth). This exposes you to concept drift, of course, as discussed elsewhere. To do optimization in your personal life, though, you do need to think about your fundamental values and where you want to go.

+++

In particular the mental models you construct (your language models) i.e. the words you learn are going to depend on what you value.

+++

## Faster feedback

+++

Reduce process delay, because humans are slow. Automation is the same as performance improvement; both are justified by faster feedback. If you have to do it twice, who else has to? Talk to your team (or manager) to get credit for solving a tragedy of the commons issue.

+++

### Value feedback

+++

Measure customer feedback faster. Detect and resolve defects faster with the help of the customer. Are you pursuing human feedback?

+++

### Correctness feedback

+++

Automate or clean up notes to avoid mistakes; how error-prone is your process? These are the same reasons to reproduce faster when looking into a defect.

+++

Learn faster with faster feedback. To prove deep learning models are correct, you often need to run long-running tests. It's often more efficient to get the theory right first (if you have a general preference for theory to experimentation in the domain).

+++

When you refactor code, you can't "skip" organizing (refactoring) a certain part of the code. If you did, your code would crash. If you have unorganized notes, it's likely they are incorrect notes.

+++

## Faster publication

+++

Someone besides you can do it if you "automate" it at least in the form of process documentation; this allows you to sell it (preferably to another engineer) so you can get credit for it and get others to develop it.

+++

The best place to organize your notes is into the source code, if there is associated code. See thoughts about TODo in [Plan personal week](./plan-personal-week.md).

+++

This action also makes it easier to [share notes](./share-notes.md). It's often not possible to get feedback on your personal content until you've reached a minimum level of quality. Others are (reasonably) going to ignore low-quality content, and perhaps you in the end.

+++

Many tasks you don't need to ever recall again; you have many SO questions and answers you don't care to look at anymore. Next time, start public (e.g. on SO) rather than removing or converting your private technical notes.

+++

Before publishing your thoughts, you should make a reasonable effort to remove ideas that are already maintained elsewhere, in better documentation online. The primary purpose of organizing notes is to archive them, effectively reducing them to a list of links useful to you (which you can publish).

+++

## Easier focus

+++

Organizing notes is much more like play than e.g. solving problems at work or even working through the problems in a textbook. When you're working through a textbook, you should see it more like play. The point is to learn, not to work. Taking notes as you work is one way to make it a little more like play (and organizing notes).

+++

Said another way, organizing notes is the ultimate in thinking slowly (avoiding panic).

+++

### Focused work

+++

Have you ever noticed how easy it is to focus when you're organizing notes? Or closing tabs in Firefox you want to keep (moving to notes). In general, it seems like tasks you know are high priority are easier to focus on; if you're unsure how important some task is you quickly lose sight of e.g. what you were doing and go looking for a snack. We often say that focused work is critical, but it's nearly impossible to stay focused unless *you* believe what you are doing is important (you understand how everything connects).

+++

# Test

+++

You've re-read a (pre-determined) section of your notes, modifying it as necessary.

+++

Alternatively, you've specified some amount of time to give to searching for the same term you're thinking about in your notes.

+++

## Organizing principle

+++

This document uses "[organize](https://en.wikipedia.org/wiki/Organizing)" without clearly defining what that means. The typical human will picture a transformation similar to the following; both pictures coming from [Professional organizing](https://en.wikipedia.org/wiki/Professional_organizing):

+++

![x](https://upload.wikimedia.org/wikipedia/commons/2/2a/Basement_before.jpg) | ![x](https://upload.wikimedia.org/wikipedia/commons/6/6b/Basement-after.jpg)

+++

The problem with using the unadorned word is that there's no one right way to organize (a principle often stated in category theory). We must always organize around some defining [Organizing principle](https://en.wikipedia.org/wiki/Organizing_principle), that is, the way we think that organization should be done.

This implies that you are really just regularly doing a rewrite of your notes (build one to throw away). There's nothing necessarily wrong with this, but it does imply that you can never reach some final correct state. We consider a few optional organizing principles below to select from.

+++

### Visual (Space)

+++

If possible, organize [visuo-spatially](https://en.wikipedia.org/wiki/Spatial_ability). This is a natural way for people to organize and makes it easy to create mental links, in a compressed form (see [Spatial memory § Long-term spatial memory](https://en.wikipedia.org/wiki/Spatial_memory#Long-term_spatial_memory) and [Visual memory](https://en.wikipedia.org/wiki/Visual_memory)). One killer application for this kind of organization is house floor plans; these are useful for placing both permanent structures such as walls and impermanent structures like furniture. Even if e.g. you're only moving between apartments, planning where to put furniture in the new apartment with a floor plan can save time.

+++

This is also a reasonable strategy for medical documents; eye care documents and records from eye doctors could be linked to from your eyes on a drawing of your body. Your stomach could get food management documents, and your feet could get shoe-tracking documents.

+++

For abstract logic, you often can't do this. Processes and procedures can be converted to a visual form (such as a wiring diagram) but are often better documented first directly as text. In a textual form, processes can be more quickly and efficiently reorganized into new processes and can be individually executed. Once a process is well-established, it may be reasonable to document it in a visual form in addition to the textual form (perhaps a third redundant form, if it's already documented in English and a programming language).

+++

### Actions and processes

+++

See **Process Document Template** below. This document describes organizing notes in term of an optional action, one to consider among e.g. a long list of actions one is considering. This suggests that the theory of [Reinforcement learning](https://en.wikipedia.org/wiki/Reinforcement_learning) is the best organizing principle for it, and it will be well-organized for the purpose of planning tasks.

+++

Organzing by action is also useful when you need to document a process or procedure. Multiple actions can be chained together to create a larger process. This is often an appropriate structure in the context of a business when a large system managed by multiple teams <!-- think CTO book, starting from the AMA format --> needs documentation. Said another way, this is organizing in terms of logical dependencies and how inference effectively works.

+++

### Time (History)

+++

Once someone has invented (or precisely defined) an English word in some useful way, it's unlikely that future human development will redefine the word significantly rather than define a new one (many short words are unused or available for reuse). For this reason, pedagogical material often ends up being organized historically and it's helpful to understand the [History of mathematics](https://en.wikipedia.org/wiki/History_of_mathematics) to understand math. One way to define "learn" is to gain the ability to reuse words others have invented rather than inefficiently re-invent them yourself (likely based on the "wrong" word).

+++

The ubiquity of `git` is a testament to the value of retaining historical versions of records for the sake of reusing them (on discovering the new "better" way isn't better). Wikipedia is organized around words, and how a word is defined is based on the collective understanding of many humans, typically a product of history.

+++

Organizing "historically" also lets you put notes you want to read at some point in the future on the same timeline (though the future timeline may look like a DAG, because of uncertainty).

+++

# Estimate cost

+++

## Reading time

+++

A rough way to estimate how long it will take to organize notes or process documents is how long they are; web articles (inaccurately) automatically estimate reading time based on the length of the article. These estimates can likely be made much more accurate with a simple scale factor to the familiarity you have with the notes (whether e.g. they are your own work or a summary of other material, how old they are in either case). Still, you're always free to skim (see [Speed reading](https://en.wikipedia.org/wiki/Speed_reading)); to skim is to "sample" the content for quality or novelty.

+++

How much effort it will take to change the process will critically depend on how fast feedback is. If feedback is slow, you'll forget what you were working on and e.g. need to schedule calendar reminders to push the process forward. That is, include in your time cost estimation the cost of coming in and out of focused work.

+++

Based on a reading of this whole article, when do you think you should stop organizing notes? Pick a percentage to use as a heuristic; when you hit this point stop organizing and effectively archive the rest of it, removing the file with the old notes (or e.g. replacing a Google Doc with a pointer to a web link). If you are in focused work on the subject now and can identify what is valuable, then there should be no need to come back to the notes later. That is, pick a percentage where you archive a bunch of notes holding you back and start learning from the outside world.

+++

Should you adjust this percentage on a case-by-case basis depending on what notes you are organizing? If you use the notes rarely (heuristic indicating less valuable), you should organize them now because you'll be starting cold when you get back to them and every time you get back to them. If you use them regularly, there's more value to be gained from organizing them. If the notes aren't important at all, you should leave them untouched.

+++

## More unnecessary recall

+++

Your mind (BNN) naturally throws away mental models and abstractions you are not using regularly. It throws away training data that has already been thoroughly compressed into e.g. some abstraction. It may often be the case that it is throwing these away for good reason; reading through notes of this kind is mostly wasting your time.

+++

When you encounter notes of this kind you can either archive them in version history (the simplest solution) or move them to an article or under a heading where you know you're less likely to read through them (such as "Assumptions" or "Training Data"). Both should be available to readers.

+++

### Aggressively archive

+++

It's a waste when you're not able to forget because you've read a reminder many times, but don't want to archive it. At this point, you're filling your precious mental network with low weight notes or wasting time reading something you already have memorized. Your mental network is expensive like cache is expensive relative to RAM or disk (but the lost time is most important). The thoughts are never lost, just less available (you can always search history).

+++

Unlike code, you don't need to read all your notes to be mentally "up to date" (that is, there's little to nothing you're missing in BNN stored somewhere in your notes). Your oldest notes will likely be irrelevant for a complete updated understanding of where your BNN are on a subject. When you reach a point where a certain percentage of the notes you are reading are irrelevant, you should probably start to pursure an outside understanding of the concept.

+++

Because you don't need to read all your notes, and they don't run (zero machine time as well) you could also "archive" them by leaving them behind, as opposed to "archiving" them by putting them in version control. You could "archive" them in a more permanent sense when they actually cost you something (e.g. showing up in a `git grep`). This would be a good time to remove them, when you're thinking about (searching for) the associated topic. Still, aren't you thinking about the topic now? It's likely better to archive the notes to prevent unnecessary recall now; you could also search history for a word. How will you know that you already hit a certain percentage (the quality of the "mine") when reading the notes later, unless you put it in version history?

+++

### Allow minor rederivation

+++

When most of what you're reading (e.g. a certain percentage) has been unhelpful, you also know it's likely that much of the rest of the document you'll be able to rederive in one way or another later as you continuously take more notes.

+++

## Skip directories

+++

Should .md and .py files be organized into directories? When you write code you organize into directories, but how often? Only if there is a clear requirement to do so. Put off organization into directories for as long as possible, and put a lot of files into a directory. Gmail encourages organization by tag rather than directory; use these when they are available. Tags can be multi-level like directories.

+++

Organize into directories when you have a need, that is, you are running out of namespace. You can also do so when it's clear you want to use the same group of names in two different contexts, to avoid a lot of prepending the same prefix to many articles (as a quick way to get more namespace when you realize you need a lot more of it).

+++

## Reduce commit frequency

+++

How often should you commit natural language notes? When you're writing code it's clearer when you need to commit; you go until you run one or more tests and they pass. Is it always this clear, though? Sometimes we commit based on when we "feel" we've introduced enough risk, if not for the testing cost, but then continue to build up a bunch of commits to the point where we've likely broken something.

+++

This is related to optimizing hyperparameters with slow feedback; when tests are expensive you don't test every commit because you can make code changes faster than the computer can keep up. You should only be limited by how fast the computer can keep up; if your testing process isn't automated then you're limited by your own time (manual processes).

+++

% See also optimize-slow-hyperparameters.md

+++

This is also related to [Share notes](./share-notes.md). Are you more often running tests that give you human feedback or computer feedback? If you aren't publicizing your notes, they won't be tested. If you aren't going to ask anyone specific to read the notes, then this is less important.

+++

A major difference is that in your notes you'll never bisect anything. When you do something that doesn't work, you simply remove the notes. Or, you take notes in a "Training Data" section about what doesn't work and why. Or, you write down in the "Costs" section why to avoid an action.

+++

Of course, simply putting in more thinking on a topic is like running tests (inspection, which is a probabilistic test i.e. it may catch different issues every time). By not thoroughly reviewing uncommitted changes to notes before committing them, you're effectively not running your most basic tests (thinking through it). Try not to leave half-finished sentences in your notes.

+++

The advantage to committing notes is that once you're done with the commit you can move on to something else. You are done with the action of taking a note or capturing a thought. However, you are almost by definition in focused work on the area of notes that you are updating and have not committed. If you assume connected thoughts, you'll be making more notes in the area soon and will only be adding overhead of more git commits by immediately committing your changes.

+++

### Automate commits

+++

When you are organizing notes, you obviously commit changes. When you're only communicating with yourself, and when all that is in the commit message is natural language anyways, there's little need to a long commit message. Instead, record `vim` macros that automate most of the commit process for you. Rapid commits also support staying in focused work.

+++

## Don't reinvent

+++

Let's say that you could get a bunch of programmers (or computers) working for you, experimenting with a bunch of models to see which ones produced the best results. Would you want to see all the failed experiments, or learn only from the best ones? You do care about the model search (about the failed experiments) but only to the extent that those experiments teach a lesson that you are not aware of, that will be important in future tasks. It's less likely that failed experiments have these lessons than successful ones (though all include lessons).

+++

When do you stop organizing your notes? Often, when you believe there is some external resource that will help you organize them faster than you would be able to yourself. That is, when you believe there is some resource that will help you avoid reinventing the wheel. When you're confused by a causal problem, for example, it may be better to read a book on causality than to try to figure it all out on your own.

+++

You sometimes give up organizing notes because you run into a question that you can't quite answer, and just want to move on. In that case, it's right to leave the question, and pursue an outside understanding of how to answer it.

+++

Another good heuristic is when you're starting to link to the same article from too many places (e.g. the Wikipedia article on some complex subject). It's probably good to have 2-3 references in different places before you start investigating the topic in more detail, but 5-6 might be too many. Multiple references does not indicate in itself that the abstraction will have high instrumental value in the future; only that it is likely to because you've clearly found multiple online resources that all take advantage of it (which is the best you can do when you only understand the concept at a shallow level). Search engines use the same heuristic to rate websites.

+++

It's when you reach the "end of your notes" that you typically store all your external resources and make your references to them into future tasks (essentially put them off). Be sure to put time estimates on an understanding of external natural language resources; it's much less predictable how long it will take to read an external resource because you don't know how far you will have to dig into dependencies i.e. learn new words and abstractions; you've filled all these dependencies in your own notes.

+++

Another good heuristic to indicate you should "stop" is when you're starting to write a lot of new notes on a topic, rather than only connecting thoughts across documents. If you're writing a lot of new notes, then you may be reinventing a wheel that you could instead pull in by reviewing the research. If you are removing at least some notes all the time as your organize, keep track of whether you're adding a large amount of notes relative to how many you're removing over the course of e.g. the last few commits. If you're removing more than you're adding, you can almost surely keep going.

+++

If you're using `git` the command is:
```bash
git diff --shortstat
```

+++

## Set a boundary

+++

Often we write notes when we aren't sure if we will need them again; we "test" if they are ever recalled rather than rely on theory (guess if we think we'll need the notes again). That is, there's value uncertainty in whether some particular way will end up being the best way to reach a goal.

+++

The random thoughts that you have throughout the day are not in priority order; you usually think about and focus on what is focal rather than what is important. If you were to organize all your thoughts, you would end up "organizing" (improving) all these random thoughts rather than working on the most important networks in your life. When you are prioritizing, you need to be willing to keep items in a "box" and not dig into them.

+++

Organizing notes is similar to the linting argument people have about whether we should fix all linter errors over the entire codebase vs. doing it one piece of code at a time. When you discover something new by organizing your notes (or reading other's material) you could go over all your notes and use this understanding to "test" it all. If you were to organize your notes without a boundary every time this happened, you would not only spend a lot of time re-reading notes, you'd get into many thoughts that were merely saved because they were focal (not important). Said another way, limit your organization to high-value notes. Why clean up notes you will eventually archive?

+++

What if you aren't sure if you're going to need notes again? That is, you might find them in a search and then find them useful again? You may be legitimately uncertain if notes are useful. Said another way, both code and notes can be unused. It's more obvious when code is unused, though sometimes we find unit tests for code that isn't used in production. In both cases, focus on the important content (not all of it).

+++

### Organize thoughts

+++

You can run out of CPU, disk bandwidth, or network bandwidth, and your program doesn't crash. Why does it crash when you run out of memory (OOM)? What do you humans do when they run out of memory? We seem to understand that when we put too much on our plate, everything falls apart, and simply avoid it.

+++

Unorganized notes are a sign of not having enough memory to solve problems in a particular area. It's like using swap; we can't fit everything in our head so we have to write it down. This is a problem if we move on to another task, then when we come back to the same topic (much later) we restart with a "blank swap" (i.e. we take notes in a new place).

+++

It's not wrong to have notes that are unorganized at a "global" level; just like you won't ever see a hard disk that's smaller than RAM you aren't taking enough notes if you can fit them all in your memory. We have multiple purposes in life, and it's unlikely it would be efficient to connect our notes on all of them together.

+++

Why organize your notes? Why organize your thoughts? If you could do everything with the limited memory available in your head, you would never need to take any notes. Said another way, a "note" is a "thought" in a written form; they are not the same thing and you shouldn't use the same word for them. You start to take notes when you can't fit everything in your head; how do you consistently identify when you hit this point? When you are no longer removing notes (compressing) as you organize.

+++

What is manual data collection? It's taking notes, but typically in a numerical form. For example, when you record your weight on a daily basis you're taking notes. Said another way, you're making sure you remember e.g. your body weight on a particular day, because you're not going to remember a few days from now. You don't want to take a lot of notes, or maintain a lot of notes, for the same reason that you don't want to do manual data collection. Let someone else store the notes, but make sure the notes are in as compressed a form as possible so that you can consume them without a lot of reading (by consume, recall the topic back into your mind).

+++

This perspective on manual data collection is a useful way to see spreadsheets. When you're working with small data (which you should be initially) it helps to be able to easily delete and copy observations (rows) the same way you would delete and copy English notes. It can be faster to add or edit data this way than through a less flexible e.g. web interface.

+++

The best way to organize your notes with this goal in mind is not to read pre-determined sections, but search for words on a particular topic. Because you can't help but use many of the same words to describe the same concepts, this will be more effective in identifying those areas where you've started new notes on a topic that you already had thoughts on.

+++

# Training Data

+++

## Process Document Template

+++

This document (Organize Notes) serves as the template for any process document.

+++

Your assumptions are equivalent to your training data or ground truth. In many cases your ground truth is a definition, such as taxes or mean average precision. These are the worst functions to deal with because you'd prefer to get the function from a library. The problem with getting it from a library is you can't backpropagate into it; you can't get the output you want from it because you only understand it as a black box. You've also called these fully specified functions. Who defines the truth?

+++

In many cases, there is no function approximation required (e.g. tax functions, scheduling algorithms based on weight). These kinds of functions are either fully specified or simple enough we can achieve one hundred percent accuracy. Still, uncertainty can exist in the inputs (e.g. `pint`).

+++

## Language

+++

This article uses the term "organize" rather than "refactor" because the former term is more unique to natural language notes. It also prefers "organize" because that's what we'd use colloquially to describe what we're doing; you wouldn't tell anyone e.g. you were going to go refactor your notes.

+++

% See backprop-?.md documents for how important it is to organize your mental model in documents.

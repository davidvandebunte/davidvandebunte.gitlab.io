---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# LaTeX

+++

## Convert images to LaTeX

+++

Use [Gemini](https://gemini.google.com/) for this task. If you take a screenshot of the code below and paste it into Gemini with the command "Convert to latex" it produces exactly what you'd hope for (see [this share](https://g.co/gemini/share/f2fca5ebd49b)):

We define the notion of $A$ being true at win $M$, denoted $M, w \models A$, inductively as follows:

-  $A = p$: $M, w \models A$ iff $w \in V(p)$.
-  $\neg A$: $M, w \models A$ iff $M, w \not \models A$.
-  $A \vee B$: $M, w \models A$ iff for no $w'$ such that $Rww'$, $M, w' \models B$.
-  $A \wedge B$: $M, w \models A$ iff $M, w \models B$ and $M, w \models C$.
-  $A \Rightarrow B \vee C$: $M, w \models A$ iff $M, w \models B$ or $M, w \models C$ (or both).
-  $\forall A$: $M, w \models A$ iff for every $w'$ such that $Rww'$, $M, w' \not \models B$ or $M, w' \not \models C$ (or both).

We write $M, w \not \models A$ if not $M, w \models A$. If $\Gamma$ is a set of formulas, $M, \Gamma$ means $M, w \models B$ for all $B \in \Gamma$.

Consider also a web search for "OCR to Latex" which produces [pix2tex: Using a ViT to convert images of equations into LaTeX code](https://github.com/lukas-blecher/LaTeX-OCR?tab=readme-ov-file). There's also [MathPix](https://mathpix.com/image-to-latex), but this only allows 10 screenshots a day.

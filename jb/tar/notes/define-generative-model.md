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

# Define generative model

+++

## Value

+++

The term is popular. Does it provide a useful abstraction?

+++

## Cost

+++

### In practice

+++

The term is part of the name GAN, which is a model, so it must be one (at least to the author in
2014):
- [Generative adversarial network](https://en.wikipedia.org/wiki/Generative_adversarial_network)

According to OpenAI (2016), a generative model is:
- [Generative models - OpenAI](https://en.wikipedia.org/wiki/OpenAI#Generative_models)

This commentator defines both VAE and GAN as generative models:
- [What are the fundamental differences between VAE and GAN for image generation? - AI SE](
https://ai.stackexchange.com/questions/25601/what-are-the-fundamental-differences-between-vae-and-gan-for-image-generation#comment40656_25601)

A simple and up-to-date definition:
- [Background: What is a Generative Model? | Generative Adversarial Networks | Google Developers](
https://developers.google.com/machine-learning/gan/generative)

According to [SR2](./sr2-review.md), all Bayesian models are generative. It's likely the word
"generative" was initially created to provide a hypernym (umbrella term) for both Bayesian models
and GANs, which both generate observations (later AR models like PixelRNN were added to the mix).

+++

### Tertiary definition

+++

In the following article, Wikipedia defines (going back to 2002, 2004 references) what a generative
model is and at least two things it is not:
- [Generative model](https://en.wikipedia.org/wiki/Generative_model)

See also:
- [Discriminative model](https://en.wikipedia.org/wiki/Discriminative_model)

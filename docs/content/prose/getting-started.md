---
layout: section
slug: getting-started
weight: 0

title: 'Getting Started'
description: |
  An introduction to prose, a Go library for natural language processing.

sections: [
    { title: "Introduction" },
    { title: "Installation" },
    { title: "Tokenizing" },
    { title: "Tagging" },
    { title: "Transforming" },
    { title: "Summarizing" },
    { title: "Chunking" }
]
color: purple
js: [
  table.js
]
code: true
---

{{% article Introduction %}}

`prose` is Go library for text (primarily English at the moment) processing that supports tokenization, part-of-speech tagging, named-entity extraction, and more. The library's functionality is split into subpackages designed for modular use.

See the [GoDoc documentation](https://godoc.org/github.com/jdkato/prose) for more information.

{{% /article %}}

{{% article Installation %}}

> **NOTE**: When using some vendoring tools, such as `govendor`, you may need to include the `github.com/jdkato/prose/internal/` package in addition to the core package(s). See [#14](https://github.com/jdkato/prose/issues/14) for more information.

```shell
$ go get github.com/jdkato/prose/...
```

{{% /article %}}

{{% article Tokenizing %}}

Word, sentence, and regexp tokenizers are available. Every tokenizer implements the [same interface](https://godoc.org/github.com/jdkato/prose/tokenize#ProseTokenizer), which makes it easy to customize tokenization in other parts of the library.

```go
{{< id="example1" src="ci/prose/test_tokenize.go" >}}
```

{{% /article %}}

{{% article Tagging %}}

The `tag` package includes a port of Textblob's ["fast and accurate" POS tagger](https://github.com/sloria/textblob-aptagger). Below is a comparison of its performance against [NLTK](http://www.nltk.org/)'s implementation of the same tagger on the Treebank corpus:

| Library | Accuracy | 5-Run Average (sec) |
|---------|----------|---------------------|
| NLTK    |    0.893 |               7.224 |
| `prose` |    0.961 |               2.538 |

(See [`scripts/test_model.py`](https://github.com/jdkato/aptag/blob/master/scripts/test_model.py) for more information.)

```go
{{< id="example2" src="ci/prose/test_tag.go" >}}
```

{{% /article %}}

{{% article Transforming %}}

The `tranform` package implements a number of functions for changing the case of strings, including `Title`, `Snake`, `Pascal`, and `Camel`.

Additionally, unlike `strings.Title`, `tranform.Title` adheres to common guidelines&mdash;including styles for both the [AP Stylebook](https://www.apstylebook.com/) and [The Chicago Manual of Style](http://www.chicagomanualofstyle.org/home.html). You can also add your own custom style by defining an [`IgnoreFunc`](https://godoc.org/github.com/jdkato/prose/transform#IgnoreFunc) callback.

Inspiration and test data taken from [python-titlecase](https://github.com/ppannuto/python-titlecase) and [to-title-case](https://github.

(See [`scripts/test_model.py`](https://github.com/jdkato/aptag/blob/master/scripts/test_model.py) for more information.)

```go
{{< id="example3" src="ci/prose/test_transform.go" >}}
```

{{% /article %}}

{{% article Summarizing %}}

The `summarize` package includes functions for computing standard readability and usage statistics. It's among the most accurate implementations available due to its reliance on legitimate tokenizers (whereas others, like [readability-score](https://github.com/DaveChild/Text-Statistics/blob/master/src/DaveChild/TextStatistics/Text.php#L308), rely on naive regular expressions).

It also includes a TL;DR algorithm for condensing text into a user-indicated number of paragraphs.

```go
{{< id="example4" src="ci/prose/test_summarize.go" >}}
```

{{% /article %}}

{{% article Chunking %}}

The `chunk` package implements named-entity extraction using a regular expression indicating what chunks you're looking for and pre-tagged input.

```go
{{< id="example5" src="ci/prose/test_chunk.go" >}}
```

{{% /article %}}

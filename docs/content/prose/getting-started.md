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
package main

import (
    "fmt"

    "github.com/jdkato/prose/tokenize"
)

func main() {
    text := "They'll save and invest more."
    tokenizer := tokenize.NewTreebankWordTokenizer()

    expected := []string{"They", "'ll", "save", "and", "invest", "more", "."}
    for i, word := range tokenizer.Tokenize(text) {
        if expected[i] != word {
            panic("tokenize failed")
        }
        fmt.Println(word)
    }
}
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
package main

import (
    "fmt"

    "github.com/jdkato/prose/tag"
    "github.com/jdkato/prose/tokenize"
)

func main() {
    text := "A fast and accurate part-of-speech tagger for Golang."
    words := tokenize.NewTreebankWordTokenizer().Tokenize(text)

    tagger := tag.NewPerceptronTagger()
    for _, tok := range tagger.Tag(words) {
        fmt.Println(tok.Text, tok.Tag)
    }
}
```

{{% /article %}}

{{% article Transforming %}}

The `tranform` package implements a number of functions for changing the case of strings, including `Title`, `Snake`, `Pascal`, and `Camel`.

Additionally, unlike `strings.Title`, `tranform.Title` adheres to common guidelines&mdash;including styles for both the [AP Stylebook](https://www.apstylebook.com/) and [The Chicago Manual of Style](http://www.chicagomanualofstyle.org/home.html). You can also add your own custom style by defining an [`IgnoreFunc`](https://godoc.org/github.com/jdkato/prose/transform#IgnoreFunc) callback.

Inspiration and test data taken from [python-titlecase](https://github.com/ppannuto/python-titlecase) and [to-title-case](https://github.

(See [`scripts/test_model.py`](https://github.com/jdkato/aptag/blob/master/scripts/test_model.py) for more information.)

```go
package main

import (
    "fmt"
    "strings"

    "github.com/jdkato/prose/transform"
)

func main() {
    text := "the last of the mohicans"
    tc := transform.NewTitleConverter(transform.APStyle)
    if strings.Title(text) != "The Last Of The Mohicans" {
        panic("title failed")
    } else if tc.Title(text) != "The Last of the Mohicans" {
        panic("title failed")
    }
}
```

{{% /article %}}

{{% article Summarizing %}}

The `summarize` package includes functions for computing standard readability and usage statistics. It's among the most accurate implementations available due to its reliance on legitimate tokenizers (whereas others, like [readability-score](https://github.com/DaveChild/Text-Statistics/blob/master/src/DaveChild/TextStatistics/Text.php#L308), rely on naive regular expressions).

It also includes a TL;DR algorithm for condensing text into a user-indicated number of paragraphs.

```go
package main

import (
    "fmt"

    "github.com/jdkato/prose/summarize"
)

func main() {
    doc := summarize.NewDocument("This is some interesting text.")
    fmt.Println(doc.SMOG(), doc.FleschKincaid())
}
```

{{% /article %}}

{{% article Chunking %}}

The `chunk` package implements named-entity extraction using a regular expression indicating what chunks you're looking for and pre-tagged input.

```go
package main

import (
    "fmt"

    "github.com/jdkato/prose/chunk"
    "github.com/jdkato/prose/tag"
    "github.com/jdkato/prose/tokenize"
)

func main() {
    words := tokenize.TextToWords("Go is an open source programming language created at Google.")
    regex := chunk.TreebankNamedEntities
    tagger := tag.NewPerceptronTagger()
    for _, entity := range chunk.Chunk(tagger.Tag(words), regex) {
        fmt.Println(entity) // [Go Google]
    }
}
```

{{% /article %}}

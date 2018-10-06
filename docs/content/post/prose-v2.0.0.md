---
title: 'Introducing prose v2.0.0: Bringing *NLP to Go*'
slug: 'Bringing *NLP to Go*'
date: 2018-07-11T16:42:47-07:00

header: /img/posts/v2.0.0.jpg

excerpt: An introduction to natural language processing using Go.
---

I'm pleased to announce the [v2.0.0 release](https://github.com/jdkato/prose/) of `prose`, a natural language processing (NLP) library for Go.

v2.0.0 represents a major shift in the project's focus: instead of simply offering an assortment of prose-related utilities, we're focusing on bringing a more refined NLP experience to Go. This means that the development of v1.0.0's higher-level features (e.g., the title-case converter and text summarizer) will be moved to other repositories going forward.

> **NOTE**: In order to avoid breaking code already importing `prose`, v2.0.0 will be exposed via `gopkg.in/jdkato/prose.v2`&mdash;allowing `github.com/jdkato/prose` to still point to v1.0.0.

Among the new features of v2.0.0 is a new, more cohesive API built around [Documents](https://godoc.org/gopkg.in/jdkato/prose.v2#Document):

{{< highlight go >}}
package main

import (
	"gopkg.in/jdkato/prose.v2"
)

func main() {
    // You can pass "functional options" to control the document-creation
    // pipeline -- e.g., `prose.WithExtraction(false)` disables named-entity
    // extraction.
    doc, err := prose.NewDocument(
        "Go is an open-source programming language created at Google.",
        prose.WithExtraction(false))
}
{{< / highlight >}}

The document-creation process consists of four steps&mdash;tokenization,
segmentation, POS tagging, and named-entity extract&mdash;which are discussed
in detail below.

## Tokenization

Given a piece of text, tokenization is the task of breaking it up into units
referred to as *tokens*. For example,

{{< highlight go >}}
package main

import (
	"gopkg.in/jdkato/prose.v2"
)

func main() {
    doc, _ := prose.NewDocument("This is a sentence.")
    for _, token := range doc.Tokens() {
        fmt.Println(token.Text)
        // [This, is, a, sentence, .]
    }
}
{{< / highlight >}}


There's really no "correct" way to tokenize text, but you definitely need to do
more than identify word boundaries to be useful.

`prose` takes a two-step approach:

1. First, it looks for non-word character spans that should be treated as a
single token&mdash;as shown in the table below.

| Type            | Example                           |
| -------------   | --------------------------------- |
| Email addresses | `Jane.Doe@example.com`            |
| Hashtags        | `#trending`                       |
| Mentions        | `@jdkato`                         |
| URLs            | `https://github.com/jdkato/prose` |
| Emoticons       | `:-)`, `>:(`, `o_0`, etc.         |

2. It then falls back to following the
[Penn Treebank](http://www.nltk.org/_modules/nltk/tokenize/treebank.html)
tokenization strategy.

So, for example, a sentence like `"@jdkato, go to https://foo.com thanks :)"`
becomes `["@jdkato", "go", "to", "https://foo.com", "thanks", ":)"]`.

## Segmentation

Text segmentation is the process of dividing text into sentences. This is
generally a more challenging task than tokenization due to the ambiguity
of sentence boundaries. Fortunately, the developers of the [pragmatic_segmenter](https://github.com/diasks2/pragmatic_segmenter#the-golden-rules)
have complied a test suite of edge-case scenarios that can be used to evaluate
segmenters. Their results are as follows (with `prose` added):

Name                                                                 | Programming Language | License                                             | GRS (English)         | GRS (Other Languages)  | Speed
---------------------------------------------------------------------| -------------------- | --------------------------------------------------- | --------------------- | ---------------------- | -------
Pragmatic Segmenter                                                  | Ruby                 | [MIT](http://opensource.org/licenses/MIT)           | 98.08% (51/52)        | 100.00%                | 3.84 s
`prose`                                                              | Go                   | [MIT](http://opensource.org/licenses/MIT)           | 75.00% (39/52)        | N/A                    | 0.96 s (*different hardware*)
[TactfulTokenizer](https://github.com/zencephalon/Tactful_Tokenizer) | Ruby                 | [GNU GPLv3](http://www.gnu.org/copyleft/gpl.html)   | 65.38% (34/52)        | 48.57%                 | 46.32 s
[OpenNLP](https://opennlp.apache.org/)                               | Java                 | [APLv2](http://www.apache.org/licenses/LICENSE-2.0) | 59.62% (31/52)        | 45.71%                 | 1.27 s
[Standford CoreNLP](http://nlp.stanford.edu/software/corenlp.shtml)  | Java                 | [GNU GPLv3](http://www.gnu.org/copyleft/gpl.html)   | 59.62% (31/52)        | 31.43%                 | 0.92 s
[Splitta](http://www.nltk.org/_modules/nltk/tokenize/punkt.html)     | Python               | [APLv2](http://www.apache.org/licenses/LICENSE-2.0) | 55.77% (29/52)        | 37.14%                 | N/A
[Punkt](http://www.nltk.org/_modules/nltk/tokenize/punkt.html)       | Python               | [APLv2](http://www.apache.org/licenses/LICENSE-2.0) | 46.15% (24/52)        | 48.57%                 | 1.79 s
[SRX English](https://github.com/apohllo/srx-english)                | Ruby                 | [GNU GPLv3](http://www.gnu.org/copyleft/gpl.html)   | 30.77% (16/52)        | 28.57%                 | 6.19 s
[Scapel](https://github.com/louismullie/scalpel)                     | Ruby                 | [GNU GPLv3](http://www.gnu.org/copyleft/gpl.html)   | 28.85% (15/52)        | 20.00%                 | 0.13 s

As you can see, `prose` performed relatively well. Most of its missed cases
(Golden Rules 31 - 39) were list-containing sentences, which seem to be pretty rare.

### Part-of-Speech Tagging

### Named-Entity Extraction

### Going Forward

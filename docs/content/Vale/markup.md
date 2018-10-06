---
layout: section
slug: markup
weight: 2

title: Markup
description: |
  An introduction to Vale, a syntax-aware linter for prose built with speed and
  extensibility in mind.

sections: [
    { title: "Overview" },
    { title: "Markdown" },
    { title: "HTML" },
    { title: "reStructuredText" },
    { title: "AsciiDoc" },
    { title: "Code" },
    { title: "Non-standard markup" }
]

code: true
js: [
  table.js
]
color: green
---

{{% article Overview %}}

Vale is "syntax aware," which means that it's capable of both applying rules to and ignoring certain sections of text. This functionality is implemented through a *scoping* system. A scope (i.e., a particular section of text) is specified through a *selector* such as `paragraph.rst`, which indicates that the rule applies to all paragraphs in reStructuredText files. Here are a few examples:

- `comment` matches all source code comments (single- and multi-line);
- `comment.line` matches all source code line comments;
- `heading.md` matches all Markdown headings; and
- `text.html` matches all HTML scopes.

The table below summarizes all available scopes.

|   Format   |                             Scopes                                        |
|------------|---------------------------------------------------------------------------|
|   markup   | `heading`, `table.header`, `table.cell`, `list`, `paragraph`, `sentence`  |
|    code    | `comment.line`, `comment.block`                                           |
| plain text | `text`                                                                    |

{{% /article %}}

{{% article Markdown %}}

Vale has built-in support for [GitHub Flavored Markdown](https://github.github.com/gfm/). By default, it ignores [indented blocks](https://github.github.com/gfm/#indented-code-blocks), [fenced blocks](https://github.github.com/gfm/#fenced-code-blocks), and [code spans](https://github.github.com/gfm/#code-spans).

{{% /article %}}

{{% article HTML %}}

Vale has built-in support for HTML. By default, it ignores `script`, `style`, `pre`, `code`, and `tt` tags.

{{% /article %}}

{{% article reStructuredText %}}

Vale supports reStructuredText through the external program [`rst2html`](http://docutils.sourceforge.net/docs/user/tools.html#rst2html-py). If you have [Sphinx](http://www.sphinx-doc.org/en/stable/) or [docutils](http://docutils.sourceforge.net/) installed, you shouldn't need to install `rst2html` separately.

Literal blocks, inline literals, and `code-block`s are ignored by default.

{{% /article %}}

{{% article AsciiDoc %}}

Vale supports AsciiDoc through the external program [AsciiDoctor](https://rubygems.org/gems/asciidoctor). Vale ignores [listing blocks and inline literals](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#source-code) by default.

{{% /article %}}

{{% article Code %}}

<!-- vale 18F.UnexpandedAcronyms = NO -->

|   Syntax   |          Extensions         |                                                        Tokens (scope)                                                       |
|----------|---------------------------|---------------------------------------------------------------------------------------------------------------------------|
| C          | `.c`, `.h`                      | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| C#         | `.cs`, `.csx`                   | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| C++        | `.cpp`, `.cc`, `.cxx`, `.hpp`       | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| CSS        | `.css`                        | `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                                                            |
| Go         | `.go`                         | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| Haskell    | `.hs`                         | `--` (`text.comment.line.ext`), `{-` (`text.comment.block.ext`)                                                                 |
| Java       | `.java`, `.bsh`                 | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| JavaScript | `.js`                         | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| LESS       | `.less`                       | `//`(`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                               |
| Lua        | `.lua`                        | `--` (`text.comment.line.ext`), `--[[` (`text.comment.block.ext`)                                                               |
| Perl       | `.pl`, `.pm`, `.pod`              | `#` (`text.comment.line.ext`)                                                                                                 |
| PHP        | `.php`                        | `//` (`text.comment.line.ext`), `#` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`) |
| Python     | `.py`, `.py3`, `.pyw`, `.pyi`, `.rpy` | `#` (`text.comment.line.ext`), `"""` (`text.comment.block.ext`)                                                                 |
| R          | `.r`, `.R`                      | `#` (`text.comment.line.ext`)                                                                                                 |
| Ruby       | `.rb`                         | `#` (`text.comment.line.ext`), `^=begin` (`text.comment.block.ext`)                                                             |
| Sass       | `.sass`                       | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)                              |
| Scala      | `.scala`, `.sbt`                | `//`(`text.comment.line.ext`),                                                                                                |
| Swift      | `.swift`                      | `//` (`text.comment.line.ext`), `/*...*/` (`text.comment.line.ext`), `/*` (`text.comment.block.ext`)

{{% /article %}}

{{% article "Non-standard markup" %}}

When working with non-HTML markup, you'll probably find that there are certain non-standard sections of text you'd like to ignore. Vale supports doing this at both the block and inline levels.

To ignore entire blocks of text&mdash;e.g., [Hugo's shortcodes](https://gohugo.io/content-management/shortcodes/)&mdash;you'll want to define `BlockIgnores`. For example, consider the following shortcode-like `file` snippet:

```shell
{< file "hello.go" go >}
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
{</ file >}
```

To ignore all instances of `file`, we'd use a pattern along the lines of the following:

```ini
BlockIgnores = (?s) *({< file [^>]* >}.*?{</ ?file >})
```

The basic idea is to capture the entire snippet in the first grouping. See [regex101](https://regex101.com/r/mFM0kZ/1/) for a more complete explanation.

You can also define more than one by using a list (the `\` allows for line breaks):

```ini
BlockIgnores = (?s) *({< output >}.*?{< ?/ ?output >}), \
(?s) *({< highlight .* >}.*?{< ?/ ?highlight >})
```

To ignore an inline section of text, you'll want to define `TokenIgnores`. For example, let's say we want to ignore math equations of the form `$...$`:

```ini
$\begin{bmatrix} k & k & k \end{bmatrix}^T$
```

Similar to `BlockIgnores`, we just need to define a pattern:

```ini
TokenIgnores = (\$+[^\n$]+\$+)
```

See [Configuration](/vale/config/) for more details.

{{% /article %}}

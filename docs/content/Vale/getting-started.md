---
layout: section
slug: getting-started
weight: 0

title: 'Getting Started'
description: |
  An introduction to Vale, a syntax-aware linter for prose built with speed and
  extensibility in mind.

sections: [
    { title: "Introduction" },
    { title: "Installation" },
    { title: "Support" }
]
css: [
  "quickstart.css"
]
js: [
  "quickstart.min.js",
  "install.js"
]
color: green
---

{{% article Introduction %}}

<img src="/img/software/vale-demo.png" class="img-fluid" data-action="zoom">

**Vale** is a free, open-source linter for prose built with speed and extensibility in mind.

Unlike most writing aids, Vale's primary purpose isn't to provide its own advice; it's designed to
enforce an existing style guide through its easy-to-use [extension system](/vale/styles).

No matter if you're working with a small in-house standard or a large editorial style guide, Vale
will help you maintain consistent and error-free writing.

{{% /article %}}

{{% article Installation %}}

Vale runs on Windows, macOS, and Linux. It can be installed via one of the package managers listed
below or manually by downloading an executable from the [releases page](https://github.com/errata-ai/vale/releases).

<div id="quickstart">
    <span data-qs-package="brew">brew tap ValeLint/vale</span>
    <span data-qs-package="brew">brew install vale</span>
    <span data-qs-package="go">go get github.com/errata-ai/vale</span>
    <span data-qs-package="choco">choco install vale</span>
    <span data-qs-package="snap">snap install --edge vale</span>
</div>

{{% /article %}}

{{% article Support %}}

Vale is actively maintained. If you run into any problems, please open an [issue on GitHub](https://github.com/errata-ai/vale/issues/new) or contact us <a href="mailto:support@errata.ai" target="_top">via email</a>.

{{% /article %}}

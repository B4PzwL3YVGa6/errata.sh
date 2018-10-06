---
layout: section
slug: config
weight: 4

title: Configuration
description: |
  An introduction to Vale, a syntax-aware linter for prose built with speed and
  extensibility in mind.

sections: [
    { title: "Basics" },
    { title: "Structure" },
    { title: "Comments" }
]

js: [
  table.js
]
color: green
code: true
---

{{% article Basics %}}

Vale expects its configuration to be in a file named `.vale.ini` or `_vale.ini`.

Vale will will start looking for this file in the same directory as the file that's being linted. If it can't find one, it will search up to 6 levels up the directory tree. After 6 levels, it will look for a global configuration file in the OS equivalent of `$HOME` (see below).

| OS      | Search Locations                                      |
|---------|------------------------------------------------------|
| Windows | `$HOME`, `%UserProfile%`, or `%HomeDrive%%HomePath%` |
| macOS   | `$HOME`                                              |
| Linux   | `$HOME`                                              |

If more than one configuration file is present, the closest one takes precedence.

{{% /article %}}

{{% article Structure %}}

The basic structure of a configuration file is as follows:

```ini
# Core settings
StylesPath = ci/vale/styles

# The minimum alert level to display (suggestion, warning, or error).
#
# CI builds will only fail on error-level alerts.
MinAlertLevel = warning

# Global settings (applied to every syntax)
[*]
# List of styles to load
BasedOnStyles = vale, MyCustomStyle
# Style.Rule = {YES, NO} to enable or disable a specific rule
vale.Editorializing = YES
# You can also change the level associated with a rule
vale.Hedging = error

# Syntax-specific settings
# These overwrite any conflicting global settings
[*.{md,txt}]
...
```

{{% /article %}}

{{% article Comments %}}

{{% alert primary %}}

**NOTE**: reStructuredText uses `.. vale off` style comments.

{{% /alert %}}

Vale also supports context-specific configuration in Markdown, HTML, and reStructuredText documents:

```xml
<!-- vale off -->

This is some text

more text here...

<!-- vale on -->

<!-- vale Style.Rule = NO -->

This is some text

<!-- vale Style.Rule = YES -->
```

{{% /article %}}

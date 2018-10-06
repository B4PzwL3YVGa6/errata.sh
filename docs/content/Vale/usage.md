---
layout: section
slug: usage
weight: 1

title: Usage
description: |
  An introduction to Vale, a syntax-aware linter for prose built with speed and extensibility in mind.
code: true

sections: [
    { title: "CLI" },
    { title: "Plugins" }
]
color: green
---

{{% article CLI %}}

At its core, Vale is designed to be used as a command-line tool. Its general usage information is given below:

```shell
$ vale --help
NAME:
   vale - A command-line linter for prose.

USAGE:
   vale [global options] command [command options] [arguments...]

VERSION:
   vx.x.x

COMMANDS:
     dump-config, dc  Dumps configuration options to stdout and exits
     new              Generates a template for the given extension point
     help, h          Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --glob value     a glob pattern (e.g., --glob='*.{md,txt}') (default: "*")
   --config value   a file path (e.g., --config='some/file/path')
   --output value   output style ("line" or "JSON") (default: "CLI")
   --ext value      extension to associate with stdin (default: ".txt")
   --no-wrap        don't wrap CLI output
   --no-exit        don't return a nonzero exit code on lint errors
   --sort           sort files by their name in output
   --normalize      replace each path separator with a slash ('/')
   --ignore-syntax  lint all files line-by-line
   --relative       return relative paths
   --help, -h       show help
   --version, -v    print the version
```

Vale's `--glob` argument accepts the [standard syntax](http://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm). Additionally,
any pattern prefixed with an `!` will be nagated&mdash;e.g.,

```shell
$ vale --glob='!*.bin' directory  # Exclude all xxx.bin files
```
{{% /article %}}

{{% article Plugins %}}
In addition to its command-line interface, Vale also has (community-maintained) plugins for [Atom](https://github.com/TimKam/atomic-vale), [Emacs](https://github.com/abingham/flycheck-vale), [Sublime Text](https://packagecontrol.io/packages/SublimeLinter-contrib-vale), [VS Code](https://marketplace.visualstudio.com/items?itemName=lunaryorn.vale)</a>, and [Vim](https://github.com/w0rp/ale).
{{% /article %}}

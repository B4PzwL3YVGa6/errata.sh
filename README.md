# `errata.sh`: One script, every test

`errata.sh` is a shell script that implements a comprehensive suite of documentation-related tests. It's designed to be a drop-in solution to your quality assurance needs, including tests for your markup structure, code examples, prose, and accessibility.

Learn more by [checking out our wiki](https://github.com/errata-ai/errata.sh/wiki)!

<p>
      <a href="https://travis-ci.org/errata-ai/errata.sh"><img src="https://img.shields.io/travis/errata-ai/errata.sh/master.svg?style=flat-square&amp;logo=travis" alt="Build Status" /></a>
      <a href="https://github.com/errata-ai/errata.sh/releases"><img src="https://img.shields.io/github/release/errata-ai/vale.svg?style=flat-square&amp;logo=github&amp;logoColor=white" alt="GitHub release" /></a>
      <a href="https://github.com/errata-ai/errata.sh/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat-square&amp;logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQBAMAAADUulMJAAAAAXNSR0IB2cksfwAAACFQTFRFAAAA////////////////////////////////////////zyHr+QAAAAt0Uk5TACDfgP/g0M9AwPBjtNY0AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAX0lEQVR4nGNggANGJQEwzexiAOGHQvgpLu5AksUlwYXNxYGBw4PBhaGlgYHTEkhPnsDQydngwjFhBsMMjgkunA2dDEtcAly4XFwZWl2B4iERIANcIOazuRRAKBcIAwwAE2YSVHVgIGMAAAAASUVORK5CYII=" alt="Bash" /></a>
      <a href="#say-thanks"><img src="https://img.shields.io/badge/say-thanks-ff69b4.svg?style=flat-square&amp;logo=gratipay&amp;logoColor=white" alt="Donate" /></a>
</p>

## Usage

> **NOTE**: `errata.sh` currently only supports **Linux** and **macOS**.

Copy the [`ci/` directory](https://github.com/errata-ai/errata.sh/releases) and [an example CI config file]() into the repository where you host your documentation. Inside the `ci/errata.sh` file, you'll find a few variable definitions (shown below) that you can use to customize the various tests.

```bash
# [TODO]: Specify your OS
#
# "Linux" or "macOS"
OS="Linux"

# [TODO]: Specify the version of `vale` and `blocktest` to use.
#
# See `/content/` for configuration details.
VALE="1.0.4"
BLOCKTEST="0.1.1"

# [TODO]: Specify the type of front matter you're using.
#
# See `/content/` for configuration details.
FM_STYLE="YAML"  # YAML, TOML, or JSON
FM_DELIM="---"   # What delimiter are you using (e.g., "---")?
```

See the [wiki](https://github.com/errata-ai/errata.sh/wiki) for detailed explanations of each test.

## Say thanks

Hi!

My name is [Joseph Kato](https://github.com/jdkato).

In my spare time, I develop and maintain a few [open-source tools](https://github.com/errata-ai) for collaborative writing. If you'd like to support my work, you can donate via PayPal or make use of my [consulting services](https://errata.ai/about/).

| PayPal | Consulting |
|:-----------------:|:-------:|
| [Donate with PayPal][donate-card-url] | [Tell us what you need](https://errata.ai/about/) |
| <img src="https://user-images.githubusercontent.com/8785025/46446617-4681bd00-c732-11e8-9683-37a1979df769.png" width="100px"/> | <img src="https://user-images.githubusercontent.com/8785025/46446894-b2b0f080-c733-11e8-807a-9f8b2f41b246.png" width="100px"/> |

I appreciate your support! _Thank you!_

[donate-card-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BYUW6FHU86M62

#!/usr/bin/env bash
#
# errata.sh - A full-featured, self-contained script for documentation QA.
#
# https://github.com/errata-ai/errata.sh
#
# The MIT License (MIT)
#
# Copyright (c) 2018 Joseph Kato
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

############################## UTILITY FUNCTIONS ##############################

# Print to given argument to stdout, followed by a newline.
errata_print () {
    printf "\\n" && printf %"s\\n" "$1"
}

# Run the given command with its stdout suppressed.
errata_quiet_cmd () {
    "$1" &> /dev/null
}

############################## GLOBAL VARIABLES ###############################

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

# `NVM` is our version of `nvm` (https://github.com/creationix/nvm).
NVM="0.33.11"

################################ DEPENDENCIES #################################

# Our only runtime dependency is Node.js, which we install via `nvm`:
export NVM_DIR="$HOME/.nvm"
NVM_INSTALL="https://raw.githubusercontent.com/creationix/nvm/v$NVM/install.sh"

errata_quiet_cmd "curl -o- $NVM_INSTALL | bash"

# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 10.11.0

#################################### STEPS ####################################

if [ "$1" == "pre" ]
then
    # Step 1: Prose & Code
    #
    # In this step, we test three aspects of our documentation:
    #
    #    1. Spelling: We check our spelling via Vale using a custom;
    #    2. Style: we check that our docs adhere to our style (via Vale); and
    #    3. Code: we check that our code examples are working (via blocktest).
    #
    # See `/content` for more information.
    source "ci/content/cmd.sh"

    # Step 2: Markup Style
    #
    # In this step, we ensure that our markup style is consistent and
    # readable. See `/structure` for more information.
    source "ci/structure/cmd.sh"
else
    # Step 3: Accessibility
    #
    source "ci/accessibility/cmd.sh"
fi


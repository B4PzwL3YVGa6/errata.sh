#!/usr/bin/env bash
#
# errata.sh - A full-featured, self-contained script for documentation QA.
#
# https://github.com/errata-ai/errata.sh
#
# The MIT License (MIT)
#
# Copyright (c) 2018 Joseph Kato (errata.ai)
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

################################ DEPENDENCIES #################################

# Our only runtime dependency is Node.js, which we install via `nvm`:
NVM="https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh"

errata_print "Installing Node.js ..."
errata_quiet_cmd "curl -o- $NVM | bash"

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 10.11.0

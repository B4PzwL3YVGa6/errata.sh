# Section 2: Markup Style
#
# These tests relate to the structure (i.e., not the actual written content) of
# our markup (Markdown only, for now).
#
# See the `.markdownlint.json` file for more details.
#
# See https://github.com/igorshubovych/markdownlint-cli.
errata_print "Installing & running markdownlint ..."

errata_quiet_cmd "npm install -g markdownlint-cli"
markdownlint --config="ci/structure/.markdownlint.json" $3


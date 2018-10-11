set -e

errata_print "Installing and running a11y ..."
npm install --silent -g a11y && a11y $2'/**/*.html'
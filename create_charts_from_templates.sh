#!/bin/bash

command -v jinja2 >/dev/null 2>&1 || { echo >&2 "ERROR: jinja2 command (from jinja2-cli) is required."; exit 1; }

set -e

while read target template ; do
	echo "Creating charts for $target"
	prefix=templates/${template}/
	for file in $(find ${prefix}* -type f -not -name config.json); do
		outfile=generated_from_template/${target}/${file##$prefix}
		if [[ $file == *.j2 ]]; then

			test -f ${prefix}config.json || { echo >&2 "  ERROR: File ${prefix}config.json does not exist"; exit 1; }

			outfile=${outfile%.j2}
			mkdir -p $(dirname $outfile)
			jinja2 --strict $file \
				-D target=${target} \
				${prefix}config.json \
				> $outfile
		else
			mkdir -p $(dirname $outfile)
			cp $file $outfile
		fi

		echo "  $file > $outfile"
	done
done < templates/targets.cfg

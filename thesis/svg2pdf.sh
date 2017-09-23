#! /bin/bash
find gfx/**/${1:-*}.svg -exec bash -c 'x={}; y=`dirname $x`; z=$y/`basename $x .svg`.pdf; inkscape $x --export-pdf $z' \;

if [[ $2 = "crop" ]]; then
	find gfx/**/${1:-*}.pdf -exec bash -c 'x={}; pdfcrop $x $x' \;
fi

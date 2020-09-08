#!/bin/sh

# Borrowed and modified from UT Austin's LaTeX Dissertation build files

RESUME=$1

rm -f	$RESUME.aux \
	$RESUME.bbl \
        $RESUME.bcf \
        $RESUME.run.xml \
        $RESUME-nhblx.bib \
	$RESUME.blg \
	$RESUME.dvi \
	$RESUME.idx \
	$RESUME.ilg \
	$RESUME.ind \
	$RESUME.lof \
	$RESUME.log \
	$RESUME.lot \
	$RESUME.ps  \
        $RESUME.spl \
        $RESUME.out \
	$RESUME.toc   2>/dev/null

# Clear the screen.
#
clear

# Run latex and bibtex to create the output file ($RESUME.dvi)
#
echo ""
echo "	First run of latex ..."
echo ""
pdflatex $RESUME
exitcode="$?"
	if test $exitcode -ne 0
	  then
	    exit 2
	fi
echo ""
echo "	Run of Biber ..."
echo ""
biber $RESUME
exitcode="$?"
	if test $exitcode -ne 0
	  then
	    exit 3
	fi
echo ""
echo "	Second run of latex ..."
echo ""
pdflatex $RESUME
exitcode="$?"
	if test $exitcode -ne 0
	  then
	    exit 4
	fi
echo ""
echo "	Third run of latex ..."
echo ""
pdflatex $RESUME
exitcode="$?"
	if test $exitcode -ne 0
	  then
	    exit 5
	fi
#echo ""
#echo "	Fourth run of latex ..."
#echo ""
#pdflatex $RESUME 2>&1 | tee latexlog
#exitcode="$?"
#	if test $exitcode -ne 0
#	  then
#	    exit 7
#	fi
##echo ""
##echo "	Fifth and last run of latex ..."
##echo ""
##pdflatex $RESUME 2>&1 | tee latexlog
##exitcode="$?"
##	if test $exitcode -ne 0
##	  then
##	    exit 8
##	fi
##echo ""
##echo "	Sixth and extra run of latex just to make sure..."
##echo ""
##pdflatex $RESUME 2>&1 | tee latexlog
##exitcode="$?"
##	if test $exitcode -ne 0
##	  then
##	    exit 8
##	fi

#!/bin/bash

IFP=$1
PIX=$2
Q=$3
DOWNDIR=$4

mkdir -p $DOWNDIR;

echo "Processing $IFP with $PIX pixel width" ;
IFN=$(basename $IFP) ;
echo "$DOWNDIR/$IFN" > tmpname ;
if [ ! -f $DOWNDIR/$IFN ]; then
	echo "File $DOWNDIR/$IFN not found! Converting..." ;
	convert $IFP -resize $PIX"x>" -quality $Q $DOWNDIR/$IFN ;
else
	echo "Found images/downsampled/$IFN - reusing.";
fi ; 


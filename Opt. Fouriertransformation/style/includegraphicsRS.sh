mkdir -p images; mkdir -p images/downsampled;

IFP=$1
PIX=$2

PIX=$( awk  'BEGIN { rounded = sprintf("%.0f", ('$PIX')*1000); print rounded }' ) ;
echo $PIX ;
echo "Processing $IFP" ;
IFN=$(basename $IFP) ;
echo "images/downsampled/$IFN" > tmpname ;
if [ ! -f images/downsampled/$IFN ]; then
	echo "File images/downsampled/$IFN not found! Converting..." ;
	convert $IFP -resize $PIX"x>" -quality 85 images/downsampled/$IFN ;
else
	echo "Found images/downsampled/$IFN - reusing." ; %
fi ; 


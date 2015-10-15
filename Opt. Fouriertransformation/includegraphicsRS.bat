set IFP=%1
set PIX=%2
set Q=%3
set downPath=%4

mkdir %downPath%
echo Processing %IFP% with %PIX% pixel width

set FN=null
for /F %%i in ("%IFP%") do @set FN=%%~ni%%~xi

echo file name %FN%
set IFN=%downPath%/%FN%

@if exist "%IFN%" (@echo Found %IFN% - reusing.) else (convert -density 90 -resize "%PIX%x>" -quality %Q% %IFP% %IFN%)

echo downsampled file should be in %IFN%

@if exist "%IFN%" (@echo %IFN% > tmpname) else (@echo %IFP% > tmpname)

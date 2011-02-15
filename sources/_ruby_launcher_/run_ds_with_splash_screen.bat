echo off
cls
echo "   ---------------------------------------------------   "
echo "   |                DemoSort launcher                |   "
echo "   |              with  splash  screen              |   "
echo "   ---------------------------------------------------   "
echo "                                                         "
echo "                                                         "
echo "  ---> run keyrus <---  "
.\DS_data\keyrus\rk.com
echo "                                                         "
echo "  ---> run start splash screen <---  "
.\DS_data\splash_screen\DS_splash_start.exe
echo "                                                         "
echo "  ---> run DemoSort <---  "
.\DS.exe
echo "                                                         "
echo "  ---> run end splash screen <---  "
.\DS_data\splash_screen\DS_splash_end.exe
echo "                                                         "
echo "  ===> run completed <===  "

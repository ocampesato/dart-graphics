This modest code project contains experimental Dart-based graphics code with many similar code samples (think "swatches"), and some samples are more aesthetically appealing than others (YMMV).

The code samples were tested successfully in Chrome 15 on a Macbook, and several randomly selected code samples were successfully deployed as hybrid HTML5/Android apps to a Nexus S 4G (Android 2.3.7), so it seems plausible that they ought to be viewable on Android tablets and potentially also iOS devices (but this needs to be verified).

This project contains the Android apk file DartAndroidArchTripleCirclesTube2Revised.apk and the complete Eclipse-based Android project in the zip file DartAndroidArchTripleCirclesTube2Revised.zip.  Note that the Android version is set to 10, but this code will probably run on Android 2.1 (version 7).  In addition, the code for this Android project was taken "as-is" from the current code samples, so you'll need to tweak the code slightly in order to render it 'correctly' on an Android smart phone or Android tablet.

These code samples are basically eye-candy, and they are grouped according to the equation that is used to render the graphics, along with a css3-background subdirectory with code samples that illustrate how to combine Dart graphics with CSS3 stylesheets.

Please keep in mind that the code samples focus exclusively on some graphics-related aspects of Dart, so you won't find any code samples that illustrate any of the other features of Dart.  As you might surmise, these code samples do not represent production-quality code, nor do they reflect any best practices, so code refactoring would be a good idea.

Each code sample requires a generated HTML file which you can generate from the command line.  For example, if you navigate to the directory archimedes/ArchCircles1, you can generate the file ArchCircles1-js.html as follows:
```
python path-to-client-tools/htmlconverter.py ArchCircles1.html -o .
```
If you like any of these graphics code samples, you might also be interested in additional (non-Dart) HTML5 Canvas code samples that are here:
```
http://code.google.com/p/html5-canvas-graphics
```
The CSS3 stylesheets in this code project are part of a collection of CSS3 2D/3D graphics/animation code samples that are here:
```
http://code.google.com/p/css3-graphics/
```
If you want to combine Dart with SVG, there are two SVG-based code projects (one containing basic SVG code and one with SVG-filter-based code samples) available here:
```
http://code.google.com/p/svg-filters-graphics/
http://code.google.com/p/svg-graphics/
```
You might also be interested in jQuery-based graphics and Raphael-based graphics (and perhaps also combine them with Dart):
```
http://code.google.com/p/jquery-graphics/
http://code.google.com/p/raphael-graphics/
```
A book (Q3/2012) with more involved examples (such as combining HTML5 Canvas, CSS3, and SVG, examples of charts and graphs, and CSS 2D/3D graphics/animation):
```
http://www.amazon.com/HTML5-Canvas-CSS3-Graphics-Primer/dp/1936420341
```
Enjoy!
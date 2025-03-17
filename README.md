# Awami Nastaliq Font Test App for Flutter

A tool to test the [Awami Nastaliq font](https://software.sil.org/awami/download/) using a custom [Flutter engine](https://github.com/flutter/flutter) that
builds [Graphite2](https://github.com/silnrsi/graphite) into HarfBuzz.  When you have successfully compiled your custom Flutter engine, the letters in Awami 
will all connect as they do in the other fonts that also display in this app.  This app also shows issues with how Flutter interacts with Awami.  You can see
brackets opening the wrong way and symbols that are supposed to combine with numbers either displaying side-by-side or even crashing the app.  Just tap on the
different samples of issues to see the app toggle between different cases for comparison and even test out the functions that currently cause the app to crash.

## Getting Started

Follow [this tutorial](https://huynq.dev/compiling-flutter-engine-locally-part-i) (and reference [this one](https://huynq.dev/compiling-flutter-engine-locally-part-iv?source=more_series_bottom_blogs) as well) to build your custom Flutter engine.  To add Graphite2 you will need to go into the third-party apps in the engine and 
modify Harfbuzz's BUILD.gn file to include the Graphite2 flags and files and you will need to add the include folder and source folder for Grapthite2.

## Assets

The `assets` directory already has a few fonts for comparison with Awami.

import 'package:flutter/material.dart';

//import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MaterialApp(home: MyApp(settingsController: settingsController)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required SettingsController settingsController,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(alignment: Alignment.topRight, child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
                  //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
                  child: Text('[1] آپ کیسے ہیں؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Noto', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  // This line doesn't crash the app when Arabic Sign Sanah (U+0601) is alone. Opening bracket
                  // faces the wrong way. Kerning is amazing.
                  child: Text('[1] آپ کیسے ہیں؟ ؁ (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                  // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
                  // child: Text('[1] آپ کیسے ہیں؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                )
                ])))));
  }
}

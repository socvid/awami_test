import 'package:awami_test/src/test_awami.dart';
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
    return TestAwami();
  //  return Scaffold(
  //      body: SafeArea(
  //          top: true,
  //          child: Padding(
  //              padding: const EdgeInsets.all(10.0),
  //              child: Column(children: [
  //                const Row(children: [
  //                  Align(
  //                      alignment: Alignment.topLeft,
  //                      child: Padding(
  //                          padding: EdgeInsets.all(10.0),
  //                          child: Text('Noto v3:'))),
  //                  Spacer(),
  //                  Align(
  //                      alignment: Alignment.topRight,
  //                      child: Padding(
  //                        padding: EdgeInsets.all(10.0),
  //                        //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
  //                        //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
  //                        child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
  //                            textAlign: TextAlign.right,
  //                            style: TextStyle(
  //                                fontFamily: 'Noto3',
  //                                locale:
  //                                    Locale.fromSubtags(languageCode: 'ur')),
  //                            textDirection: TextDirection.rtl),
  //                      )),
  //                ]),
  //                const Row(children: [
  //                  Align(
  //                      alignment: Alignment.topLeft,
  //                      child: Padding(
  //                          padding: EdgeInsets.all(10.0),
  //                          child: Text('Noto v4:'))),
  //                  Spacer(),
  //                  Align(
  //                      alignment: Alignment.topRight,
  //                      child: Padding(
  //                        padding: EdgeInsets.all(10.0),
  //                        //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
  //                        //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
  //                        child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
  //                            textAlign: TextAlign.right,
  //                            style: TextStyle(
  //                                fontFamily: 'Noto4',
  //                                locale:
  //                                    Locale.fromSubtags(languageCode: 'ur')),
  //                            textDirection: TextDirection.rtl),
  //                      )),
  //                ]),
  //                const Row(children: [
  //                  Align(
  //                      alignment: Alignment.topLeft,
  //                      child: Padding(
  //                          padding: EdgeInsets.all(10.0),
  //                          child: Text('Awami: (adding\nnumbers crashes app)'))),
  //                  Spacer(),
  //                  Align(
  //                      alignment: Alignment.topRight,
  //                      child: Padding(
  //                        padding: EdgeInsets.all(10.0),
  //                        // This line doesn't crash the app when Arabic Sign Sanah (U+0601) is alone. Opening bracket
  //                        // faces the wrong way. Kerning is amazing.
  //                        child: Text('[1] یہ تجربہ پیارا ہے؟ ؁ (غیر ملکی) ',
  //                            textAlign: TextAlign.right,
  //                            style: TextStyle(
  //                                fontFamily: 'Awami',
  //                                locale:
  //                                    Locale.fromSubtags(languageCode: 'ur')),
  //                            textDirection: TextDirection.rtl),
  //                        // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
  //                        // child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
  //                      ))
  //                ]),
  //                Row(children: [
  //                  const Align(
  //                      alignment: Alignment.topLeft,
  //                      child: Padding(
  //                          padding: EdgeInsets.all(10.0),
  //                          child: Text('Scheherazade:'))),
  //                  const Spacer(),
  //                  Align(
  //                      alignment: Alignment.topRight,
  //                      child: Padding(
  //                        padding: const EdgeInsets.all(10.0),
  //                        // This line doesn't crash the app when Arabic Sign Sanah (U+0601) is alone. Opening bracket
  //                        // faces the wrong way. Kerning is amazing.
  //                        child: RichText(text: const TextSpan(text: '[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
  //                            style: TextStyle(
  //                                color: Colors.black,
  //                                fontSize: 15,
  //                                fontFamily: 'Scheherazade',
  //                                locale:
  //                                    Locale.fromSubtags(languageCode: 'ur',scriptCode: 'Arab'))),
  //                            textDirection: TextDirection.rtl,
  //                            textAlign: TextAlign.right),
  //                        // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
  //                        // child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
  //                      ))
  //                ]),
  //                Row(children: [
  //                  const Expanded(
  //                  child: Align(
  //                      alignment: Alignment.topLeft,
  //                      child: Padding(
  //                          padding: EdgeInsets.all(10.0),
  //                          child: Text('u061C+Awami+\nScheherazade+Awami:')))),//\n(Adding narrow no break spaces will also be necessary for disappearing glyph problem.)')))),
  //                  Expanded(
  //                    child: Align(
  //                      alignment: Alignment.topRight,
  //                      child: Padding(
  //                        padding: const EdgeInsets.all(10.0),
  //                        //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
  //                        //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
  //                        child: RichText(
  //                          text: const TextSpan(
  //                              text: '؜[1] یہ تجربہ پیارا ہے؟ ',
  //                              style: TextStyle(
  //                                  color: Colors.black,
  //                                  fontFamily: 'Awami',
  //                                  locale:
  //                                      Locale.fromSubtags(languageCode: 'ur')),
  //                              children: <TextSpan>[
  //                                TextSpan(
  //                                    text: '؁12',
  //                                    style: TextStyle(
  //                                        fontFamily: 'Scheherazade',
  //                                        fontSize: 20,
  //                                        locale: Locale.fromSubtags(
  //                                            languageCode: 'ur'))),
  //                                TextSpan(
  //                                    text: '(غیر ملکی) ',
  //                                    style: TextStyle(
  //                                        fontFamily: 'Awami',
  //                                        locale: Locale.fromSubtags(
  //                                            languageCode: 'ur')))
  //                              ]),
  //                            textDirection: TextDirection.rtl,
  //                            textAlign: TextAlign.right
  //                        ),
  //                      )))
  //                ]),
  //              ]))));
  }
}

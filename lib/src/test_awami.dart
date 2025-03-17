import 'package:flutter/material.dart';

class TestAwami extends StatefulWidget {
  const TestAwami({super.key});

  @override
  State<TestAwami> createState() => _TestAwamiState();
}

class _TestAwamiState extends State<TestAwami> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  late List<bool> toggleTest = List.filled(10, false); 

  void Function()? onTap (int index) {
    setState(() {
      toggleTest[index]
          ? toggleTest[index] = false
          : toggleTest[index] = true;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Scrollbar(
            controller: controller2,
            //isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: controller2,
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                controller: controller,
                child: DataTable(
                    horizontalMargin: 10,
                    columnSpacing: 10,
                    dataRowMinHeight: 20.0,
                    dataRowMaxHeight: 60.0,
                    columns: const [
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Sample (Tap to test)')),
                    ],
                    rows: [
                      //Row 0
                      DataRow(cells: [
                        DataCell(
                            toggleTest[0]
                                ? const Text('No Test')
                                : const Text('Noto v3:'),
                            onTap: () => onTap(0)),
                        //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
                        //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
                        DataCell(toggleTest[0]
                          ? const Text('اس کی ٹسٹ نہیں۔',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Noto3',
                                  locale: Locale.fromSubtags(languageCode: 'ur')))
                          : const Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Noto3',
                                  locale: Locale.fromSubtags(languageCode: 'ur')),
                              textDirection: TextDirection.rtl),
                            onTap: () => onTap(0)),
                      ]),
                      //Row 1
                      DataRow(cells: [
                        DataCell(
                            toggleTest[1]
                                ? const Text('No Test')
                                : const Text('Noto v4:'),
                            onTap: () => onTap(1)),
                          //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
                          //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
                        DataCell(toggleTest[1]
                          ? const Text('اس کی ٹسٹ نہیں۔',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Noto4',
                                  locale:
                                      Locale.fromSubtags(languageCode: 'ur')))
                          : const Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Noto4',
                                  locale:
                                      Locale.fromSubtags(languageCode: 'ur')),
                              textDirection: TextDirection.rtl),
                              onTap: () => onTap(1),
                        ),
                      ]),
                      //Row 2
                      DataRow(cells: [
                        DataCell(
                          toggleTest[2]
                              ? const Text('No Test')
                              : const Text('Scheherazade'),
                          onTap: () => onTap(2),
                        ),
                        // This line doesn't crash the app when Arabic Sign Sanah (U+0601) is alone. Opening bracket
                        // faces the wrong way. Kerning is amazing.
                        DataCell(
                          RichText(
                              text: toggleTest[2]
                              ? const TextSpan(
                                  text:
                                      'اس کی ٹسٹ نہیں۔',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Scheherazade',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur',
                                          scriptCode: 'Arab')))
                              : const TextSpan(
                                  text:
                                      '[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Scheherazade',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur',
                                          scriptCode: 'Arab'))),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right),
                              onTap: () => onTap(2)),
                        // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
                        // child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                      ]),
                      //Row 3
                      DataRow(cells: [
                        DataCell(
                            toggleTest[3]
                                ? const Text('No Test')
                                : const Text(
                                    'u061C+Awami+\nScheherazade+Awami:'),
                            onTap: () => onTap(3)),
                        //\n(Adding narrow no break spaces will also be necessary for disappearing glyph problem.)')))),
                        DataCell(RichText(
                            //This is the Noto Nastaliq font, and it displays without problems.  It is here for comparison.
                            //Notice the brackets face the correct way. Parentheses are fine. Kerning is not great.
                            text: toggleTest[3]
                            ? const TextSpan(
                                text: 'اس کی ٹسٹ نہیں۔',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Awami',
                                    locale:
                                        Locale.fromSubtags(languageCode: 'ur')))
                            : const TextSpan(
                                text: '؜[1] یہ تجربہ پیارا ہے؟ ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Awami',
                                    locale:
                                        Locale.fromSubtags(languageCode: 'ur')),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '؁12',
                                      style: TextStyle(
                                          fontFamily: 'Scheherazade',
                                          fontSize: 20,
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur'))),
                                  TextSpan(
                                      text: '(غیر ملکی) ',
                                      style: TextStyle(
                                          fontFamily: 'Awami',
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur')))
                                ]),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right),
                            onTap: () => onTap(3)),
                        // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
                        // child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                      ]),
                      //Row 4
                      DataRow(cells: [
                        DataCell(
                            const Text('Awami: (U+0601 +\nnumbers crashes app'),
                            onTap: () => onTap(4)),
                        // This line doesn't crash the app when Arabic Sign Sanah (U+0601) is alone. Opening bracket
                        // faces the wrong way. Kerning is amazing.
                        DataCell(
                          RichText(
                              text: toggleTest[4]
                                  ? const TextSpan(
                                      text:
                                          '[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Awami',
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur')))
                                  : const TextSpan(
                                      text:
                                          '[1] یہ تجربہ پیارا ہے؟ ؁ (غیر ملکی) ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Awami',
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur'))),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right),
                          onTap: () => onTap(4),
                        )
                        // This line crashes the app because of the joining of Arabic Sign Sanah (U+0601) with numbers.
                        // child: Text('[1] یہ تجربہ پیارا ہے؟ ؁12 (غیر ملکی) ', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Awami', locale: Locale.fromSubtags(languageCode: 'ur')), textDirection: TextDirection.rtl),
                      ]),
                      //Row 5
                      DataRow(cells: [
                        DataCell(
                            const Text('Awami: (U+0600 +\nnumbers crashes app)'),
                            onTap: () => onTap(5)),
                        DataCell(
                          RichText(
                              text: toggleTest[5]
                                  ? const TextSpan(
                                      text:
                                          '[۱] یہ تجربہ پیارا ہے؟ ؀12 (غیر ملکی) ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Awami',
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur')))
                                  : const TextSpan(
                                      text:
                                          '[۱] یہ تجربہ پیارا ہے؟ ؀ (غیر ملکی) ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Awami',
                                          locale: Locale.fromSubtags(
                                              languageCode: 'ur'))),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right),
                          onTap: () => onTap(5),
                        ),
                      ]),
                      //Row 6
                      DataRow(cells: [
                        DataCell(
                            const Text('Awami: (U+0602 +\nnumbers crashes app)'),
                            onTap: () => onTap(6)),
                        DataCell(
                            RichText(
                                text: toggleTest[6]
                                    ? const TextSpan(
                                        text:
                                            '[1] یہ تجربہ پیارا ہے؟ ؂12 (غیر ملکی) ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Awami',
                                            locale: Locale.fromSubtags(
                                                languageCode: 'ur')))
                                    : const TextSpan(
                                        text:
                                            '[1] یہ تجربہ پیارا ہے؟ ؂ (غیر ملکی) ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Awami',
                                            locale: Locale.fromSubtags(
                                                languageCode: 'ur'))),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right),
                          onTap: () => onTap(6),
                        ),
                      ]),
                      //Row 7
                      DataRow(cells: [
                        DataCell(
                            const Text('Awami: (U+0603 +\nnumbers crashes app)'),
                            onTap: () => onTap(7)),
                        DataCell(
                            RichText(
                              text: toggleTest[7]
                              ? const TextSpan(
                                  text: '[1] یہ تجربہ پیارا ہے؟ ؃12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Awami',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur')))
                              : const TextSpan(
                                  text: '[1] یہ تجربہ پیارا ہے؟ ؃ (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Awami',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur'))),            
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,),
                          onTap: () => onTap(7),
                        ),
                      ]),
                      //Row 8
                      DataRow(cells: [
                        DataCell(
                              toggleTest[8]
                              ? const Text('Scheherazade: (U+0604\ncombining numbers)')
                              : const Text('Awami: (U+0604 not\ncombining numbers)'),
                            onTap: () => onTap(8)),
                        DataCell(
                          RichText(
                              text: toggleTest[8]
                              ? const TextSpan(
                                  text:
                                      '[1] یہ تجربہ پیارا ہے؟ ؄12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Scheherazade',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur')))
                              : const TextSpan(
                                  text:
                                      '[1] یہ تجربہ پیارا ہے؟ ؄12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Awami',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur'))),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right),
                          onTap: () => onTap(8),
                        ),
                      ]),
                      //Row 9
                      DataRow(cells: [
                        DataCell(
                              toggleTest[9]
                                ? const Text('Scheherazade: (U+0605\ndisplaying and\ncombining numbers)')
                                : const Text('Awami: (U+0605 not\ndisplaying nor\ncombining numbers)'),
                            onTap: () => onTap(9)),
                        DataCell(
                          RichText(
                              text: toggleTest[9]
                              ? const TextSpan(
                                  text:
                                      '[1] یہ تجربہ پیارا ہے؟ ؅12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Scheherazade',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur')))
                              : const TextSpan(
                                  text:
                                      '[1] یہ تجربہ پیارا ہے؟ ؅12 (غیر ملکی) ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Awami',
                                      locale: Locale.fromSubtags(
                                          languageCode: 'ur'))),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right),
                          onTap: () => onTap(9),
                        ),
                      ]),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

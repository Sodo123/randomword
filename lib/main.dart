import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SampleAppPage> {

  String textToShow = 'I Like Flutter';

  void _updateText() {
    setState(() {
      textToShow = 'Flutter is Awsowme!';
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sample App')),
        body: Center(child: Text(textToShow)),
          floatingActionButton: FloatingActionButton(
          onPressed: _updateText,
            tooltip: 'Update Text',
            child: const Icon(Icons.update),
        ),
      );
    }

}



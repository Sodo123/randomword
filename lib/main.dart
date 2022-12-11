
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SampleAppPage> {

  List<Widget> widgets = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0; i < 10; i++) {
        widgets.add(getRow(i));
    }
  }

  Widget getRow(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length));
          developer.log('tapped $i');
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Row $i'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return getRow(position);
        },
        itemCount: widgets.length,
      ),
    );
  }

}



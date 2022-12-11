import 'package:flutter/cupertino.dart';
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

  List<Map<String, dynamic>> data = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  
  Future<void> loadData() async {
    final Uri dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final http.Response response = await http.get(dataURL);
    setState(() {
      data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    });
  }
  
  List<Widget> _getListData() {
    final List<Widget>  widgets = [];
    for(int i=0; i < 100; i++) {
      widgets.add(Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Row ${i}'),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: ListView(children: _getListData()),
    );
  }

}



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'addnote.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimpleToDoApp(),
    );
  }
}

class SimpleToDoApp extends StatefulWidget {
  const SimpleToDoApp({Key? key}) : super(key: key);

  @override
  State<SimpleToDoApp> createState() => _SimpleToDoAppState();
}

class _SimpleToDoAppState extends State<SimpleToDoApp> {
  List<String> todos = [
    "買い物",
    "掃除",
    "洗濯",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo_PINK'),
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final item = todos[index];

            return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 251, 70, 130)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(title: Text(item)));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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

  Future showConfirmDialog(
    context, {
    required String title,
    required onApproved,
  }) async {
    showDialog(
        context: context,
        // barrierDismissibleのbool値をtrueにすると、
        // ダイアログの外側を押した際にダイアログが出る前の画面に戻れるようになります。
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              // デバイスに応じて横幅(width)は調整してください。
              width: 311.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 251, 70, 130), width: 3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min があることで、
                // Columnの子要素の縦幅に合わせて表示できます。
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 10, bottom: 20, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 251, 70, 130),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 251, 70, 130),
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: '検索',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 5,
                          primary: Color.fromARGB(255, 251, 70, 130),
                          onPrimary: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                          child: Text('はい'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo_PINK'),
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
        onPressed: () {
          // print("add");

          // setState(() {
          //   todos.add("新しいToDo");
          // });
          showConfirmDialog(
            context,
            title: 'ToDoを追加',
            onApproved: () {
              // はい が押された時の処理を入れる。
              // 以下は例
              Navigator.of(context).pop();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
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
                child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 251, 70, 130),
                      ),
                      onPressed: () {
                        print("delete");
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                    title: Text(item)));
          },
        ),
      ),
    );
  }
}

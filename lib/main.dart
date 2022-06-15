import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  List<String> todos = [];
  int todosCount = 10;
  String title = '';

  Future showAddDialog(
    context, {
    required String title,
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
                      color: const Color.fromARGB(255, 251, 70, 130), width: 3),
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
                      child: TextFormField(
                        onFieldSubmitted: (text) {
                          print(text);
                          addTodo(text);
                          Navigator.of(context).pop();
                        },
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
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 5,
                        primary: const Color.fromARGB(255, 251, 70, 130),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: Text('戻る',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ));
        });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
      todosCount = todos.length;
    });
  }

  void addTodo(String text) {
    setState(() {
      if (text != '') {
        todos.add(text);
        todosCount = todos.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 216, 225),
      appBar: AppBar(
        title: const Text('ToDo_PINK'),
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
        onPressed: () {
          showAddDialog(
            context,
            title: 'ToDoを追加',
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "トースト表示成功！",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red[300],
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Text('表示'),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  todosCount == 0
                      ? title = 'ToDoを追加してください'
                      : title = '残りのToDo数:',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 70, 130)),
                )),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Expanded(
                child: SizedBox(
                  height: 200.0,
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
                                  removeTodo(index);
                                },
                              ),
                              title: Text(item)));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class TodoList extends StatelessWidget {
//   List<String> todos;
//   int todosCount;
//   TodoList({required this.todos, required this.todosCount});

//   @override
//   Widget build(BuildContext context) {
//     ListView.builder(
//       //nestのエラー回避
//       itemCount: todos.length,
//       itemBuilder: (context, index) {
//         final item = todos[index];
//         return Card(
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(color: Color.fromARGB(255, 251, 70, 130)),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: ListTile(
//                 trailing: IconButton(
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Color.fromARGB(255, 251, 70, 130),
//                   ),
//                   onPressed: () {
//                     removeTodo(index);
//                   },
//                 ),
//                 title: Text(item)));
//       },
//     );
//   }
// }

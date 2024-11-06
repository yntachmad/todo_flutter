// import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTodo extends StatefulWidget {
  void Function({required String todoText}) changeText;

  AddTodo({super.key, required this.changeText});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

TextEditingController todoText = TextEditingController();

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Todo'),
        TextField(
          controller: todoText,
          decoration: const InputDecoration(
              // hintText: "Add your todo taxt",
              // label: Text("username"),
              // icon: Icon(FeatherIcons.camera),
              ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            // print(todoText.text);
            widget.changeText(todoText: todoText.text);
            todoText.clear();
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}

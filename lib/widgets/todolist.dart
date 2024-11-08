import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Todolist extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  Todolist({super.key, required this.todoList, required this.updateLocalData});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  void onitemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                widget.updateLocalData();
                Navigator.pop(context);
              },
              child: const Text('Mark as done'),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? const Center(
            child: Text("No Data Available"),
          )
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  onitemClicked(index: index);
                },
                title: Text(widget.todoList[index]),
                // leading: const Icon(Icons.arrow_circle_up_outlined),
                // trailing: const Icon(Icons.arrow_circle_up_rounded),
              );
            },
          );
  }
}

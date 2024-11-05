import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:todo_app/add_todo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      drawer: Drawer(
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Drawer Data'),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'TODO',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              // enableFeedback: false,
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              onTap: () {
                showModalBottomSheet(
                  // backgroundColor: Colors.red[900],
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      height: 200,
                      // ignore: prefer_const_constructors
                      child: AddTodo(),
                    );
                  },
                );
              },
              child: const Icon(
                FeatherIcons.plus,
                // color: Colors.red,
                // size: 30,
              ),
            ),
          ),
        ],
        // backgroundColor: Colors.blue,
      ),
      body: Container(),
    );
  }
}

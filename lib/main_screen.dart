import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/widgets/todolist.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void changeText({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (content) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('This todo already exists.'),
              actions: [
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
    updateLocalData();
  }

  @override
  void initState() {
    super.initState();
    loadDataLocal();
  }

  void updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('todoList', todoList);
  }

  void loadDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    todoList = (prefs.getStringList('todoList') ?? []).toList();
    setState(() {});
  }

  void showModalAddTask() {
    showModalBottomSheet(
      // backgroundColor: Colors.red[900],
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            // ignore: prefer_const_constructors
            child: AddTodo(
              addTodo: changeText,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      drawer: Drawer(
          // ignore: prefer_const_constructors
          child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blueGrey,
            child: const Center(
              child: Text(
                "Todo App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              launchUrl(
                Uri.parse("https://www.google.com/"),
              );
            },
            leading: const Icon(Icons.person_2_outlined),
            title: const Text(
              'About Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              launchUrl(
                Uri.parse("mailto:achmad_djayanto@careind.or.id"),
              );
            },
            leading: const Icon(Icons.mail_lock_outlined),
            title: const Text(
              'Contact Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
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
                showModalAddTask();
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
      body: Todolist(todoList: todoList, updateLocalData: updateLocalData),
    );
  }
}

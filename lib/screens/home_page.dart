import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:todo_ai/screens/login_page.dart';
import 'package:todo_ai/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
        name: 'Design Logo',
        description: 'Make logo for the mini project',
        createdDate:
            'Created in ${DateFormat('d MMMM').format(DateTime.now())}',
        isDone: false),
    Task(
        name: 'Make UI Design',
        description:
            'Make UI design for the mini project post figma link to the trello using...',
        createdDate:
            'Created in ${DateFormat('d MMMM').format(DateTime.now())}',
        isDone: false),
  ];

  List<Task> doneTasks = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _specificDateController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: HexColor("A694E1"),
      builder: (BuildContext context) {
        return SizedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _titleController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Task Title',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _descriptionController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _specificDateController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Specific Date (Optional)',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        suffixIcon: const Icon(Icons.calendar_today,
                            color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _deadlineController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Deadline (Optional)',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        suffixIcon: const Icon(Icons.calendar_today,
                            color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Resim ekleme özelliği eklenecek
                      },
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: const Text(
                        'Add Image (Optional)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        final String title = _titleController.text;
                        final String description = _descriptionController.text;

                        if (title.isNotEmpty && description.isNotEmpty) {
                          setState(() {
                            tasks.add(Task(
                              name: title,
                              description: description,
                              createdDate:
                                  'Created in ${DateFormat('d MMMM').format(DateTime.now())}',
                              isDone: false,
                            ));
                          });
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 130, vertical: 8),
                      ),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          color: HexColor("A694E1"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.isDone = !task.isDone;
      if (task.isDone) {
        tasks.remove(task);
        doneTasks.add(task);
      } else {
        doneTasks.remove(task);
        tasks.add(task);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'TaskMate',
          style: TextStyle(
            color: HexColor("A694E1"),
            fontFamily: "BebasNeue",
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: HexColor("A694E1")),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: HexColor("A694E1")),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.format_list_bulleted, color: HexColor("A694E1")),
                const SizedBox(width: 8),
                Text(
                  'LIST OF TODO - $formattedDate',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: HexColor("A694E1"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...tasks.map((task) => TaskWidget(
                      task: task,
                      onChanged: (bool? value) {
                        _toggleTaskCompletion(task);
                      },
                    )),
              ],
            ),
          ),
          if (doneTasks.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.done_outline_rounded,
                          color: HexColor("A694E1")),
                      const SizedBox(width: 8),
                      Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: HexColor("A694E1"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...doneTasks.map((task) => TaskWidget(
                        task: task,
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(task);
                        },
                      )),
                ],
              ),
            ),
          ],
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: HexColor("A694E1"),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () => _showBottomSheet(context),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'task • description • specific date • deadline',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white),
                    onPressed: () {
                      // Mikrofon tıklama
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

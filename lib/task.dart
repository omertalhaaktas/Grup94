import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Task {
  final String name;
  final String description;
  final String createdDate;
  bool isDone;

  Task({
    required this.name,
    required this.description,
    required this.createdDate,
    this.isDone = false,
  });
}

class TaskWidget extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  const TaskWidget({
    super.key,
    required this.task,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: onChanged,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: task.isDone ? HexColor("C6BAEF") : HexColor("A694E1"),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      task.description,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      task.createdDate,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
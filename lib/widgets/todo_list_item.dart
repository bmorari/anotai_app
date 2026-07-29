import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:anotai_app/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.onDelete, required this.onComplete});

  final Todo todo;
  final Function(Todo) onDelete;
  final Function(Todo) onComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        key: ValueKey(todo.title),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) {
                onComplete(todo);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.check,
              label: 'Concluir',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) {
                onDelete(todo);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(16),
          decoration: todo.completed
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.green[100],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[200],
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                style: todo.completed ? TextStyle(fontSize: 13, decoration: TextDecoration.lineThrough) : TextStyle(fontSize: 13),
              ),
              Text(
                todo.title,
                style: todo.completed ? TextStyle(fontSize: 17, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough) : TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

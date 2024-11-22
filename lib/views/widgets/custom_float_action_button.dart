import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/models/note_model.dart';


class CustomFloatActionButton extends StatefulWidget {
  const CustomFloatActionButton({super.key});

  @override
  State<CustomFloatActionButton> createState() =>
      _CustomFloatActionButtonState();
}

class _CustomFloatActionButtonState extends State<CustomFloatActionButton> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      clipBehavior: Clip.hardEdge,
      backgroundColor: Color(0xff252525),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Note'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: contentController,
                    maxLines: 5,
                    decoration: const InputDecoration(labelText: 'Content'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<NoteCubit>().addNote(
                          title: titleController.text,
                          content: contentController.text,
                        );
                    titleController.clear();
                    contentController.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

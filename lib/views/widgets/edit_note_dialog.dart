import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class EditNoteDialog extends StatefulWidget {
  final NoteModel note;

  const EditNoteDialog({Key? key, required this.note}) : super(key: key);

  @override
  State<EditNoteDialog> createState() => _EditNoteDialogState();
}

class _EditNoteDialogState extends State<EditNoteDialog> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Note'),
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
            // Call updateNote from NoteCubit
            context.read<NoteCubit>().updateNote(
                  id: widget.note.id,
                  title: titleController.text,
                  content: contentController.text,
                );

            // Update the UI in NoteDetailsScreen
            Navigator.of(context).pop({
              'title': titleController.text,
              'content': contentController.text,
            });
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

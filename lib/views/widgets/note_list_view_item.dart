import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class NoteListViewItem extends StatelessWidget {
  const NoteListViewItem({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.content),
            const SizedBox(height: 4),
            Text(
              'Updated: ${note.updatedAt != null ? note.updatedAt!.toLocal() : 'Never'}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final titleController =
                        TextEditingController(text: note.title);
                    final contentController =
                        TextEditingController(text: note.content);

                    return AlertDialog(
                      title: const Text('Update Note'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration:
                                const InputDecoration(labelText: 'Title'),
                          ),
                          TextField(
                            controller: contentController,
                            decoration:
                                const InputDecoration(labelText: 'Content'),
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
                            context.read<NoteCubit>().updateNote(
                                  id: note.id,
                                  title: titleController.text,
                                  content: contentController.text,
                                );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                context.read<NoteCubit>().deleteNote(id: note.id);
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

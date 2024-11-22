import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/widgets/custom_svg_container.dart';
import 'package:notesapp/views/widgets/edit_note_dialog.dart';

class NoteDetailsScreen extends StatefulWidget {
  final NoteModel note;

  const NoteDetailsScreen({super.key, required this.note});

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  late NoteModel note;

  @override
  void initState() {
    super.initState();
    note = widget.note; // Initialize local note
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CustomSvgContainer(
                    imagepath: 'assets/images/back.svg',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    // Open the edit dialog and wait for updates
                    final updatedNote = await showDialog<Map<String, String>>(
                      context: context,
                      builder: (context) => EditNoteDialog(note: note),
                    );

                    if (updatedNote != null) {
                      // Update the UI with the new data
                      setState(() {
                        note = NoteModel(
                          id: note.id,
                          title: updatedNote['title']!,
                          content: updatedNote['content']!,
                          createdAt: note.createdAt,
                          updatedAt: DateTime.now(),
                        );
                      });
                    }
                  },
                  child: const CustomSvgContainer(
                    imagepath: 'assets/images/edit.svg',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<NoteCubit>().deleteNote(id: note.id);
                    Navigator.pop(context); // Navigate back after deletion
                  },
                  child: const CustomSvgContainer(
                    imagepath: 'assets/images/delete.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              // note.title,
              'العنوان : ${note.title}',
              style: AppFontsStyle.expoBold.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'المحتوى : ${note.content}',
              textDirection: TextDirection.rtl,
              style: AppFontsStyle.expoBold.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'تم الانشاء: ${note.createdAt}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            if (note.updatedAt != null)
              Text(
                'تم التحديث: ${note.updatedAt}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

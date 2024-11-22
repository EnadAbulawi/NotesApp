import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/widgets/notes_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    if (widget.notes.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_notes.png',
            width: 320,
            height: 280,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '! لا ملاحظات لعرضها و قم باضافه بعض الملاحظات',
            style: AppFontsStyle.expoRegular
                .copyWith(fontSize: 16, color: Colors.white),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          // childAspectRatio: 3,
        ),
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final note = widget.notes[index];
          return NoteCard(note: note);
        },
      ),
    );
  }
}

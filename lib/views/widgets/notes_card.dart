import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/screens/notes_detail_screen.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });

  final NoteModel note;

  Color _generateRandomColor() {
    final colors = [
      const Color(0xff2D4356),
      const Color(0xff635985),
      const Color(0xffA76F6F),
      const Color(0xffE2703A),
      const Color(0xff87431D),
      const Color(0xff363062),
      const Color(0xff323232),
      const Color(0xff044343),
      const Color(0xff065471),
      const Color(0xff082032),
      // Colors.blue,
      // Colors.green,
      // Colors.orange,
      // Colors.purple,
      // Colors.pink,
      // Colors.teal,
    ];
    return colors[note.id.hashCode % colors.length]; // لون يعتمد على الـ id
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailsScreen(note: note),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
          color: _generateRandomColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Text(
                  note.title,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppFontsStyle.expoBold.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.1,
                height: 0.8,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Text(
                  note.content,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppFontsStyle.expoRegular.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

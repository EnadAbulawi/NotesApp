import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';

class SearchScreenNotesCardWidget extends StatelessWidget {
  const SearchScreenNotesCardWidget({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              note.content,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: AppFontsStyle.expoRegular.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
              // maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:notesapp/views/widgets/custom_svg_container.dart';
// import 'package:notesapp/views/widgets/edit_note_dialog.dart';

// import '../../models/note_model.dart';

// class CustomNoteDetailsAppBar extends StatelessWidget {
//   const CustomNoteDetailsAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const CustomSvgContainer(
//                     imagepath: 'assets/images/back.svg',
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () async {
//                     // Open the edit dialog and wait for updates
//                     final updatedNote = await showDialog<Map<String, String>>(
//                       context: context,
//                       builder: (context) => EditNoteDialog(note: note),
//                     );

//                     if (updatedNote != null) {
//                       // Update the UI with the new data
//                       setState(() {
//                         note = NoteModel(
//                           id: note.id,
//                           title: updatedNote['title']!,
//                           content: updatedNote['content']!,
//                           createdAt: note.createdAt,
//                           updatedAt: DateTime.now(),
//                         );
//                       });
//                     }
//                   },
//                   child: const CustomSvgContainer(
//                     imagepath: 'assets/images/edit.svg',
//                   ),
//                 ),
//                const  SizedBox(
//                   width: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     context.read<NoteCubit>().deleteNote(id: note.id);
//                     Navigator.pop(context); // Navigate back after deletion
//                   },
//                   child:const  CustomSvgContainer(
//                     imagepath: 'assets/images/delete.svg',
//                   ),
//                 ),
//               ],
//             ),
//   }
// }

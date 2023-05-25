import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp2/models/notes_model.dart';

import '../widgets/edit_view_body.dart';

class EditNoteview extends StatelessWidget {
  const EditNoteview({super.key ,required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            EditViewBody(note: note,),
          ],
        ),
      ),
    );
  }
}
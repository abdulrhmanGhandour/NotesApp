import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp2/components/constants.dart';
import 'package:notesapp2/components/show_snak_bar.dart';
import 'package:notesapp2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp2/models/notes_model.dart';
import 'package:notesapp2/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditNoteview(note: note);
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    showSnackBar(context ,'note is delete');
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

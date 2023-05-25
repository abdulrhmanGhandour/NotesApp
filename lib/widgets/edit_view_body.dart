import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp2/components/custom_text_field.dart';
import 'package:notesapp2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp2/models/notes_model.dart';
import '../components/custom_appbar.dart';
import 'colors_list.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              labelText: widget.note.title,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              labelText: widget.note.subTitle,
              maxline: 5,
            ),
            SizedBox(
              height: 20,
            ),
            EditColorList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}

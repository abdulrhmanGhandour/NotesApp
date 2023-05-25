import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp2/cubits/notes_cubit/notes_cubit.dart';
import 'List_view_item.dart';
import '../components/custom_appbar.dart';
import '../components/custom_note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState (){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
            onPressed: () {},
          ),
          SizedBox(
            height: 650,
            child: ListViewItem(),
          ),
        ],
      ),
    );
  }
}

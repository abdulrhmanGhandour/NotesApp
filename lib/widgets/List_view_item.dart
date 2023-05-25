import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp2/models/notes_model.dart';
import '../components/custom_note_item.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes??[];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) => CustomNoteItem(note: notes[index]),
        );
      },
    );
  }
}

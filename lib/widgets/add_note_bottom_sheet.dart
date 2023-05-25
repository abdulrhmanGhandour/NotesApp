import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp2/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp2/widgets/add_note_form.dart';
import '../components/show_snak_bar.dart';
import '../cubits/notes_cubit/notes_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            showSnackBar(context, 'Success');
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            showSnackBar(context, 'was err${state.errMessage}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoding ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 32,
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: AddNotesForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}

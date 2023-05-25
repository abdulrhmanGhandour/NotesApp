import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp2/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp2/simple_bloc_observer.dart';
import 'package:notesapp2/views/notes_view.dart';
import 'components/constants.dart';
import 'models/notes_model.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: PoppinsFont),
        home: const NotesView(),
      ),
    );
  }
}

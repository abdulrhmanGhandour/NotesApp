import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp2/components/custom_text_field.dart';
import 'package:notesapp2/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp2/models/notes_model.dart';
import 'package:notesapp2/widgets/colors_list.dart';
import '../components/custom_button.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            labelText: 'content',
            maxline: 5,
          ),
          SizedBox(
            height: 20,
          ),
          ColorListVew(),
           SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoding: state is AddNoteLoding ? true : false,
                text: 'Add',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    saveDataNoteMOdel(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

//save data in note model
  void saveDataNoteMOdel(BuildContext context) {
    DateTime txdate = DateTime.now();
    NoteModel noteModel = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: DateFormat.yMMMd().format(txdate),
        color: Colors.blue.value);
    BlocProvider.of<AddNoteCubit>(context).AddNotes(noteModel);
  }
}


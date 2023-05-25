import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp2/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp2/models/notes_model.dart';
import '../components/constants.dart';

// color item
class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: isActive
          ? CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                radius: 34,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 38,
              backgroundColor: color,
            ),
    );
  }
}

// color list view
class ColorListVew extends StatefulWidget {
  const ColorListVew({super.key});

  @override
  State<ColorListVew> createState() => _ColorListVewState();
}

class _ColorListVewState extends State<ColorListVew> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        itemCount: KColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = KColors[index];
              setState(() {});
            },
            child: ColorItem(
              color: KColors[index],
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}

//edit color list
class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
 late int currentIndex;

  @override
  void initState() {
    currentIndex = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        itemCount: KColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = KColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: KColors[index],
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}

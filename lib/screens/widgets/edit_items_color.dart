import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/widgets/color_items.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({Key? key,required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
                onTap: (){
                  currentIndex =index;
                  widget.note.color = kColors[index].value;
                  setState(() {

                  });
                },
                child: ColorItems(
                    isActive: currentIndex == index, color: kColors[index])),
          );
        },
      ),
    );
  }
}

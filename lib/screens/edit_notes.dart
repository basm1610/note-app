import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/widgets/custom_textfield_notes.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/edit_items_color.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({Key? key, required this.notes}) : super(key: key);
  final NoteModel notes;

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children:  [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              text: "Edit Notes",
              icon: const Icon(Icons.check_sharp),
              onPressed: () {
                widget.notes.title = title ?? widget.notes.title;
                widget.notes.subTitle = content ?? widget.notes.subTitle;
                widget.notes.save();
                BlocProvider.of<NotesCubit>(context).fetchAllData();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField
              (hint: widget.notes.title,onChanged: (value){
              title=value;
            }),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: widget.notes.subTitle,
              maxLine: 5,
              onChanged: (value){
                content=value;
              },
            ),
            const SizedBox(height: 15,),
             EditNoteColor(note: widget.notes,),
          ],
        ),
      ),
    );
  }
}


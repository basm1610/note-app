import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/edit_notes.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({Key? key,required this.notes}) : super(key: key);
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return  EditNotesScreen(notes: notes,);
            }),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          color:  Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                notes.title,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  notes.subTitle,
                  style: const TextStyle(color: Colors.black26, fontSize: 16),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  notes.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllData();
                },
                icon: const Icon(
                  Icons.delete_sharp,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(right: 26, left: 10),
              child: Text(
                notes.date,
                style: const TextStyle(color: Colors.black26),
              ),
            )
          ],
        ),
      ),
    );
  }
}

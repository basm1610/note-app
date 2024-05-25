import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/cubits/notes/notes_states.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/widgets/add_notes.dart';
import 'package:note_app/screens/widgets/custom_app_bar.dart';
import 'package:note_app/screens/widgets/items_card.dart';

class NotesViews extends StatefulWidget {
  const NotesViews({Key? key}) : super(key: key);

  @override
  State<NotesViews> createState() => _NotesViewsState();
}

class _NotesViewsState extends State<NotesViews> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )
            ),
              context: context, builder: (context){
            return const CustomAddNotes();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomAppBar(text: "Notes",icon: Icon(Icons.search_rounded)),
            BlocBuilder<NotesCubit,NotesStates>(

              builder: (context, state) {
                List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: ListView.builder(
                      itemCount: notes.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: ((context, index) =>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomItemCard(notes: notes[index],),
                      )),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// FFCD7B

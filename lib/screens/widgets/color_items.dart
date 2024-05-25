import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';

class ColorItems extends StatelessWidget {
  const ColorItems({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    )
        : CircleAvatar(
      radius: 25,
      backgroundColor: color,
    );
  }
}
class CustomListColors extends StatefulWidget {
  const CustomListColors({Key? key}) : super(key: key);

  @override
  State<CustomListColors> createState() => _CustomListColorsState();
}

class _CustomListColorsState extends State<CustomListColors> {
  int currentIndex = 0;


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
                  BlocProvider.of<AddNotesCubit>(context).color=kColors[index];
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

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, required this.icon, this.onPressed}) : super(key: key);
  final String text;
  final Icon icon;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.07),
              borderRadius: BorderRadius.circular(16)),
          child: IconButton(
            onPressed:onPressed ,

            color: Colors.white,  icon: icon,
          ),
        )
      ],
    );
  }
}

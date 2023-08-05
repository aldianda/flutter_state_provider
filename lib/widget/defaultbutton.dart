import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String name;
  final Icon? icon;
  final Function() onPress;
  final Color color;
  final Color? txtColor;
  const DefaultButton({
    super.key,
    required this.name,
    required this.onPress,
    required this.color,
    this.icon,
    this.txtColor = const Color.fromARGB(255, 255, 255, 255)
});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: newElevatedButton(),
      ),
    );
  }
  Widget newElevatedButton(){
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: const TextStyle(
          color: Colors.black, fontSize: 14)),
      child: Text(
        name,
        style: TextStyle(color: txtColor),
      ),
      );
  }

}
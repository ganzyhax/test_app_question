import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final bool? unFilled;
  final double? padding;
  final double? width;
  final bool? bordered;
  final Function()? onTap;

  const CustomButton(
      {super.key,
      required this.text,
      this.color,
      this.bordered,
      this.onTap,
      this.width,
      this.padding,
      this.textColor,
      this.unFilled});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (width == null) ? null : width,
        padding:
            (padding == null) ? EdgeInsets.all(10) : EdgeInsets.all(padding!),
        decoration: BoxDecoration(
            border: (bordered != null)
                ? Border.all(color: Color.fromARGB(255, 42, 177, 221))
                : null,
            borderRadius: BorderRadius.circular(15),
            color: (bordered == null)
                ? (color == null)
                    ? (unFilled == null)
                        ? Color.fromARGB(255, 42, 177, 221)
                        : const Color.fromARGB(255, 223, 244, 250)
                    : color
                : Colors.white),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: (bordered == null)
                  ? (color == null)
                      ? (unFilled == null)
                          ? Color.fromARGB(255, 223, 244, 250)
                          : Color.fromARGB(255, 42, 177, 221)
                      : textColor
                  : Color.fromARGB(255, 42, 177, 221),
            ),
          ),
        ),
      ),
    );
  }
}

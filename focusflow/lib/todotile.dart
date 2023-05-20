import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:focusflow/homepage.dart';


class ToDoTile extends StatelessWidget {
  final String title;
  bool done;
  Function(bool?)? onChanged;
  void Function(int)? deleteFun;
  final int index;
  ToDoTile({
    super.key,
    required this.title,
    required this.done,
    required this.onChanged,
    required this.deleteFun,
    required this.index
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        height: 80,
        width: 320,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 152, 227, 239),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: done,
                onChanged: onChanged,
                checkColor: Color.fromARGB(255, 177, 231, 235),
                activeColor: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  title,
                  style:GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      decoration: done == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                  )
                ),
              ),
              Positioned(
                  child: IconButton(
                      onPressed: deleteFun != null ? () => deleteFun!(index) : null,
                      icon: Icon(Icons.delete)))
            ],
          ),
        ));
  }
}

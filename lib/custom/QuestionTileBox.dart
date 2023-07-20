import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'TextFrame.dart';

class QuestionTile extends StatefulWidget {
  final String text;
  final dynamic Function(String, int, bool)? onSelected;
  final List<String> buttons;

  const QuestionTile({
    Key? key,
    required this.text,
    this.onSelected,
    required this.buttons,
  }) : super(key: key);

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFrame(comment: widget.text),
          ),
          GroupButton(
            options: GroupButtonOptions(
              selectedColor: Colors.grey[600],
              borderRadius: BorderRadius.circular(5),
            ),
            onSelected: widget.onSelected,
            buttons: widget.buttons,
          ),
        ],
      ),
    );
  }
}

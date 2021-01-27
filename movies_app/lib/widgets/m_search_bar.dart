import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MSearchBar extends StatefulWidget {
  final TextEditingController textController;

  MSearchBar(this.textController);
  @override
  _MSearchBarState createState() => _MSearchBarState();
}

class _MSearchBarState extends State<MSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: TextInputType.text,
      autofocus: false,
      autocorrect: false,
      maxLines: 1,
      textAlign: TextAlign.start,
      cursorColor: moviesSearchTextColor,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: moviesSearchTextColor,
          fontSize: 25,
        ),
      ),
    );
  }
}

// Package Imports
import 'package:flutter/material.dart';
// Inner Imports
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
      style: TextStyle(
        fontSize: 27,
        color: moviesSearchTextColor,
      ),
      decoration: InputDecoration(
        hintMaxLines: 1,
        hintText: 'Movie, Actors, Directors...',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: moviesSearchTextColor,
            width: 2,
          ),
        ),
        hintStyle: TextStyle(
          color: moviesSearchTextColor,
          fontSize: 27,
        ),
      ),
    );
  }
}

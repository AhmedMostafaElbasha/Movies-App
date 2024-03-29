// Package Imports
import 'package:flutter/material.dart';
// Inner Imports
import '../constants/constants.dart';

/*
MErrorState
A state that gets displayed to user to indicate to an error.
 */
class MErrorState extends StatelessWidget {
  final String errorMessage;

  MErrorState(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildErrorIcon(),
          _buildErrorMessage(errorMessage),
        ],
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Icon(
        Icons.error,
        size: 40,
        color: moviesRatingIconColor,
      ),
    );
  }

  Widget _buildErrorMessage(String errorMessage) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text(
        errorMessage,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

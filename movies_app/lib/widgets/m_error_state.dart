import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MErrorState extends StatelessWidget {
  final String errorMessage;

  MErrorState(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: moviesRatingIconColor,
            ),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

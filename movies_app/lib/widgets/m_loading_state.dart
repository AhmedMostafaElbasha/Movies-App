import 'package:flutter/material.dart';
import 'package:movies_app/constants/colors.dart';

class MLoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              'Movies is being loaded. Please wait...',
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

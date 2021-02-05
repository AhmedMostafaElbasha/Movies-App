// Package Imports
import 'package:flutter/material.dart';

class MLoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildCircularProgressIndicator(),
          _buildPleaseWaitStatement(),
        ],
      ),
    );
  }

  Widget _buildCircularProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildPleaseWaitStatement() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text(
        'Movies is being loaded. Please wait...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

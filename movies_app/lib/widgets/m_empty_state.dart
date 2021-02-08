import 'package:flutter/material.dart';

class MEmptyState extends StatelessWidget {
  final String itemsKind;

  MEmptyState(this.itemsKind);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildErrorIcon(),
          _buildErrorMessage(itemsKind),
        ],
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Icon(
        Icons.warning,
        size: 50,
        color: Colors.amberAccent,
      ),
    );
  }

  Widget _buildErrorMessage(String itemsKind) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        'There are no $itemsKind for current time.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

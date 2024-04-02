import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Text(
        'Are you sure?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Do you want to exit the Entry ?',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Navigate back
            Navigator.of(context).pop(true);
          },
          child: const Text(
            'Yes',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // Dismiss dialog
            Navigator.of(context).pop(false);
          },
          child: const Text(
            'No',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
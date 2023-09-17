import 'package:flutter/material.dart';

Future<dynamic> showErrorMessage(
    {required BuildContext context,
    required String title,
    required String description}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

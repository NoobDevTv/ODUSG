import 'package:flutter/material.dart';

class SimpleDialogSingleInput {
  static AlertDialog create({
    String? hintText,
    String? labelText,
    required String title,
    String defaultText = "",
    int maxLines = 1,
    required ValueChanged<String> onSubmitted,
    required BuildContext context,
  }) {
    var tec = TextEditingController();
    tec.text = defaultText;

    return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                  decoration:
                      InputDecoration(hintText: hintText, labelText: labelText),
                  controller: tec,
                  maxLines: maxLines,
                  autofocus: true,
                  onSubmitted: (s) {
                    Navigator.pop(context, s);
                    onSubmitted(s);
                  }),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context, "")),
          TextButton(
              child: const Text("Accept"),
              onPressed: () {
                Navigator.pop(context, "");
                onSubmitted(tec.text);
              })
        ]);
  }
}

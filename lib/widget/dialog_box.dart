import 'package:flutter/material.dart';
import 'package:to_do_app/widget/my_button.dart';

class DialogBox extends StatelessWidget {
  String title;
  VoidCallback onPressedAddButton;
  VoidCallback onPressedCancelButton;
  final dynamic controller;

  DialogBox({
    super.key,
    required this.title,
    required this.onPressedAddButton,
    required this.onPressedCancelButton,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Cancel',
                  onPressed: onPressedCancelButton,
                ),
                const SizedBox(
                  width: 4,
                ),
                MyButton(
                  text: 'Add',
                  onPressed: onPressedAddButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

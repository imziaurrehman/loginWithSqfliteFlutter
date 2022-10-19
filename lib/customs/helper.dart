import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperView extends StatelessWidget {
  const HelperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 6,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Please wait...",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String toast) {
    Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.5);
  }
}

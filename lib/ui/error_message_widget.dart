import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(
      {super.key, this.msg = 'Oops, something went wrong\ntry again later.'});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          CupertinoIcons.exclamationmark_triangle_fill,
          color: Colors.yellow.shade300,
        ),
        Text(
          msg,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

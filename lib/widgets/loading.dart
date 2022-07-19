import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color color;

  const Loading({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}

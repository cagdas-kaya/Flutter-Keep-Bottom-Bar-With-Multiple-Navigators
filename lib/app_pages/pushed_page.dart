import 'package:flutter/material.dart';

class PushedPage extends StatelessWidget {
  static const route = '/pushedPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pushed Page'),
        ),
        body: Center(child: Text('Pushed Page')));
  }
}

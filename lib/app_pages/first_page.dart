import 'package:flutter/material.dart';
import 'package:keepbottombar/app_pages/pushed_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Push With Bottom Bar'),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: false,
                  ).pushNamed(PushedPage.route);
                },
              ),
              ElevatedButton(
                child: Text('Push Without Bottom Bar'),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator:
                        true, // rootNavigator:true is open page without bottom bar - main page route
                  ).pushNamed(PushedPage.route);
                },
              ),
            ],
          ),
        ));
  }
}

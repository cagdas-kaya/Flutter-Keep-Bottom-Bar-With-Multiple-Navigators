import 'package:flutter/material.dart';
import 'package:keepbottombar/app_pages/pushed_page.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true; //we keep page status
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(
              context,
              rootNavigator: false,
            ).pushNamed(PushedPage.route);
          },
          child: Text('Push Page'),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item: $index'),
              );
            },
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import './root_page.dart';
import 'screen.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/homeScreen';
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Screen> screenList;
  var screens;
  late Screen currentScreen; // we need it for the back button
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    screenList = RootPage().getscreens().toList(); //we call our screens
    screens = screenList
        .map(
          (screen) => Navigator(
            key: screen.navigatorState,
            onGenerateRoute: screen.onGenerateRoute,
          ),
        )
        .toList();
    currentScreen = screenList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
            child: TabBarView(
                //we did not use IndexedStack. I think it creates performance issues
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: screens)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabController.index,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'First',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: 'Second',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: 'Third',
            ),
          ],
          onTap: (int i) => _onTab(i),
        ),
      ),
      onWillPop: () async {
        //we handle android back button
        final currentNavigatorState = currentScreen.navigatorState.currentState;
        if (currentNavigatorState!.canPop()) {
          currentNavigatorState.pop();
          return false;
        } else {
          if (_tabController.index != 0) {
            setState(() {
              currentScreen = screenList[0];
              _tabController.index = 0;
            });
            return false;
          } else {
            print('Exit');
            return false;
          }
        }
      },
    );
  }

  _onTab(int i) {
    setState(() {
      currentScreen = screenList[i];
      _tabController.index = i;
    });
  }
}

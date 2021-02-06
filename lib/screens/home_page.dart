import 'package:flukey_hackathon/screens/settings_view/settings_page_view.dart';
import 'package:flutter/material.dart';

import 'account_view/account_page_view.dart';
import 'home_page_view/home_page_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          bottomNavigationBar: buildBottomTabBar(),
          body: tabBarBody(),
        ),
      ),
    );
  }

  TabBarView tabBarBody() {
    return TabBarView(
      children: [
        SettingsPageView(),
        HomePageView(),
        AccountPageView(),
      ],
    );
  }

  BottomAppBar buildBottomTabBar() {
    return BottomAppBar(
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.settings_applications,
              color: Colors.red,
            ),
            child: Text(
              'Settings',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
          Tab(
            icon: Icon(Icons.home, color: Colors.blue),
            child: Text(
              'Home Page',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
          Tab(
            icon: Icon(Icons.account_box_outlined, color: Colors.green),
            child: Text(
              'My Account',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

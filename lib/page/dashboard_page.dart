import 'package:flutter/material.dart';
import 'package:task/page/first_page.dart';
import 'package:task/page/second_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List listPage = [FirstPage(), SecondPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api task"),
      ),
      body: listPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int i) => setState(() {
          currentIndex = i;
        }),
        items: [
          BottomNavigationBarItem(icon: Text("1"), label: 'page'),
          BottomNavigationBarItem(icon: Text("2"), label: 'page')
        ],
      ),
    );
  }
}

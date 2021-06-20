import 'package:assignment04/calculator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Home> {
  int _selectedTab = 0;
  final _pageOptions = [Calculator(), Calculator(), Calculator()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu),
        title: Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        actions: [
          Icon(Icons.notifications),
          Padding(padding: const EdgeInsets.only(right: 10))
        ],
      ),
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses_outlined),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_rounded),
            title: Text('Back'),
          ),
        ],
      ),
    );
  }
}

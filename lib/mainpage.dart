import 'package:appbar/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<String> _titles = ["Home", "Add", "Search", "Profile"];
  final List<Widget> _pages = [
    HomePage(),
    AddPage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 0, 128),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white ,
          tooltip: 'Menu',
          onPressed: () {},
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 450),
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(255, 255, 255, 255),
        items: <Widget>[
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.add, 1),
          _buildNavItem(Icons.search_outlined, 2),
          _buildNavItem(Icons.person, 3),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Color.fromARGB(255, 255, 255, 255) : Colors.transparent,
      ),
      padding: EdgeInsets.all(10.0),  // Adjust padding to fill the circle
      child: Icon(
        icon,
        size: 24,  // Slightly reduce the size of the icon to fit better within the circle
        color: _currentIndex == index ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page', style: TextStyle(fontSize: 35,color: Color.fromARGB(255, 49, 0, 128) )),
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add ', style: TextStyle(fontSize: 35,color:Color.fromARGB(255, 49, 0, 128))),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search Page', style: TextStyle(fontSize: 35,color:Color.fromARGB(255, 49, 0, 128))),
      ),
    );
  }
}

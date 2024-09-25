import 'package:crud_flutter_app/screens/create_user.dart';
import 'package:crud_flutter_app/screens/employee_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  final appScreen = [
    const EmployeeView(),
    const CreateUser(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple[300],
        unselectedItemColor: Colors.purple[100],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_outlined),
              label: "User",
              activeIcon: Icon(Icons.person_add))
        ],
      ),
    );
  }
}

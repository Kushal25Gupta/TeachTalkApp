import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:teachtool/Views/AddStudentScreen/Add_Student_Screen.dart';
import 'package:teachtool/Views/StudentListScreen/StudentListScreen.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _widgetList = [
    const AddStudentScreen(),
    const StudentListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 26,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'Ubuntu',
        ),
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColor.customPurpleColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Add Student',
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Students',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      body: _widgetList[_currentIndex],
    );
  }
}

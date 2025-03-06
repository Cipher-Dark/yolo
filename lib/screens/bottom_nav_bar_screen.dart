import 'package:flutter/material.dart';
import 'package:yolo/screens/yolo_play.dart';
import 'package:yolo/widgets/custom_roind_button.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _widgetList = [
    Text("Home"),
    YoloPlay(),
    Text("Ginie"),
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFF0D0D0D),
        enableFeedback: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? CustomRoindButton(
                    img: Image.asset("assets/home.png"),
                  )
                : Image.asset("assets/home.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? CustomRoindButton(
                    img: Image.asset("assets/qr.png"),
                  )
                : Image.asset("assets/qr.png"),
            label: "yolo pay",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? CustomRoindButton(
                    img: Image.asset("assets/discount.png"),
                  )
                : Image.asset("assets/discount.png"),
            label: "ginie",
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

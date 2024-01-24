import 'package:filmstv/screen/home_screen_all.dart';
import 'package:filmstv/screen/watchlist.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key, required this.index }) : super(key: key);

  final int index;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _currentindex = 0; 
  final List<Widget> _children = [
    const HomeScreenMain(),
    const WatchListMain(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentindex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1, // Tinggi garis putih
            color: Colors.white,
          ),
          BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            iconSize: 28,
            selectedFontSize: 14,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold
            ),
            unselectedFontSize: 12,
            currentIndex: _currentindex,
            type: BottomNavigationBarType.fixed,
            onTap: onTappedBar,
            backgroundColor: const Color.fromARGB(255, 62, 54, 54),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: 'Watchlist',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeParent extends StatefulWidget {
  const HomeParent({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<HomeParent> createState() => _HomeParentState();
}

class _HomeParentState extends State<HomeParent> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            debugPrint('tapped index : $index');
            setState(() {
              selectedIndex = index;
            });
            _goBranch(selectedIndex);
          },
          iconSize: 30,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.work),
            //   label: 'Jobs',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.chat),
            //   label: 'Messages',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ],
        ),
        // backgroundColor: styles.colors.background,
        body: SizedBox.expand(
          child: widget.navigationShell,
        ),
      ),
    );
  }
}

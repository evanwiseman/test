import 'package:flutter/material.dart';
import 'package:test/pages/pages.dart';
import 'package:test/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Home');

  final pages = const [
    HomePage(),
    SearchPage(),
    MapPage(),
    ChatPage(),
    ProfilePage(),
  ];

  final pageTitles = const [
    'Home',
    'Search',
    'Map',
    'Chat',
    'Profile',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    super.key,
    required this.onItemSelected,
  });

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _NavigationBarItem(
          index: 0,
          label: 'Home',
          icon: Icons.square,
          isSelected: selectedIndex == 0,
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 1,
          label: 'Search',
          icon: Icons.square,
          isSelected: selectedIndex == 1,
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 2,
          label: 'Map',
          icon: Icons.square,
          isSelected: selectedIndex == 2,
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 3,
          label: 'Chat',
          icon: Icons.square,
          isSelected: selectedIndex == 3,
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 4,
          label: 'Profile',
          icon: Icons.square,
          isSelected: selectedIndex == 4,
          onTap: handleItemSelected,
        ),
      ],
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    super.key,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 4
            ),
            Text(
              label,
              style: isSelected
                ? const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                )
                : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}


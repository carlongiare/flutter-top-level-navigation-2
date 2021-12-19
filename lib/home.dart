import 'package:flutter/material.dart';
import 'package:top_level_navigation_2/screens/screenone.dart';
import 'package:top_level_navigation_2/screens/screenthree.dart';
import 'package:top_level_navigation_2/screens/screentwo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  int _page = 0;

  static const List<Widget> _topLevelScreens = <Widget>[
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  List icons = [
    Icons.home,
    Icons.article,
    Icons.article,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _topLevelScreens,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            const SizedBox(width: 7),
          ],
        ),
        color: const Color(0xfff7f6fb),
        shape: const CircularNotchedRectangle(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  buildTabIcon(int index) {
    return IconButton( 
      icon: Icon(
        icons[index],
        size: 28.0,
      ),
      color: _page == index ? const Color(0xffD2691E) : Colors.black,
      onPressed: () => _pageController.jumpToPage(index),
    );
  }
}

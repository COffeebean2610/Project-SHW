import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:project_shw/appbar/app_bar.dart';

import 'package:project_shw/pages/settings.dart';
import 'package:project_shw/pages/locations_for_google_maps.dart';
import 'package:project_shw/pages/tutorial.dart';
import 'package:project_shw/search_screen/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Widget> _pageList = [
    const SearchScreen(),
    const LocationsForGoogleMaps(),
    const Tutorial(),
    const Settings()
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
        child: const AppDrawerForAll(
          title: 'Samruddhi-Mahamarg',
        ),
      ),
      // body: _pageList[_selectedIndex],
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: _children,
      // ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
              child: child,
            ),
        child: _pageList[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'All Routes',
            backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_sharp),
            label: 'Tutorials',
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
            backgroundColor: Colors.black12,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber.shade900,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

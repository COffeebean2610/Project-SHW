import 'package:flutter/material.dart';
import 'package:project_shw/appbar/app_bar.dart';
import 'package:project_shw/models/tab_navigator.dart';
import 'package:project_shw/pages/settings.dart';
import 'package:project_shw/pages/locations_for_google_maps.dart';
import 'package:project_shw/pages/petrol_pumps.dart';
import 'package:project_shw/search_screen/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Widget> _children = [
    const SearchScreen(),
    const LocationsForGoogleMaps(),
    const PetrolPumps(),
    const Settings()
  ];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Search": GlobalKey<NavigatorState>(),
    "All Routes": GlobalKey<NavigatorState>(),
    "Stops": GlobalKey<NavigatorState>(),
    "Settings": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  final List<String> pageKeys = ["Search", "All Routes", "Stops", "Settings"];

  late String _currPage;

  @override
  void initState() {
    super.initState();
    _currPage = pageKeys[0];
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currPage) {
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) async {
        final isFirstRouteInCurrentTab =
        await _navigatorKeys [_currPage]?.currentState?.maybePop();
        if (isFirstRouteInCurrentTab != null || !isFirstRouteInCurrentTab! == true) {
          if (_currPage == "Search") {
            _selectTab("Search", 1);


// let system handle back button if we' re on the first route

          }

        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
          child: const AppDrawerForAll(
            title: 'Samruddhi-Mahamarg',
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _children,
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
              icon: Icon(Icons.not_interested),
              label: 'Stops',
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.black12,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

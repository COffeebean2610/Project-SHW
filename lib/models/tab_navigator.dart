import 'package:flutter/material.dart';
import 'package:project_shw/pages/locations_for_google_maps.dart';
import 'package:project_shw/pages/tutorial.dart';
import 'package:project_shw/search_screen/search_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({super.key, required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget child;
    if(tabItem == 'Search') {
      child = const SearchScreen();
    }
    else if (tabItem == 'All Routes') {
      child = const LocationsForGoogleMaps();
    }
    else if (tabItem == 'Stops') {
      child = const Tutorial();
    }
    else if (tabItem == 'Settings') {
      child = const LocationsForGoogleMaps();
    }
    else {
      child = const SearchScreen();
    }
   return Container(
     child: child,
   );

  }
}

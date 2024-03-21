import 'package:flutter/material.dart';
import 'package:project_shw/appbar/app_bar.dart';
import 'package:project_shw/search_screen/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
          child: const AppDrawerForAll( title: 'Samruddhi-Mahamarg',)),
      body: const SearchScreen(),
      backgroundColor: Colors.black,
    );
  }
}

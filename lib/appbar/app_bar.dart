import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project_shw/pages/locations_for_google_maps.dart";

import "../search_screen/search_screen.dart";

class AppDrawerForAll extends StatelessWidget {
  final String title;
  const AppDrawerForAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.topCenter))),
      title: Text(
        "Samruddhi Roadlines",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 44 * MediaQuery.of(context).size.aspectRatio),
      ),
      actions: <Widget>[
        // title != "Samruddhi Roadlines"
        //     ? IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
        //     : IconButton(
        //         icon: const Icon(
        //           Icons.refresh,
        //           size: 30,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const Home(),
        //             ),
        //           );
        //         },
        //       ),
        IconButton(
          icon: const Icon(Icons.search, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
        ),
        PopupMenuButton<String>(
          onSelected: (String choice) {
            handleClick(choice, context);
          },
          itemBuilder: (BuildContext context) {
            return {'Logout', 'See All Routes'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: const TextStyle(color: Colors.black,fontSize:13,fontWeight: FontWeight.bold),
                ),
              );
            }).toList();
          },
          color: Colors.amber,
          position: PopupMenuPosition.under,
          offset:const Offset(0, 16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  23 * MediaQuery.of(context).size.aspectRatio)),
          elevation: 4,
        ),
        // IconButton(
        //   icon: const Icon(Icons.logout,color: Colors.black,),
        //   onPressed: () async {
        //     await FirebaseAuth.instance.signOut();
        //   },
        // ),
      ],
    );
  }

  void handleClick(String value, BuildContext context) {
    switch (value) {
      case 'Logout':
        logout();
        break;
      case 'see all routes':
        locations(context);
        break;
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void locations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationsForGoogleMaps(),
      ),
    );
  }
}

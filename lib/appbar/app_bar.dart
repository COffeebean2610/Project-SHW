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
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ],
      leading: PopupMenuButton(itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: Text("See All Routes"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationsForGoogleMaps()));
              }),
        ];
      }),
    );
  }
}

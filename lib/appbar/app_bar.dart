import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";


import "../search_screen/search_screen.dart";

class AppDrawerForAll extends StatelessWidget {
  final String title;
  const AppDrawerForAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade600,
      elevation: 0,
      title: Text(
        "Samruddhi Roadlines",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 10 * MediaQuery.of(context).devicePixelRatio),
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
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
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
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }
}

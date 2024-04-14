import 'package:flutter/material.dart';

class PetrolPumps extends StatefulWidget {
  const PetrolPumps({super.key});

  @override
  State<PetrolPumps> createState() => _PetrolPumpsState();
}

class _PetrolPumpsState extends State<PetrolPumps> {






  @override
  void initState() {
    super.initState();
    // Change the duration as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.grey.shade900, Colors.grey.shade900],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: const [0.1, 0.9],
      )),
      child: Center(

      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PetrolPumps extends StatefulWidget {
  const PetrolPumps({super.key});

  @override
  State<PetrolPumps> createState() => _PetrolPumpsState();
}

class _PetrolPumpsState extends State<PetrolPumps> {
  final images = [

    "assets/tutorial/1.png",
    "assets/tutorial/2.png",
    "assets/tutorial/3.png",
    "assets/tutorial/4.png",
    "assets/tutorial/5.png",
    "assets/tutorial/6.png",
    "assets/tutorial/7.png",
    "assets/images/tutorial.gif",
  ];

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
        child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) => Column(
                  children: [
                    Image.asset(images[index]),
                    Text(index == 7?"How to Skip a Stop?":
                        index == 0?"How to Change Start Location?":
                      "${index + 1} / ${images.length}",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold,
                        fontSize: 50 * MediaQuery.of(context).size.aspectRatio
                      ),
                    ),
                  ],
                ),
            options: CarouselOptions(

              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height,
              aspectRatio: 16 / 9,
            )),
      ),
    ));
  }
}

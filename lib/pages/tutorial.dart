import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  final List<String> images = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade900, Colors.grey.shade900],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.9],
          ),
        ),
        child: Center(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) => Column(
              children: [
                Expanded(
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  index == 7
                      ? "How to Skip a Stop?"
                      : index == 0
                      ? "How to Change Start Location?"
                      : "${index + 1} / ${images.length}",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 50 * MediaQuery.of(context).size.aspectRatio,
                  ),
                ),
              ],
            ),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
      ),
    );
  }
}

//height: MediaQuery.of(context).size.height,
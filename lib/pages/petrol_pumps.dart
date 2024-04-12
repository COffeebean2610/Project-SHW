import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PetrolPumps extends StatefulWidget {
  const PetrolPumps({super.key});

  @override
  State<PetrolPumps> createState() => _PetrolPumpsState();
}

class _PetrolPumpsState extends State<PetrolPumps> {

  Position? _currentPosition;
  late bool servicePermission = false;
  late LocationPermission permission;

  String lat = "";
  String long = "";

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("location service not enabled");

    }
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();



  }




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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Petrol Pumps near location: $lat, $long',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40 * MediaQuery.of(context).size.aspectRatio),
            ),
            const SizedBox(
              height: 7,
            ),

            ElevatedButton(onPressed: () async {
              _currentPosition = await _getCurrentLocation();
              setState(() {
                lat = _currentPosition!.latitude.toString();
                long = _currentPosition!.longitude.toString();
              });
              print("$_currentPosition this is the address");
            }, child: const Text("Get Location"))
          ],
        ),
      ),
    ));
  }
}

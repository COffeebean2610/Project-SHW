import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Samruddhi Roadlines",
          style: TextStyle(color: Colors.black,
            fontWeight:FontWeight.bold,
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(

                decoration: InputDecoration(
                  labelText: "From",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide:const BorderSide(
                      color: Colors.blue,
                      width: 2,

                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),

              ),
              const SizedBox(height: 11),
              TextField(
                decoration: InputDecoration(
                  labelText: "To",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){},
                  child: const Text(
                'Search'
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

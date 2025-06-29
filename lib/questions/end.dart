

import 'package:flutter/material.dart';



class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar( backgroundColor: Colors.brown.shade100,
        title: Center(
          child: Text(
            "FINAL RESULT",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.yellow.shade200,
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "YOUR SCORE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

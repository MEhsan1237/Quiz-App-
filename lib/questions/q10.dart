import 'package:flutter/material.dart';

import 'end.dart';


class Go10 extends StatelessWidget {
  const Go10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              "images/game.one.jpg",
              height: 80,

            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10),
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "QUESTION 10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 15.0),
            child: Text(
              "What is the highest civilian award in Pakistan, given for services to the country?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return End();
                },));
              },
              child: Center(
                child: Text(
                  "Hilal-e-Pakistan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return End();
                },));
              },
              child: Center(
                child: Text(
                  "Sitara-e-Imtiaz",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return End();
                },));
              },
              child: Center(
                child: Text(
                  "Nishan-e-Imtiaz",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                fixedSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(width: 1.5, color: Colors.black),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => End()),
                );
              },
              child: Center(
                child: Text(
                  "Tamgha-e-Shujaat",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(105, 20)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 1.5),
                    Icon(Icons.arrow_back),
                    Text(
                      "BACK",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(105, 20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return End();
                  },));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(width: 1.5),
                    Text(
                      "NEXT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}

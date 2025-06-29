
import 'package:flutter/material.dart';
import 'package:quiz_app/questions/q1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
         scaffoldBackgroundColor: Colors.brown.shade300,
        brightness: Brightness.dark,

      ),

      home: Go()
  )
  );
}

class Go extends StatelessWidget {
  const Go({super.key});
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          "QUIZ APP INFO", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.0,),
          Text("HISTORY OF PAKISTAN", style: TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 55.0),
            child: Text("QUIZ APP", style: TextStyle(

                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
            ),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              "MOBILE APPLICATION", style: TextStyle(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 43,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white
                  ),
                  height: 30,
                  width: 200,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Icons.radio_button_on, color: Colors.blueAccent,),
                      ),
                      SizedBox(width: 4.0,),
                      Text("HIGH QUALITY DESIGN", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white
                  ),
                  height: 30,
                  width: 200,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Icons.radio_button_on, color: Colors.blueAccent,),
                      ),
                      SizedBox(width: 4.0,),
                      Text("CUSTOMIZABLE LAYERS", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white
                  ),
                  height: 30,
                  width: 120,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Icons.radio_button_on, color: Colors.blueAccent,),
                      ),
                      SizedBox(width: 4.0,),
                      Text("10 SCREENS", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white
                  ),
                  height: 30,
                  width: 260,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Icons.radio_button_on, color: Colors.blueAccent,),
                      ),
                      SizedBox(width: 4.0,),
                      Text("STYLE GUIDE AND COMPONENTS", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,

                  child:
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return Go1();
                      },));
                    },
                        child: Text("START NOW", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),)),
                  ),
                )

              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 140.0, right: 140.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.google, color: Colors.white,),
                    onPressed: () { _launchURL("https://www.google.com");},),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.facebook,color: Colors.white,), onPressed: () { _launchURL("https://www.facebook.com");},),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.twitter,color: Colors.white,), onPressed: () {_launchURL("https://www.twitter.com");},),
                ),

              ],
            ),
          ),

        ],
      ),


    );
  }
}





import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _kgSliderValue = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Apps"),
        backgroundColor: Colors.red,) ,

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "BMI Calculator",
                  style: GoogleFonts.bebasNeue(textStyle: const TextStyle(color: Colors.redAccent, fontSize: 32)),
                ),

                Text("We Care About Our Health", style: TextStyle (color: Colors.redAccent, fontSize: 20),),
                SizedBox(height: 8,),
                Image.network("https://www.katiyarsister.com/wp-content/uploads/2021/03/BMI-Image.jpg"),
                SizedBox(height: 8,),
                Text("Height (${_heightSliderValue.round()}cm)", style: TextStyle (fontSize: 20),),
                Slider(
                  value: _heightSliderValue,
                  max: 200,
                  min: 100,
                  onChanged: (double value) {
                    setState(() {
                      _heightSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 8,),
                Text("Weight (${_kgSliderValue.round()}kg)", style: TextStyle(fontSize: 20),),
                Slider(
                  value: _kgSliderValue,
                  max: 200,
                  min: 10,
                  onChanged: (double value) {
                    setState(() {
                      _kgSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 8,),
                TextButton.icon(
                    onPressed: (){
                      var tempBmi = _kgSliderValue / pow((_heightSliderValue / 100),2);
                      print(tempBmi.round());

                },
                  icon: Icon(Icons.favorite),
                  label: Text("Calculate"))
              ],

            ),
          ),
        ),
      ),
    );
  }
}


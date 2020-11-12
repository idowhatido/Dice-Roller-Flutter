import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DicePage(),
      debugShowCheckedModeBanner: false,
    ));

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String imagePath = 'images/dice_1.png';

  void randomGen() {
    Dice dice = new Dice(6);
    int dicenumber = dice.diceRoll();

    setState(() {
      switch (dicenumber) {
        case 1:
          {
            imagePath = 'images/dice_1.png';
            break;
          }
        case 2:
          {
            imagePath = 'images/dice_2.png';
            break;
          }
        case 3:
          {
            imagePath = 'images/dice_3.png';
            break;
          }
        case 4:
          {
            imagePath = 'images/dice_4.png';
            break;
          }
        case 5:
          {
            imagePath = 'images/dice_5.png';
            break;
          }
        case 6:
          {
            imagePath = 'images/dice_6.png';
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dice"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(imagePath),
                height: 200.0,
                width: 200.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              RaisedButton(
                onPressed: () {
                  randomGen();
                },
                child: Text("Roll Dice"),
                color: Colors.purpleAccent,
              )
            ],
          ),
        ));
  }
}

class Dice {
  int sides;
  Random rand = new Random();
  Dice(this.sides);
  int diceRoll() {
    return rand.nextInt(6);
  }
}

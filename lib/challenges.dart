
import 'package:flutter/material.dart';
import 'package:flutterappdrikk/SnappingListView.dart';
import 'questions.dart';
import 'package:flip_card/flip_card.dart';
import 'main.dart';



class MyApp extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utfordringer',
      theme: ThemeData.dark(),
    );
  }
}

class ChallengePage extends StatelessWidget {



  _renderContent(context, index, utfordring, svar) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 50.0, bottom: 30.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          width: 250.0,
          decoration: BoxDecoration(
            color: utColor,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                child: Text("Trykk for å se utfordringen",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 100, 25, 0),
                child: Text(utfordring,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 90, 0, 0),
                child: Text("Utfordring " + index,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
              ),
              )],
          ),
        ),
        back: Container(
          width: 250.0,
          decoration: BoxDecoration(
            color: sexColor ,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),


          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 100, 15, 0),
                child: Text(svar, style:TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 90, 0, 0),
                child: Text("Utfordring " + index,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
              ),

              )],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

        backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Utfordringer'),
        backgroundColor: backgroundColor,
      ),
        body: Center(
          child: SnappingListView(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
            scrollDirection: Axis.horizontal,
            children: List.generate(Challenges['sporsmol'].length,(index){
              return _renderContent(context,(index+1).toString(), Challenges['sporsmol'][index], Challenges['svar'][index]);

            }
            ), itemExtent: 302,
          ),

        ));
  }


}
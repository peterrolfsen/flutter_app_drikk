import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdrikk/main.dart';
import 'package:flutterappdrikk/questions.dart';
import 'mix.dart';

List catToAdd = [];

// Denne siden lager layout til MIX siden hvor man blander kategoriene.
void main() => runApp(Mix());

class Mix extends StatefulWidget {
  @override

  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<Mix> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Velg kategorier'),
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: backgroundColor,
        ),
        body:

        myLayoutWidget(),

    ));
  }





  Widget myLayoutWidget() {


    return Row(
      children: [

        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Legg til", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
                ),
                createButtonWithState('Standard', standardColor),
                createButtonWithState('Bli kjent', blikjentColor),
                createButtonWithState("Guttavors", guttaColor),
                createButtonWithState("Jentevors", jenteColor),
                createButtonWithState("Sex", sexColor),

        Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(15.0),
    ),
    height: 46.0,
    minWidth: 160.0,
    color: Colors.green,
    textColor: Colors.white,
    child: new Text("START",
    style: TextStyle(fontStyle: FontStyle.italic)),
    onPressed: () {
      navigateToMixPage(context);
      return catToAdd;
    },
    splashColor: Colors.redAccent,
    ),
    ),
              ],
            ),
            color: backgroundColor,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text("Antall spørsmål fra hver kategori: " + prosent(), style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,

                  )),
                ),

                Column(
                    children: catToAdd
                        .map((element) =>
                        Card(
                          child: Column(
                            children: <Widget>[
                              createSelectedButton(element),
                            ],
                          ),
                        ))
                        .toList()),


              ],
            ),

            color: backgroundColor,
          ),
        ),

      ],
    );
  }



  prosent(){
    var state = "0";
    if(catToAdd.length == 0){
      return state;
    } else {
      state = (100/catToAdd.length).round().toString();
      return state;
    }
  }
  Widget checkCat(cat) {
    if (catToAdd.contains(cat)) {
      catToAdd.remove(cat);
      print(cat + ' removed');
    } else {
      catToAdd.add(cat);
      print(cat + ' added');
    }
  }

  Widget createButtonWithState(cat, backgroundcolor){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(23.0),
        ),
        height: 46.0,
        minWidth: 160.0,
        color: backgroundcolor,
        textColor: Colors.white,
        child: new Text(cat,
            style: TextStyle(fontStyle: FontStyle.italic)),
        onPressed: () {
          setState(() {
            checkCat(cat);
          });

        },
        splashColor: Colors.redAccent,
      ),
    );
  }
  

 Widget createSelectedButton(cat){

    return MaterialButton(
      height: 50.0,
      minWidth: 110.0,
      color: Color.fromRGBO(0, 177, 106, 1),
      textColor: Colors.white,
      child: new Text(cat,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13)),
      onPressed: () {
        setState(() {
          checkCat(cat);
        });
      },
    );


}


  Future navigateToMixPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MixPage()));
  }

}
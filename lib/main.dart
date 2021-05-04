import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'standard.dart';
import 'mix.dart';
import 'layout.dart';
import 'questions.dart';
import 'challenges.dart';
import 'guttevors.dart';
import 'jentevors.dart';
import 'sex.dart';
import 'blikjent.dart';
import 'rules.dart';
import 'package:flutterappdrikk/SnappingListView.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutterappdrikk/admob_service.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      home: MainPage(),
    );
  }
}
//Setter standardfarger på de forskjellige kategoriene
var backgroundColor = Color.fromRGBO(51, 51, 67, 1);
var standardColor = Color.fromRGBO(233, 99, 112, 1);
var blikjentColor = Color.fromRGBO(234, 107, 112, 1);
var jenteColor = Color.fromRGBO(235, 115, 113, 1);
var guttaColor = Color.fromRGBO(237, 123, 113, 1);
var sexColor = Color.fromRGBO(237, 128, 113, 1);
var mixColor= Color.fromRGBO(111, 207, 151, 1);
var utColor = Color.fromRGBO(119, 196, 187, 1);
var divider =             Divider(
  color: Color.fromRGBO(83, 83, 107, 1),
  height: 25,
  indent: 135,
  endIndent: 135,
  thickness: 5,
);

class MainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //Lager forsiden som loades inn når appen starter
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/100logo.png', height: 222, width:229),

            MaterialButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(23.0),
              ),
              height: 46.0,
              minWidth: 160.0,
              color: Color.fromRGBO(235, 95, 110, 1),
              textColor: Colors.white,
              child: new Text("Play", style: TextStyle(fontStyle: FontStyle.italic)),
              onPressed: () {
                navigateToSubPage(context);
                //Sjekker hvor mange spørsmål det er i hver kategori for å sikre at det er over 100
                print("Standard: " + dicCategories['Standard'].length.toString());
                print("Bli kjent: " + dicCategories['Bli kjent'].length.toString());
                print("Jentevors: " + dicCategories['Jentevors'].length.toString());
                print("Gutta: " + dicCategories['Guttavors'].length.toString());
                print("Sex: " + dicCategories['Sex'].length.toString());
                print("Challenges: " + Challenges['sporsmol'].length.toString());
              },
              splashColor: Colors.redAccent,
            ),

            //Lager "hvordan spille" knapp
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 160.0,
                color: Colors.transparent,
                textColor: Colors.white,
                child: new Text("Hvordan spille", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToRulePage(context);
                },
                splashColor: Colors.blue,
              ),
            ),




          ],
        ),

    )
    );
  }

  //Navigerer til kategorimenyen
  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }
  //navigerer til "hvordan spille"
  Future navigateToRulePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RulesPage()));
  }
}

class SubPage extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

//Regelsiden / Hvordan spille siden
  @override
  Widget build(BuildContext context) {
    Future<bool> _cRules() {
      return showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('Regler'),
          content: new Text(
              'Når dere spiller utfordring, kaster man først boksen, så flipper man kortet og mottakeren får en utfordring som må utføres før boksen kastes videre av den som tok utfordringen. Om man nekter å gjøre utfordringen, må man chugge'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("Ok"),
            ),

          ],
        ),
      ) ??
          false;
    }

    //Kategorimenyen
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('100 Spørsmål'),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: blikjentColor,
                textColor: Colors.white,
                child: new Text(
                    "Standard", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToStandardPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: blikjentColor,
                textColor: Colors.white,
                child: new Text(
                    "Bli kjent", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToBlikjentPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: jenteColor,
                textColor: Colors.white,
                child: new Text(
                    "Jentevors", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToJentaPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: guttaColor,
                textColor: Colors.white,
                child: new Text("Guttastemning",
                    style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToGuttaPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: sexColor,
                textColor: Colors.white,
                child: new Text(
                    "Sex", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToSexPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),
            divider,
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                ),
                height: 46.0,
                minWidth: 130.0,
                color: mixColor,
                textColor: Colors.white,
                child: new Text(
                    "Mix", style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: () {
                  navigateToMixPage(context);
                },
                splashColor: Colors.redAccent,
              ),
            ),

            divider,

            Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                  shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(23.0),
                  ),
                  height: 46.0,
                  minWidth: 130.0,
                  color: utColor,
                  textColor: Colors.white,

                  child: new Text("Utfordringer", style: TextStyle(fontStyle: FontStyle.italic)),
                  onPressed: () {
                  navigateToChallengePage(context);
                  _cRules();
                  },
                  splashColor: Colors.redAccent,
                  ),
            ),

          ],
        ),
      ),

    );


  }

//Navigasjonslenker for å komme seg inn til de forskjellige kategoriene.
  Future navigateToStandardPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StandardPage()));
  }

  Future navigateToMixPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mix()));
  }

  Future navigateToChallengePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChallengePage()));
  }

  Future navigateToGuttaPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GuttavorsPage()));
  }

  Future navigateToJentaPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => JentevorsPage()));
  }

  Future navigateToSexPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SexPage()));
  }

  Future navigateToBlikjentPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BlikjentPage()));
  }


//For å ta av et lag og komme tilbake til kategorimenyen
  void backToMainPage(context) {
    Navigator.pop(context);
  }

}

//Bygger et kort der det står et spørsmål
Widget BuildCard(text, qNr, colorBackground, colorText) => new Container(
  child: new Center(
    child: new Container(
      height: 300.0,
      width: 300.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 0),
        child: Column(
          children: <Widget>[
            Padding(

              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child:
              new Text("SPØRSMÅL " + (qNr + 1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            new Container(
              height: 250,
              decoration: new BoxDecoration(
              color: colorBackground,
              borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
                bottomLeft: const Radius.circular(40.0),
                bottomRight: const Radius.circular(40.0)
            )
            ),
              child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:Text( text,
                              style: TextStyle(
                                color: colorText,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),


                  ),
          ],
        )

            )
        ),
    ),

  );


//Ads, under utvikling
@override
void initState(){
  initState();
  Admob.initialize(ams.getAdMobAppId());

}

//Lager kort for når alle skal drikke som er hvert tiende spørsmål
Widget BuildCardAll(text, qNr) => new Container(
  child: new Center(
    child: new Container(
        height: 300.0,
        width: 300.0,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 1, 8, 0),
            child: Column(

              children: <Widget>[
                Padding(

                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child:
                  new Text("SPØRSMÅL " + (qNr + 1).toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                new Container(
                  height: 250,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(235, 95, 110, 1),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0)
                      )
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("ALLE SKÅLER!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),
                ),
              ],
            )
            )

        )
    ),
  );

final ams = AdMobService();


//Bygger kategorisiden som inneholder alle kortene
Widget buildPage(kategori, colorBackground, colorText){

  List<int> tens = [10,20,30,40,50,60,70,80,90,100];
  return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(

        title: Text(kategori),
        backgroundColor: backgroundColor,

      ),
      body: Center(
         child: SnappingListView(
          padding: const EdgeInsets.all(30.0),
          scrollDirection: Axis.horizontal,
          children: List.generate(dicCategories[kategori].length,(index){
            //sørger for at hvert tiende kort er et "alle drikker" kort
            for(var x in tens) {
              if (index == (x-1)){
                return BuildCardAll(dicCategories[kategori][index].toString(), index);
                //Fjerner hver tiende og erstatter den. Skal ikke være slik
              }

            }
            return BuildCard(dicCategories[kategori][index].toString(), index, colorBackground, colorText);
          }


          ), itemExtent:302,
        ),

      )
  );
}

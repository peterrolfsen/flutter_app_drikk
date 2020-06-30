import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdrikk/questions.dart';
import 'mix.dart';




class RulesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Hvordan spille'),
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        ),
        backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Denne leken går ut på at man skal kaste en gjenstand (ofte en snusboks) til den man mener matcher spørsmålet. Mottakeren må da drikke en slurk, "
                "før den igjen skal kaste til ny person. \n \n Etter hvert tiende spørsmål, så skal alle skåle! \n \n Psst! Vil du at folk skal bli ekstra tipsy, kan mottakeren drikke to slurker, og de som sitter til høyre og venstre for vedkommende skal drikke én slurk."
              "\n \n Når dere spiller utfordring, kaster man først boksen, så flipper man kortet og mottakeren får en utfordring før boksen kastes videre av den som tok utfordringen." ,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),),

          ),
        )
    );
  }}
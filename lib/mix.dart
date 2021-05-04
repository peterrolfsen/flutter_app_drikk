import 'package:flutter/material.dart';
import 'main.dart';
import 'questions.dart';
import 'layout.dart';
import 'package:flutterappdrikk/SnappingListView.dart';
import 'dart:math';



// ignore: must_be_immutable
class MixPage extends StatelessWidget {
  final _random = new Random();

//En funksjon som lar deg mixe kategoerier
  convertCart(list){
    var randElem = list[_random.nextInt(list.length)];
    //setter en max av spørsmål mix kan inneholde
    var spmPerKat = (99/catToAdd.length).ceil();
    print(catToAdd);
    for(var dicKey in catToAdd) {
      print(dicKey);
      //shuffler alle spørsmålene så de kommer i tilfeldig rekkefølge.
      list[dicKey].shuffle();
      for (var i = 0; i < spmPerKat; i++) {
        print(catToAdd.length);
        print(spmPerKat);

        print("To add" + list[dicKey][i]);
        //Sjekker at spørsmålet ikke kommer to ganger
        if(categories.contains(list[dicKey][i])){
          print("Already in list: "+ list[dicKey][i]);
          print("Added instead: "+ list[dicKey][i+1]);
          categories.add(list[dicKey][i+1]);

        }else {
          print("Added: "+ list[dicKey][i]);
          categories.add(list[dicKey][i]);
        }


      }
    }
    //shuffler alt igjen.
    categories.shuffle();
    print(categories.length);
  }

  inList(list, listElement){
    print(listElement);

  }

  List categories = [];
  @override
  Widget build(BuildContext context) {

    convertCart(dicCategories);
    List<int> tens = [10,20,30,40,50,60,70,80,90,100];

    //Setter inn en safety på tilbakeknappen. Rekkefølgen på kategoriene resettes om man går tilbake.
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Er du sikker?'),
          content: new Text('Om du går tilbake forsvinner rekkefølgen på kortene'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("NEI"),
            ),
            SizedBox(height: 20),
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("JA"),
            ),
          ],
        ),
      ) ??
          false;
    }

    return WillPopScope(
    onWillPop: _onBackPressed,

    child: new Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Mix'),
          backgroundColor: backgroundColor,
        ),
        body: Center(
          child: SnappingListView(
            padding: const EdgeInsets.all(20.0),
            scrollDirection: Axis.horizontal,
            children:
            List.generate(categories.length,(index){
              for(var x in tens) {
                if (index == (x-1)){

                  return BuildCardAll(categories[index].toString(), index);
                  //Fjerner hver tiende og erstatter den. Skal ikke være slik
                }

              }
                 return BuildCard(categories[index].toString(), index, mixColor, Colors.white);
            }
            ), itemExtent: 300,
          ),

        )));
  }



}
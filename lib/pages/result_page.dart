import 'package:flutter/material.dart';
import './home_page.dart';

class ResultPage extends StatelessWidget {

  final int result;
  final int totalQue;

  ResultPage(this.result,this.totalQue);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.purple,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score : ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:50.0), ),  
          new Text(result.toString()+"/"+totalQue.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:50.0)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()), (Route route) => route == null ),
          )
        ],
      ),
    );
  }
}
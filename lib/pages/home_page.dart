import 'package:flutter/material.dart';
import './quiz_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.purple,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image(image:new AssetImage("lib/images/image1.jpg"),
                      fit: BoxFit.cover,
                      height: 550.0,
                      width: 390.0,
                      alignment: Alignment.center,
              ),
            new Text("F.R.I.E.N.D.S",style: new TextStyle(color: Colors.yellow[200],fontSize: 50.0,fontWeight:FontWeight.bold),),
            new Text("Tap to Start !",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight:FontWeight.bold),)
          ],
        ),
      ),
    );
  }
  
}
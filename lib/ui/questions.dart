import 'package:flutter/material.dart';

class Questions extends StatefulWidget {

  final String _question;
  final int _questionNum;

  Questions(this._question,this._questionNum);
  @override
  State createState() => new QuestionsState();
}

class QuestionsState extends State<Questions> with SingleTickerProviderStateMixin {

  Animation<double> _fontAnimation;
  AnimationController _fontAnimationController;

  @override
  void initState(){
    super.initState();
    _fontAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontAnimation =  new CurvedAnimation(parent: _fontAnimationController,curve: Curves.bounceOut);
    _fontAnimation.addListener(() => this.setState(() {}));
    _fontAnimationController.forward();
  }

  @override
  void dispose() {
    _fontAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Questions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question) {
      _fontAnimationController.reset();
      _fontAnimationController.forward();      
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.yellow[300],
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            child: new Center(
             child: new Column(
               children: <Widget>[
                 new Text("Question"+ widget._questionNum.toString() + " : " ,style: new TextStyle(fontSize: _fontAnimation.value * 25),),
                 new Text(widget._question,style: new TextStyle(fontSize: _fontAnimation.value * 25),),
                ],)
             
              )
      ),
      );
  }
}
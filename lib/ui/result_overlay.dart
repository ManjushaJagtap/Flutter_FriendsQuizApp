import 'dart:math';
import 'package:flutter/material.dart';

class ResultOverlay extends StatefulWidget {

  final bool _isCorrectFlag;
  final VoidCallback _onTap;  //void _ontap

  ResultOverlay(this._isCorrectFlag,this._onTap);

  @override
  State createState() => new ResultOverlayState();
}

class ResultOverlayState extends State<ResultOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _symbolAnimation;
  AnimationController _symbolAnimationController;
  @override
  void initState() {
    super.initState();
    _symbolAnimationController = new AnimationController(duration: new Duration(seconds: 2),vsync: this);
    _symbolAnimation = new CurvedAnimation(parent: _symbolAnimationController, curve: Curves.elasticOut);
    _symbolAnimation.addListener(() => this.setState(() {}));
    _symbolAnimationController.forward();
  }

  @override
  void dispose() {
    _symbolAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
               decoration: new BoxDecoration(
                 color: Colors.white,
                 shape: BoxShape.circle
               ),
               child: new Transform.rotate(
                 angle: _symbolAnimation.value * 2 * pi,
                 child: new Icon(widget._isCorrectFlag == true ? Icons.done : Icons.clear, size: _symbolAnimation.value * 80.0,),
               ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0 ),
            ),
            new Text(widget._isCorrectFlag == true ? "Correct !": "Wrong !", style: new TextStyle(color: Colors.white,fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
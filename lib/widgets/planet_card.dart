import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  final String name;
  final int targetCode;
  final Image image;
  final Function onTapCallback;

  PlanetCard(this.name, this.targetCode, {this.image, this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = <Widget>[];

    if (image != null) {
      rowChildren.add(image);
    }

    rowChildren.add(new Text(
      this.name,
      style: new TextStyle(color: Colors.white, fontSize: 50.0, fontFamily: 'Comic Neue', fontStyle: FontStyle.normal),
    ));

    return new Container(
        color: Colors.grey,
        height: 100.0,
        margin: new EdgeInsets.only(bottom: 5.0),
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: _onTap,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: rowChildren,
            ),
          ),
        ));
  }

  void _onTap() {
    if (onTapCallback != null) {
      onTapCallback(this);
    }
  }
}

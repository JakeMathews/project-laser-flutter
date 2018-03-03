import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  String name;
  Image image;
  Function onTapCallback;

  ImageCard(String this.name, {Image this.image, Function this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.blueGrey,
        height: 100.0,
        margin: new EdgeInsets.only(bottom: 5.0),
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: _onTap,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                this.image,
                new Text(
                  this.name,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontFamily: 'Comic Neue',
                      fontStyle: FontStyle.normal),
                ),
              ],
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

import 'package:flutter/material.dart';
import 'package:project_lazer/widgets/image_card.dart';

class TargetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new ListView(
        children: <Widget>[
          new ImageCard("Mercury", onTapCallback: _onTargetSelected),
          new ImageCard("Venus", onTapCallback: _onTargetSelected),
          new ImageCard("The Moon", onTapCallback: _onTargetSelected),
          new ImageCard("Mars", onTapCallback: _onTargetSelected),
          new ImageCard("Jupiter", onTapCallback: _onTargetSelected),
          new ImageCard("Saturn", onTapCallback: _onTargetSelected),
          new ImageCard("Uranus", onTapCallback: _onTargetSelected),
          new ImageCard("Neptune", onTapCallback: _onTargetSelected),
        ],
      ),
    );
  }

  void _onTargetSelected(ImageCard imageCard) {
    print(imageCard.name);
  }

}
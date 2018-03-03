import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_lazer/widgets/image_card.dart';
import 'package:project_lazer/config.dart' as Config;

class TargetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> targets = <Widget>[];
    Config.targetBodies.forEach((name, imagePath) {
      Image image = new Image.asset(imagePath);
      targets.add(new ImageCard(name, image: image,));
    });

    return new Material(
      color: Colors.blue,
      child: new ListView(
        children: targets,
      ),
    );
  }

  void _onTargetSelected(ImageCard imageCard) {
    print(imageCard.name);
  }

}
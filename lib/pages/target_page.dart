import 'package:flutter/material.dart';
import 'package:project_lazer/widgets/planet_card.dart';
import 'package:project_lazer/config.dart' as Config;

class TargetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> targets = <Widget>[];
    Config.targetBodies.forEach((name, imagePath) {
      PlanetCard planetCard = new PlanetCard(name);
      try {
        planetCard.image = new Image.asset(imagePath);
      } catch (exception) {}
      targets.add(planetCard);
    });

    return new Material(
      color: Colors.blueGrey,
      child: new ListView(
        children: targets,
      ),
    );
  }

  void _onTargetSelected(PlanetCard imageCard) {
    print(imageCard.name);
  }
}

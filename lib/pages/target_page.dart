import 'package:flutter/material.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/widgets/target_card.dart';
import 'package:project_lazer/config.dart' as Config;

class TargetPage extends StatelessWidget {
  @override
  Widget build(final BuildContext rootContext) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Project Lazer"),
      ),
      body: new ListView(children: createTargetCards()),
    );
  }

  List<Widget> createTargetCards() {
    final List<Widget> targetCards = [];
    Config.completeTargetMap.sites.forEach((final int targetCode, final HorizonsSite targetSite) {
      targetCards.add(new TargetCard(targetSite));
    });

    return targetCards;
  }
}

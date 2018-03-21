import 'package:flutter/material.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/target/target_category.dart';
import 'package:project_lazer/widgets/target_card.dart';
import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/widgets/target_category_drawer.dart';

class TargetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  TargetCategory targetCategory;
  List<Widget> targetCards = [];
  
  void setTargetCategory(final TargetCategory targetCategory) {
    setState(() {
      this.targetCategory = targetCategory;
      targetCards.clear();
      targetCategory.targetSiteMap.sites.forEach((final int targetCode, final HorizonsSite targetSite) {
        targetCards.add(new TargetCard(targetSite));
      });
    });
  }
  
  @override
  void initState() {
    super.initState();
    setTargetCategory(Config.defaultTargetCategory);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Project Lazer - ${targetCategory.title}"),
      ),
      body: new ListView(children: targetCards),
      drawer: new TargetCategoryDrawer(setTargetCategory),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_lazer/config.dart' as Config;
import 'package:project_lazer/horizons/target/target_category.dart';

class TargetCategoryDrawer extends StatelessWidget {
  final Function callBack;

  TargetCategoryDrawer(this.callBack);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: _getCategoryCards(context),
      ),
    );
  }

  List<Widget> _getCategoryCards(final BuildContext buildContext) {
    return new List.from(Config.targetCategories.map((final TargetCategory targetCategory) {
      return new ListTile(
        title: new Text(targetCategory.title),
        onTap: () {
          Navigator.pop(buildContext);
          callBack(targetCategory);
        },
      );
    }));
  }
}

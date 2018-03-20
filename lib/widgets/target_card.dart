import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:project_lazer/horizons/model/blocks/table/table_entry.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/horizons_site.dart';
import 'package:project_lazer/horizons/horizons_request.dart';

class TargetCard extends StatelessWidget {
  final HorizonsRequest horizonsRequest = new HorizonsRequest();
  final HorizonsSite targetSite;

  TargetCard(this.targetSite);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text(targetSite.targetName, textScaleFactor: 1.5),
            onTap: () {
              _onTargetSelected(context);
            },
          )
        ],
      ),
    );
  }

  void _onTargetSelected(final BuildContext context) {
    horizonsRequest.getCurrentHorizonsData(targetSite).then((final TableEntry tableEntry) {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('Azimuth: ${tableEntry.azimuth} | Elevation: ${tableEntry.elevation}'),
            duration: new Duration(seconds: 30),
            action: new SnackBarAction(
              label: "OKAY",
              onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
            ),
          ));

      // TODO: Send data over bluetooth
    });
  }
}

import 'package:project_lazer/horizons/horizons_block_parser.dart';
import 'package:project_lazer/horizons/model/horizons_site.dart';
import 'package:project_lazer/horizons/model/blocks/target_selection/target_selection_block.dart';

class TargetSelectionParser extends HorizonsBlockParser {
  final RegExp targetBodyNameRegex = new RegExp(r'Target body name:\s*(.*)\s*\((.*)\)');
  final RegExp centerBodyNameRegex = new RegExp(r'Center body name:\s*(.*)\s*\((.*)\)');

  @override
  bool parserApplies(String firstLine) {
    return targetBodyNameRegex.hasMatch(firstLine);
  }

  @override
  TargetSelectionBlock parse(String blockText) {
    final TargetSelectionBlock targetSelectionBlock = new TargetSelectionBlock();

    final Match targetBodyMatch = targetBodyNameRegex.firstMatch(blockText);
    final String targetBodyName = targetBodyMatch.group(1).trim();
    final int targetBodyCode = int.parse(targetBodyMatch.group(2));
    targetSelectionBlock.targetBody = new HorizonsSite(targetBodyName, targetBodyCode);

    final Match centerBodyMatch = centerBodyNameRegex.firstMatch(blockText);
    final String centerBodyName = centerBodyMatch.group(1).trim();
    final int centerBodyCode = int.parse(centerBodyMatch.group(2));
    targetSelectionBlock.centerBody = new HorizonsSite(centerBodyName, centerBodyCode);

    return targetSelectionBlock;
  }
}

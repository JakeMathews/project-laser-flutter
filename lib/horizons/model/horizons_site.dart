class HorizonsSite {
  final String targetName;
  final int targetCode;

  HorizonsSite(this.targetName, this.targetCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HorizonsSite &&
          runtimeType == other.runtimeType &&
          targetName == other.targetName &&
          targetCode == other.targetCode;

  @override
  int get hashCode => targetName.hashCode ^ targetCode.hashCode;
}

class HorizonsSite {
  final int targetCode;
  final String targetName;

  HorizonsSite(this.targetCode, this.targetName, );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HorizonsSite &&
          runtimeType == other.runtimeType &&
          targetCode == other.targetCode &&
          targetName == other.targetName;


  @override
  int get hashCode => targetCode.hashCode ^ targetName.hashCode;
}

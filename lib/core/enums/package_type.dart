enum PackageType {
  document('Document'),
  smallBox('Small Box'),
  largeBox('Large Box'),
  fragile('Fragile');

  final String value;
  const PackageType(this.value);

  factory PackageType.fromString(String name) {
    return PackageType.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}

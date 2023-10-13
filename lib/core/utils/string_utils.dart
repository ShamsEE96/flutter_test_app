extension CapExtension on String {
  String get removePrecisionIfZero =>
      this.isEmpty ? '' : this.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");

  String get inCaps =>
      this.isEmpty ? '' : '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.isEmpty ? '' : this.toUpperCase();

  String get capitalizeFirstofEach => [null, ''].contains(this)
      ? ''
      : this.split(" ").map((str) => str.inCaps).join(" ");

  String get textEllipsis => this.isEmpty
      ? ''
      : (this.length <= 15)
          ? this
          : '${this.substring(0, 15)}...';

  String get textEllipsisUsername => this.isEmpty
      ? ''
      : (this.length <= 25)
          ? this
          : '${this.substring(0, 25)}...';

  String get textEllipsisTable => this.isEmpty
      ? ''
      : (this.length <= 10)
          ? this
          : '${this.substring(0, 10)}...';

  bool get isValidEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}

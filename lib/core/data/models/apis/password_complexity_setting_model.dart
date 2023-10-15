class PasswordComplexitySetting {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  PasswordComplexitySetting({
    this.requireDigit,
    this.requireLowercase,
    this.requireNonAlphanumeric,
    this.requireUppercase,
    this.requiredLength,
  });

  PasswordComplexitySetting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requireDigit'] = this.requireDigit;
    data['requireLowercase'] = this.requireLowercase;
    data['requireNonAlphanumeric'] = this.requireNonAlphanumeric;
    data['requireUppercase'] = this.requireUppercase;
    data['requiredLength'] = this.requiredLength;
    return data;
  }
}

class SignupInfoModel {
  String? adminEmailAddress;
  String? adminFirstName;
  String? adminLastName;
  String? adminPassword;
  String? captchaResponse;
  int? editionId;
  String? name;
  String? tenancyName;

  SignupInfoModel({
    this.adminEmailAddress,
    this.adminFirstName,
    this.adminLastName,
    this.adminPassword,
    this.captchaResponse,
    this.editionId,
    this.name,
    this.tenancyName,
  });

  SignupInfoModel.fromJson(Map<String, dynamic> json) {
    adminEmailAddress = json['adminEmailAddress'];
    adminFirstName = json['adminFirstName'];
    adminLastName = json['adminLastName'];
    adminPassword = json['adminPassword'];
    captchaResponse = json['captchaResponse'];
    editionId = json['editionId'];
    name = json['name'];
    tenancyName = json['tenancyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminEmailAddress'] = this.adminEmailAddress;
    data['adminFirstName'] = this.adminFirstName;
    data['adminLastName'] = this.adminLastName;
    data['adminPassword'] = this.adminPassword;
    data['captchaResponse'] = this.captchaResponse;
    data['editionId'] = this.editionId;
    data['name'] = this.name;
    data['tenancyName'] = this.tenancyName;
    return data;
  }
}

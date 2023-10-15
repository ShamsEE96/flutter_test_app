class TokenInfo {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  bool? shouldResetPassword;
  String? passwordResetCode;
  int? userId;
  bool? requiresTwoFactorVerification;
  String? twoFactorAuthProviders;
  String? twoFactorRememberClientToken;
  String? returnUrl;
  String? refreshToken;
  int? refreshTokenExpireInSeconds;

  TokenInfo({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.shouldResetPassword,
    this.passwordResetCode,
    this.userId,
    this.requiresTwoFactorVerification,
    this.twoFactorAuthProviders,
    this.twoFactorRememberClientToken,
    this.returnUrl,
    this.refreshToken,
    this.refreshTokenExpireInSeconds,
  });

  TokenInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    shouldResetPassword = json['shouldResetPassword'];
    passwordResetCode = json['passwordResetCode'];
    userId = json['userId'];
    requiresTwoFactorVerification = json['requiresTwoFactorVerification'];
    twoFactorAuthProviders = json['twoFactorAuthProviders'];
    twoFactorRememberClientToken = json['twoFactorRememberClientToken'];
    returnUrl = json['returnUrl'];
    refreshToken = json['refreshToken'];
    refreshTokenExpireInSeconds = json['refreshTokenExpireInSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['encryptedAccessToken'] = this.encryptedAccessToken;
    data['expireInSeconds'] = this.expireInSeconds;
    data['shouldResetPassword'] = this.shouldResetPassword;
    data['passwordResetCode'] = this.passwordResetCode;
    data['userId'] = this.userId;
    data['requiresTwoFactorVerification'] = this.requiresTwoFactorVerification;
    data['twoFactorAuthProviders'] = this.twoFactorAuthProviders;
    data['twoFactorRememberClientToken'] = this.twoFactorRememberClientToken;
    data['returnUrl'] = this.returnUrl;
    data['refreshToken'] = this.refreshToken;
    data['refreshTokenExpireInSeconds'] = this.refreshTokenExpireInSeconds;
    return data;
  }
}


// class TokenInfo {
//   String? accessToken;
//   String? refreshToken;
//   String? validFrom;
//   String? validTo;
//   String? email;
//   String? userName;

//   TokenInfo(
//       {this.accessToken,
//       this.refreshToken,
//       this.validFrom,
//       this.validTo,
//       this.email,
//       this.userName});

//   TokenInfo.fromJson(Map<String, dynamic> json) {
//     accessToken = json['AccessToken'];
//     refreshToken = json['RefreshToken'];
//     validFrom = json['ValidFrom'];
//     validTo = json['ValidTo'];
//     email = json['Email'];
//     userName = json['UserName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['AccessToken'] = this.accessToken;
//     data['RefreshToken'] = this.refreshToken;
//     data['ValidFrom'] = this.validFrom;
//     data['ValidTo'] = this.validTo;
//     data['Email'] = this.email;
//     data['UserName'] = this.userName;
//     return data;
//   }
// }

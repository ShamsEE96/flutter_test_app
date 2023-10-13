class TokenInfo {
  String? accessToken;
  String? refreshToken;
  int? accessTokenExpiresIn;
  int? refreshTokenExpiresIn;

  TokenInfo({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpiresIn,
    this.refreshTokenExpiresIn,
  });

  TokenInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    accessTokenExpiresIn = json['accessTokenExpiresIn'];
    refreshTokenExpiresIn = json['refreshTokenExpiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['accessTokenExpiresIn'] = this.accessTokenExpiresIn;
    data['refreshTokenExpiresIn'] = this.refreshTokenExpiresIn;
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

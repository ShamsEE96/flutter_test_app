class LoginInformationModel {
  User? user;
  Tenant? tenant;
  Application? application;

  LoginInformationModel({this.user, this.tenant, this.application});

  LoginInformationModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    tenant =
        json['tenant'] != null ? new Tenant.fromJson(json['tenant']) : null;
    application = json['application'] != null
        ? new Application.fromJson(json['application'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tenant != null) {
      data['tenant'] = this.tenant!.toJson();
    }
    if (this.application != null) {
      data['application'] = this.application!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;
  String? profilePictureUrl;
  bool? allowSetPassword;
  int? userType;
  String? userToken;
  String? lastSeen;
  String? title;
  List<String>? roles;
  int? id;

  User(
      {this.name,
      this.surname,
      this.userName,
      this.emailAddress,
      this.profilePictureUrl,
      this.allowSetPassword,
      this.userType,
      this.userToken,
      this.lastSeen,
      this.title,
      this.roles,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    profilePictureUrl = json['profilePictureUrl'];
    allowSetPassword = json['allowSetPassword'];
    userType = json['userType'];
    userToken = json['userToken'];
    lastSeen = json['lastSeen'];
    title = json['title'];
    roles = json['roles'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['userName'] = this.userName;
    data['emailAddress'] = this.emailAddress;
    data['profilePictureUrl'] = this.profilePictureUrl;
    data['allowSetPassword'] = this.allowSetPassword;
    data['userType'] = this.userType;
    data['userToken'] = this.userToken;
    data['lastSeen'] = this.lastSeen;
    data['title'] = this.title;
    data['roles'] = this.roles;
    data['id'] = this.id;
    return data;
  }
}

class Tenant {
  String? tenancyName;
  String? name;
  int? ownerId;
  String? logoUrl;
  String? watermarkUrl;
  String? creationTime;
  Edition? edition;
  bool? isInReadOnlyMode;
  bool? isSubscribed;
  String? paymentPeriodType;
  String? subscriptionEndDateUtc;
  String? subscriptionCancelDateUtc;
  bool? isSubscriptionCanceled;
  String? subscriptionCustomName;
  String? trialPeriodStartDateUtc;
  String? trialPeriodEndDateUtc;
  bool? allowExtendTrial;
  bool? isInTrialPeriod;
  bool? isUsingTrial;
  String? trialPeriodDaysDuration;
  bool? hasCoupon;
  bool? isInLastPaidEdition;
  int? waitingDayAfterExpire;
  bool? disableTenantAfterExpire;
  String? moveToEditionAfterExpire;
  bool? setInReadOnlyModeAfterExpire;
  String? templateCategoryId;
  String? siloId;
  String? apiUrl;
  String? dnsUrl;
  String? customerId;
  int? id;

  Tenant(
      {this.tenancyName,
      this.name,
      this.ownerId,
      this.logoUrl,
      this.watermarkUrl,
      this.creationTime,
      this.edition,
      this.isInReadOnlyMode,
      this.isSubscribed,
      this.paymentPeriodType,
      this.subscriptionEndDateUtc,
      this.subscriptionCancelDateUtc,
      this.isSubscriptionCanceled,
      this.subscriptionCustomName,
      this.trialPeriodStartDateUtc,
      this.trialPeriodEndDateUtc,
      this.allowExtendTrial,
      this.isInTrialPeriod,
      this.isUsingTrial,
      this.trialPeriodDaysDuration,
      this.hasCoupon,
      this.isInLastPaidEdition,
      this.waitingDayAfterExpire,
      this.disableTenantAfterExpire,
      this.moveToEditionAfterExpire,
      this.setInReadOnlyModeAfterExpire,
      this.templateCategoryId,
      this.siloId,
      this.apiUrl,
      this.dnsUrl,
      this.customerId,
      this.id});

  Tenant.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
    name = json['name'];
    ownerId = json['ownerId'];
    logoUrl = json['logoUrl'];
    watermarkUrl = json['watermarkUrl'];
    creationTime = json['creationTime'];
    edition =
        json['edition'] != null ? new Edition.fromJson(json['edition']) : null;
    isInReadOnlyMode = json['isInReadOnlyMode'];
    isSubscribed = json['isSubscribed'];
    paymentPeriodType = json['paymentPeriodType'];
    subscriptionEndDateUtc = json['subscriptionEndDateUtc'];
    subscriptionCancelDateUtc = json['subscriptionCancelDateUtc'];
    isSubscriptionCanceled = json['isSubscriptionCanceled'];
    subscriptionCustomName = json['subscriptionCustomName'];
    trialPeriodStartDateUtc = json['trialPeriodStartDateUtc'];
    trialPeriodEndDateUtc = json['trialPeriodEndDateUtc'];
    allowExtendTrial = json['allowExtendTrial'];
    isInTrialPeriod = json['isInTrialPeriod'];
    isUsingTrial = json['isUsingTrial'];
    trialPeriodDaysDuration = json['trialPeriodDaysDuration'];
    hasCoupon = json['hasCoupon'];
    isInLastPaidEdition = json['isInLastPaidEdition'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'];
    disableTenantAfterExpire = json['disableTenantAfterExpire'];
    moveToEditionAfterExpire = json['moveToEditionAfterExpire'];
    setInReadOnlyModeAfterExpire = json['setInReadOnlyModeAfterExpire'];
    templateCategoryId = json['templateCategoryId'];
    siloId = json['siloId'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
    customerId = json['customerId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenancyName'] = this.tenancyName;
    data['name'] = this.name;
    data['ownerId'] = this.ownerId;
    data['logoUrl'] = this.logoUrl;
    data['watermarkUrl'] = this.watermarkUrl;
    data['creationTime'] = this.creationTime;
    if (this.edition != null) {
      data['edition'] = this.edition!.toJson();
    }
    data['isInReadOnlyMode'] = this.isInReadOnlyMode;
    data['isSubscribed'] = this.isSubscribed;
    data['paymentPeriodType'] = this.paymentPeriodType;
    data['subscriptionEndDateUtc'] = this.subscriptionEndDateUtc;
    data['subscriptionCancelDateUtc'] = this.subscriptionCancelDateUtc;
    data['isSubscriptionCanceled'] = this.isSubscriptionCanceled;
    data['subscriptionCustomName'] = this.subscriptionCustomName;
    data['trialPeriodStartDateUtc'] = this.trialPeriodStartDateUtc;
    data['trialPeriodEndDateUtc'] = this.trialPeriodEndDateUtc;
    data['allowExtendTrial'] = this.allowExtendTrial;
    data['isInTrialPeriod'] = this.isInTrialPeriod;
    data['isUsingTrial'] = this.isUsingTrial;
    data['trialPeriodDaysDuration'] = this.trialPeriodDaysDuration;
    data['hasCoupon'] = this.hasCoupon;
    data['isInLastPaidEdition'] = this.isInLastPaidEdition;
    data['waitingDayAfterExpire'] = this.waitingDayAfterExpire;
    data['disableTenantAfterExpire'] = this.disableTenantAfterExpire;
    data['moveToEditionAfterExpire'] = this.moveToEditionAfterExpire;
    data['setInReadOnlyModeAfterExpire'] = this.setInReadOnlyModeAfterExpire;
    data['templateCategoryId'] = this.templateCategoryId;
    data['siloId'] = this.siloId;
    data['apiUrl'] = this.apiUrl;
    data['dnsUrl'] = this.dnsUrl;
    data['customerId'] = this.customerId;
    data['id'] = this.id;
    return data;
  }
}

class Edition {
  String? name;
  String? displayName;
  int? type;
  int? id;

  Edition({this.name, this.displayName, this.type, this.id});

  Edition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}

class Application {
  String? version;
  String? releaseDate;
  String? currency;
  String? currencySign;
  bool? userDelegationIsEnabled;
  String? features;
  String? compatibleMobileClientVersion;
  String? compatibleWebClientVersion;

  Application(
      {this.version,
      this.releaseDate,
      this.currency,
      this.currencySign,
      this.userDelegationIsEnabled,
      this.features,
      this.compatibleMobileClientVersion,
      this.compatibleWebClientVersion});

  Application.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    currency = json['currency'];
    currencySign = json['currencySign'];
    userDelegationIsEnabled = json['userDelegationIsEnabled'];
    // features = json['features'];
    compatibleMobileClientVersion = json['compatibleMobileClientVersion'];
    compatibleWebClientVersion = json['compatibleWebClientVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['releaseDate'] = this.releaseDate;
    data['currency'] = this.currency;
    data['currencySign'] = this.currencySign;
    data['userDelegationIsEnabled'] = this.userDelegationIsEnabled;
    // data['features'] = this.features;
    data['compatibleMobileClientVersion'] = this.compatibleMobileClientVersion;
    data['compatibleWebClientVersion'] = this.compatibleWebClientVersion;
    return data;
  }
}

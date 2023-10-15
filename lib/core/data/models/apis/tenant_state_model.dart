class TenantStateModel {
  int? state;
  int? tenantId;
  String? serverRootAddress;
  String? apiUrl;
  String? dnsUrl;

  TenantStateModel({
    this.state,
    this.tenantId,
    this.serverRootAddress,
    this.apiUrl,
    this.dnsUrl,
  });

  TenantStateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    tenantId = json['tenantId'];
    serverRootAddress = json['serverRootAddress'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['tenantId'] = this.tenantId;
    data['serverRootAddress'] = this.serverRootAddress;
    data['apiUrl'] = this.apiUrl;
    data['dnsUrl'] = this.dnsUrl;
    return data;
  }
}

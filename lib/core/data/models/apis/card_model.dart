class CardModel {
  int? id;
  String? qrCode;
  bool? isActive;

  CardModel({
    this.id,
    this.qrCode,
    this.isActive,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCode = json['qrCode'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qrCode'] = this.qrCode;
    data['isActive'] = this.isActive;
    return data;
  }
}

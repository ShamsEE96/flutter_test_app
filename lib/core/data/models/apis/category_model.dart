class CategoryModel {
  int? id;
  int? parentId;
  bool? isParent;
  String? name;
  String? description;
  String? iconUrl;

  CategoryModel({
    this.id,
    this.parentId,
    this.isParent,
    this.name,
    this.description,
    this.iconUrl,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    isParent = json['isParent'];
    name = json['name'];
    description = json['description'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['isParent'] = this.isParent;
    data['name'] = this.name;
    data['description'] = this.description;
    data['iconUrl'] = this.iconUrl;
    return data;
  }
}

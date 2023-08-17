class OrderProductModel {
  String? code;
  String? createdBy;
  int? deleted;
  String? description;
  String? id;
  List<ListImage>? listImage;
  String? locationId;
  String? modifiedBy;
  String? name;
  String? orgId;
  int? price;
  String? productType;
  String? productTypeName;
  int? quantity;
  String? subDescription;

  OrderProductModel(
      {this.code,
        this.createdBy,
        this.deleted,
        this.description,
        this.id,
        this.listImage,
        this.locationId,
        this.modifiedBy,
        this.name,
        this.orgId,
        this.price,
        this.productType,
        this.productTypeName,
        this.quantity,
        this.subDescription});

  OrderProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    createdBy = json['createdBy'];
    deleted = json['deleted'];
    description = json['description'];
    id = json['id'];
    if (json['listImage'] != null) {
      listImage = <ListImage>[];
      json['listImage'].forEach((v) {
        listImage!.add(new ListImage.fromJson(v));
      });
    }
    locationId = json['locationId'];
    modifiedBy = json['modifiedBy'];
    name = json['name'];
    orgId = json['orgId'];
    price = json['price'];
    productType = json['productType'];
    productTypeName = json['productTypeName'];
    quantity = json['quantity'];
    subDescription = json['subDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['createdBy'] = this.createdBy;
    data['deleted'] = this.deleted;
    data['description'] = this.description;
    data['id'] = this.id;
    if (this.listImage != null) {
      data['listImage'] = this.listImage!.map((v) => v.toJson()).toList();
    }
    data['locationId'] = this.locationId;
    data['modifiedBy'] = this.modifiedBy;
    data['name'] = this.name;
    data['orgId'] = this.orgId;
    data['price'] = this.price;
    data['productType'] = this.productType;
    data['productTypeName'] = this.productTypeName;
    data['quantity'] = this.quantity;
    data['subDescription'] = this.subDescription;
    return data;
  }
}

class ListImage {
  String? createdBy;
  int? deleted;
  String? id;
  int? imageType;
  String? modifiedBy;
  String? orgId;
  String? subjectId;
  String? viewUrl;

  ListImage(
      {
        this.createdBy,
        this.deleted,
        this.id,
        this.imageType,
        this.modifiedBy,
        this.orgId,
        this.subjectId,
        this.viewUrl});

  ListImage.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    deleted = json['deleted'];
    id = json['id'];
    imageType = json['imageType'];
    modifiedBy = json['modifiedBy'];
    orgId = json['orgId'];
    subjectId = json['subjectId'];
    viewUrl = json['viewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['deleted'] = this.deleted;
    data['id'] = this.id;
    data['imageType'] = this.imageType;
    data['modifiedBy'] = this.modifiedBy;
    data['orgId'] = this.orgId;
    data['subjectId'] = this.subjectId;
    data['viewUrl'] = this.viewUrl;
    return data;
  }
}

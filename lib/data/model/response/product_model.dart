class ProductModel {
  String? id;
  int? deleted;
  String? orgId;
  List<int>? createDate;
  String? createdBy;
  String? modifiedBy;
  List<int>? modifyDate;
  String? name;
  String? code;
  String? description;
  String? subDescription;
  String? productType;
  String? productTypeName;
  String? locationId;
  int? price;
  int? quantity;
  List<ListImage>? listImage;

  ProductModel(
      {this.id,
        this.deleted,
        this.orgId,
        this.createDate,
        this.createdBy,
        this.modifiedBy,
        this.modifyDate,
        this.name,
        this.code,
        this.description,
        this.subDescription,
        this.productType,
        this.productTypeName,
        this.locationId,
        this.price,
        this.quantity,
        this.listImage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deleted = json['deleted'];
    orgId = json['orgId'];
    createDate = json['createDate'].cast<int>();
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    modifyDate = json['modifyDate'].cast<int>();
    name = json['name'];
    code = json['code'];
    description = json['description'];
    subDescription = json['subDescription'];
    productType = json['productType'];
    productTypeName = json['productTypeName'];
    locationId = json['locationId'];
    price = json['price'];
    quantity = json['quantity'];
    if (json['listImage'] != null) {
      listImage = <ListImage>[];
      json['listImage'].forEach((v) {
        listImage!.add(new ListImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deleted'] = this.deleted;
    data['orgId'] = this.orgId;
    data['createDate'] = this.createDate;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['modifyDate'] = this.modifyDate;
    data['name'] = this.name;
    data['code'] = this.code;
    data['description'] = this.description;
    data['subDescription'] = this.subDescription;
    data['productType'] = this.productType;
    data['productTypeName'] = this.productTypeName;
    data['locationId'] = this.locationId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    if (this.listImage != null) {
      data['listImage'] = this.listImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListImage {
  String? createDate;
  String? createdBy;
  int? deleted;
  String? id;
  int? imageType;
  String? modifiedBy;
  String? modifyDate;
  String? orgId;
  String? subjectId;
  String? viewUrl;

  ListImage(
      {this.createDate,
        this.createdBy,
        this.deleted,
        this.id,
        this.imageType,
        this.modifiedBy,
        this.modifyDate,
        this.orgId,
        this.subjectId,
        this.viewUrl});

  ListImage.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    createdBy = json['createdBy'];
    deleted = json['deleted'];
    id = json['id'];
    imageType = json['imageType'];
    modifiedBy = json['modifiedBy'];
    modifyDate = json['modifyDate'];
    orgId = json['orgId'];
    subjectId = json['subjectId'];
    viewUrl = json['viewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['createdBy'] = this.createdBy;
    data['deleted'] = this.deleted;
    data['id'] = this.id;
    data['imageType'] = this.imageType;
    data['modifiedBy'] = this.modifiedBy;
    data['modifyDate'] = this.modifyDate;
    data['orgId'] = this.orgId;
    data['subjectId'] = this.subjectId;
    data['viewUrl'] = this.viewUrl;
    return data;
  }
}

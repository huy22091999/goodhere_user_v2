class OrderModel {
  String? id;
  int? deleted;
  String? orgId;
  String? createdBy;
  String? modifiedBy;
  int? type;
  String? status;
  int? quantity;
  int? price;
  String? paymentCode;
  String? paymentName;
  String? code;

  OrderModel(
      {this.id,
        this.deleted,
        this.orgId,
        this.createdBy,
        this.modifiedBy,
        this.type,
        this.status,
        this.quantity,
        this.price,
        this.paymentCode,
        this.paymentName,
        this.code});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deleted = json['deleted'];
    orgId = json['orgId'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    type = json['type'];
    status = json['status'];
    quantity = json['quantity'];
    price = json['price'];
    paymentCode = json['paymentCode'];
    paymentName = json['paymentName'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deleted'] = this.deleted;
    data['orgId'] = this.orgId;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['type'] = this.type;
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['paymentCode'] = this.paymentCode;
    data['paymentName'] = this.paymentName;
    data['code'] = this.code;
    return data;
  }
}

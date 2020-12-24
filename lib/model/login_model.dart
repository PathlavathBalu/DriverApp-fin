class LoginModel {
  int customerDetail;

  LoginModel({this.customerDetail});

  LoginModel.fromJson(Map<String, dynamic> json) {
    customerDetail = json['customer_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_detail'] = this.customerDetail;
    return data;
  }
}

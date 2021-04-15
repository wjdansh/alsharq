class changePass {
  Null error;
  bool valid;
  String token;

  changePass({this.error, this.valid, this.token});

  changePass.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    valid = json['valid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['valid'] = this.valid;
    data['token'] = this.token;
    return data;
  }
}

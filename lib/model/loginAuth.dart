import 'dart:convert';

LoginAuth loginAuthFromJson(String str) => LoginAuth.fromJson(json.decode(str));

String loginAuthToJson(LoginAuth data) => json.encode(data.toJson());

class LoginAuth {
    LoginAuth({
        this.msg,
    });

    String msg;

    factory LoginAuth.fromJson(Map<String, dynamic> json) => LoginAuth(
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg == null ? null : msg,
    };
}

import 'dart:convert';

DriverList driverListFromJson(String str) => DriverList.fromJson(json.decode(str));

String driverListToJson(DriverList data) => json.encode(data.toJson());

class DriverList {
    DriverList({
        this.staffList,
    });

    List<StaffList> staffList;

    factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
        staffList: json["staff_list"] == null ? null : List<StaffList>.from(json["staff_list"].map((x) => StaffList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "staff_list": staffList == null ? null : List<dynamic>.from(staffList.map((x) => x.toJson())),
    };
}

class StaffList {
    StaffList({
        this.staffId,
        this.staffName,
        this.staffImage,
    });

    String staffId;
    String staffName;
    dynamic staffImage;

    factory StaffList.fromJson(Map<String, dynamic> json) => StaffList(
        staffId: json["staff_id"] == null ? null : json["staff_id"],
        staffName: json["staff_name"] == null ? null : json["staff_name"],
        staffImage: json["staff_image"],
    );

    Map<String, dynamic> toJson() => {
        "staff_id": staffId == null ? null : staffId,
        "staff_name": staffName == null ? null : staffName,
        "staff_image": staffImage,
    };
}

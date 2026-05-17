class DeviceModel {

  final int id;
  final String name;
  final String code;
  final String battery;
  final String location;
  final bool isActive;

  DeviceModel({
    required this.id,
    required this.name,
    required this.code,
    required this.battery,
    required this.location,
    required this.isActive,
  });

  factory DeviceModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return DeviceModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      battery: json['battery'],
      location: json['location'],
      isActive: json['is_active'],
    );
  }
}
 class Doctorss {
  String name;
  String special;
  String phone;
  String address;
  String city;

  Doctorss({
    required this.name,
    required this.special,
    required this.phone,
    required this.address,
    required this.city,
  });

  factory Doctorss.fromJson(Map<String, dynamic> json) => Doctorss(
    name: json["name"],
    special: json["special"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "special": special,
    "phone": phone,
    "address": address,
    "city": city,
  };
}
 class Doctorss {
  String name;
  String special;
  String phone;
  String address;
  String city;
  String gender;

  Doctorss({
    required this.name,
    required this.special,
    required this.phone,
    required this.address,
    required this.city,
    required this.gender,
  });

  factory Doctorss.fromJson(Map<String, dynamic> json) => Doctorss(
    name: json["name"],
    special: json["special"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    gender: json["gender"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "special": special,
    "phone": phone,
    "address": address,
    "city": city,
    "gender": gender,
  };
}
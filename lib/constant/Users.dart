
import 'package:hive/hive.dart';
part 'Users.g.dart'; // ضروري جدًا

@HiveType(typeId: 0)
class User extends HiveObject{

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @HiveField(2)
  String name;

  @HiveField(3)
  String address;

  @HiveField(4)
  String mail;

  @HiveField(5)
  String phone;

  @HiveField(6)
  String whatsapp;

  @HiveField(7)
  String type;

  @HiveField(8)
  String gender;

  User({
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.mail,
    required this.phone,
    required this.whatsapp,
    required this.type,
    required this.gender,
  });

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'name': name,
      'address': address,
      'mail': mail,
      'phone': phone,
      'whatsapp': whatsapp,
      'type': type,
      'gender':gender,
    };
  }

  // إنشاء الكائن من JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      name: json['name'],
      address: json['address'],
      mail: json['mail'],
      phone: json['phone'],
      whatsapp: json['whatsapp'],
      type: json['type'],
        gender:json['gender']
    );
  }

  String toString() {
    return 'User(username: $username, password: $password, name: $name, address: $address, mail: $mail, phone: $phone, whatsapp: $whatsapp, type: $type)';
  }

}
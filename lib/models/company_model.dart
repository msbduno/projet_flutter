import 'address_model.dart';

class Company {


  final String name;
  final Address address;

  const Company( this.name, this.address);


  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        json['name'],
        Address.fromJson(json['address'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
    };
  }
}

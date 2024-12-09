class Address {
  final String street;
  final String city;
  final String postCode;

  const Address(this.street, this.city, this.postCode);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final String street = properties['name'];
    final String city = properties['city'];
    final String postcode = properties['postcode'];

    return Address(street, postcode, city);
  }

  @override
  String toString() {
    return '$street, $city, $postCode';
  }
}
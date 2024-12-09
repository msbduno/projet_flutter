import 'package:latlong2/latlong.dart';

class Address {
  final String street;
  final String city;
  final String postCode;
  final LatLng coordinates;

  const Address(this.street, this.city, this.postCode, this.coordinates);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final coordinates = json['geometry']['coordinates'];
    final Map<String, dynamic> properties = json['properties'] ?? {};

    return Address(
      properties['name'] ?? '',
      properties['city'] ?? '',
      properties['postcode'] ?? '',
      LatLng(coordinates[1], coordinates[0]), // Note: switched order to lat, lon
    );
  }

  @override
  String toString() {
    return '$street, $city, $postCode, (${coordinates.latitude}, ${coordinates.longitude})';
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postcode': postCode,
      'lat': coordinates.latitude,
      'lon': coordinates.longitude,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['street'] ?? '',
      json['city'] ?? '',
      json['postcode'] ?? '',
      LatLng(json['lat'] ?? 0.0, json['lon'] ?? 0.0),
    );
  }
}
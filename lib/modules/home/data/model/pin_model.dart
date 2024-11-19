import 'dart:convert';

import 'package:flutter/foundation.dart';

class PinModel {
  final String? postcode;
  final String? country;
  final String? countryabbreviation;
  final List<Place>? places;
  PinModel({
    this.postcode,
    this.country,
    this.countryabbreviation,
    this.places,
  });

  PinModel copyWith({
    String? postcode,
    String? country,
    String? countryabbreviation,
    List<Place>? places,
  }) {
    return PinModel(
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      countryabbreviation: countryabbreviation ?? this.countryabbreviation,
      places: places ?? this.places,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postcode': postcode,
      'country': country,
      'countryabbreviation': countryabbreviation,
      'places': places?.map((x) => x.toMap()).toList(),
    };
  }

  factory PinModel.fromMap(Map<String, dynamic> map) {
    return PinModel(
      postcode: map['post code'] as String,
      country: map['country'] as String,
      countryabbreviation: map['country abbreviation'] as String,
      places: List<Place>.from(
        (map['places'] as List).map<Place>(
          (x) => Place.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PinModel.fromJson(String source) =>
      PinModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PinModel(postcode: $postcode, country: $country, countryabbreviation: $countryabbreviation, places: $places)';
  }

  @override
  bool operator ==(covariant PinModel other) {
    if (identical(this, other)) return true;

    return other.postcode == postcode &&
        other.country == country &&
        other.countryabbreviation == countryabbreviation &&
        listEquals(other.places, places);
  }

  @override
  int get hashCode {
    return postcode.hashCode ^
        country.hashCode ^
        countryabbreviation.hashCode ^
        places.hashCode;
  }
}

class Place {
  final String placename;
  final String longitude;
  final String state;
  final String stateabbreviation;
  final String latitude;
  Place({
    required this.placename,
    required this.longitude,
    required this.state,
    required this.stateabbreviation,
    required this.latitude,
  });

  Place copyWith({
    String? placename,
    String? longitude,
    String? state,
    String? stateabbreviation,
    String? latitude,
  }) {
    return Place(
      placename: placename ?? this.placename,
      longitude: longitude ?? this.longitude,
      state: state ?? this.state,
      stateabbreviation: stateabbreviation ?? this.stateabbreviation,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'placename': placename,
      'longitude': longitude,
      'state': state,
      'stateabbreviation': stateabbreviation,
      'latitude': latitude,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      placename: map['place name'] as String,
      longitude: map['longitude'] as String,
      state: map['state'] as String,
      stateabbreviation: map['state abbreviation'] as String,
      latitude: map['latitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Place(placename: $placename, longitude: $longitude, state: $state, stateabbreviation: $stateabbreviation, latitude: $latitude)';
  }

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.placename == placename &&
        other.longitude == longitude &&
        other.state == state &&
        other.stateabbreviation == stateabbreviation &&
        other.latitude == latitude;
  }

  @override
  int get hashCode {
    return placename.hashCode ^
        longitude.hashCode ^
        state.hashCode ^
        stateabbreviation.hashCode ^
        latitude.hashCode;
  }
}

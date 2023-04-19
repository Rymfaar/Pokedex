import 'package:pokedex/network/network_utils.dart';

class TypeResponse {
  TypeResponse({
    required this.name,
    required this.image,
  });

  factory TypeResponse.fromJson(Json json) {
    return TypeResponse(
      name: json['name'],
      image: json['image']
    );
  }

  String name;
  String image;
}

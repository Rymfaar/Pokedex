import 'package:pokedex/network/network_utils.dart';

class StatsResponse {
  StatsResponse({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory StatsResponse.fromJson(Json json) {
    return StatsResponse(
      hp: json['hp'],
      attack: json['attack'],
      defense: json['defense'],
      specialAttack: json['specialAttack'],
      specialDefense: json['specialDefense'],
      speed: json['speed'],
    );
  }

  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
}

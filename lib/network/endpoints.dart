import 'dart:ffi';

const String apiPath = "https://pokebuildapi.fr";
const String apiVersion = "api/v1";
const String apiRoot = "$apiPath/$apiVersion";

abstract class Endpoint {
  static const String getAllPokemons = "$apiRoot/api/v1/pokemon";
}

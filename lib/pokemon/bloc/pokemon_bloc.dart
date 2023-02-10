import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

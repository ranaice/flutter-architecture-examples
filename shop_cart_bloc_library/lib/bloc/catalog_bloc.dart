import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  @override
  CatalogState get initialState => CatalogInitial();

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {}
}

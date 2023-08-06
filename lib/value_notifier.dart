import 'package:flutter/material.dart';

import 'state_pattern.dart';

class NameController extends ValueNotifier<MyPageStatePattern> {
  NameController() : super(LoadingPageState());

  Future<void> init() async {
    await fetchNames();
  }

  Future<void> fetchNames() async {
    try {
      //Aqui coloco 5 segundos para o estado mudar;
      await Future.delayed(const Duration(seconds: 5));
      //Sem este retarno não é possível ver a mudança;
      //Você não precisa usar este retardo...;

      value = SuccessPageState(
        names: [
          'nome 01',
          'nome 02',
          'nome 03',
          'nome 04',
          'nome 05',
          'nome 06',
          'nome 07',
          'nome 08',
          'nome 09',
          'nome 10',
        ],
      );
    } catch (e) {
      value = ErrorPageState(
        message: e.toString(),
      );
    }
  }

  Future<void> errorState() async {
    if (value is SuccessPageState) {
      value = ErrorPageState(message: 'My Error');
    } else {
      value = LoadingPageState();
      //Aqui coloco 2 segundos para o estado mudar;
      await Future.delayed(const Duration(seconds: 2));
      //Sem este retarno não é possível ver a mudança;
      //Você não precisa usar este retardo...;
      fetchNames();
    }
  }
}

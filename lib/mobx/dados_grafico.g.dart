// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_grafico.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Grafico on _Mob_GraficoBase, Store {
  final _$mesesAtom = Atom(name: '_Mob_GraficoBase.meses');

  @override
  ObservableList<String> get meses {
    _$mesesAtom.reportRead();
    return super.meses;
  }

  @override
  set meses(ObservableList<String> value) {
    _$mesesAtom.reportWrite(value, super.meses, () {
      super.meses = value;
    });
  }

  final _$dados1Atom = Atom(name: '_Mob_GraficoBase.dados1');

  @override
  ObservableList<double> get dados1 {
    _$dados1Atom.reportRead();
    return super.dados1;
  }

  @override
  set dados1(ObservableList<double> value) {
    _$dados1Atom.reportWrite(value, super.dados1, () {
      super.dados1 = value;
    });
  }

  final _$_Mob_GraficoBaseActionController =
      ActionController(name: '_Mob_GraficoBase');

  @override
  void calc_meses() {
    final _$actionInfo = _$_Mob_GraficoBaseActionController.startAction(
        name: '_Mob_GraficoBase.calc_meses');
    try {
      return super.calc_meses();
    } finally {
      _$_Mob_GraficoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
meses: ${meses},
dados1: ${dados1}
    ''';
  }
}

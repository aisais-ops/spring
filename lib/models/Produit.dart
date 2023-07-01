import 'dart:ui';

import 'package:spring/models/Commande.dart';

class Produit {
  late String _code;
  String get code => _code;
  set code(String value) => _code = value;

  late String _label;
  String get label => _label;
  set label(String value) => _label = value;

  late String _description;
  String get description => _description;
  set description(String value) => _description = value;

  late DateTime _date_ajout;
  DateTime get date_ajout => _date_ajout;
  set date_ajout(DateTime value) => _date_ajout = value;

  late double _pu;
  double get pu => _pu;
  set pu(double value) => _pu = value;

  late int _quantite_stock;
  int get quantite_stock => _quantite_stock;
  set quantite_stock(int value) => _quantite_stock = value;

  late List<String> _images;
  List<String> get images => _images;
  set images(List<String> value) => _images = value;

  Produit({
    code,
    label,
    date_ajout,
    pu,
    quantite_stock,
    images,
    description
  }) {
    _code = code??"";
    _label = label??"";
    _date_ajout = date_ajout??new DateTime.now();
    _pu = pu??0.0;
    _quantite_stock = quantite_stock??0;
    _images = images??[];
    _description = description??"";
  }

  @override
  String toString() =>
      'Produit n° $code: $label - $pu, ajouté le $date_ajout images $images';

  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Commande &&
          runtimeType == other.runtimeType &&
          code == other.code;
}

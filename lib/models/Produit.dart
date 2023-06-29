import 'dart:ui';

import 'package:spring/models/Commande.dart';

class Produit{
  //attributes
  late String _code;
  String get code => _code;
  late String _label;
  String get label => _label;
  set label(String value) {_label = value;}
  DateTime _date_ajout=DateTime.now();
  DateTime get date_ajout => _date_ajout;
  set date_ajout(value){this._date_ajout=date_ajout;}
  double _pu=0;
  double get pu => _pu;
  set pu(double value) {_pu = value;}
  int _quantite_stock=1;
  int get quantite_stock => _quantite_stock;
  set quantite_stock(int value) { _quantite_stock = value;}
  List<Image>_images=[];
  List<Image> get images => _images;
  set images(List<Image> value) {_images = value;} //constructors
  Produit(code,label,date_ajout,pu,qt_stock,images){
    this._code=code??'';
    this._label=label??'';
    this._date_ajout=_date_ajout;
    this._pu=pu;
    this._quantite_stock=qt_stock;
    this._images=images;
  }
  //toString
  @override
  String toString()=>'Produit n° $code: $label - $pu, ajouté le $date_ajout';
  //equals
  bool operator==(Object other)=>identical(this, other)||
      other is Commande &&
          runtimeType==other.runtimeType && code==other.code;
}
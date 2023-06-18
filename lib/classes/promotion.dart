import 'dart:ffi';

class Promotion{
  String _code;
  Double _discount;
  Double _date_expiration;
  Int _code_produit;

  /** constructeur*/
  Promotion(this._code, this._discount, this._date_expiration, this._code_produit);

  /** getters & setters*/
  String get code => _code;
  set code(String value) {_code = value;}

  Double get discount => _discount;
  set discount(Double value) {_discount = value;}

  Int get code_produit => _code_produit;
  set code_produit(Int value) {_code_produit = value;}

  Double get date_expiration => _date_expiration;
  set date_expiration(Double value) {_date_expiration = value;}

  /** to string*/
  @override
  String toString() {
    return 'code: $_code, discount: $_discount, date_expiration: $_date_expiration, code_produit: $_code_produit}';
  }

  /** equals*/
  @override
  bool operator ==(Object other) => identical(this, other) || other is Promotion && runtimeType == other.runtimeType && _code == other._code;








}
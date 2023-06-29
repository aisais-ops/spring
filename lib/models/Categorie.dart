class Categorie{
  late String _code;
  String get code=>_code;
  late String _label;
  String get label=>_label;
  set label(value){this._label=value;}
  late String _code_promo;
  String get code_promo => _code_promo;
  set code_promo(String value) {_code_promo = value;}
  //constructor
  Categorie(code, label, code_promo){
    this._code=code??'';
    this._label=label??'';
    this._code_promo=code_promo;
  }

  @override
  String toString() {
    return 'Categorie n°: $_code, _label: $_label, _code_promo: $_code_promo}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Categorie &&
          runtimeType == other.runtimeType &&
          _code == other._code;

  @override
  int get hashCode => _code.hashCode;
}
class LigneCommande {
  //attributes
  late String _code_produit;

  String get code_produit => _code_produit;
  late String _label_produit;

  String get label_produit => _label_produit;
  double _pu_produit = 0;

  double get pu_produit => _pu_produit;
  int _qt_produit = 0;

  int get qt_produit => _qt_produit;
  double _total = 0;

  double get total => _total;

  //Constructeur
  LigneCommande(code_produit, label_produit, pu_produit, qt_produit, total) {
    this._code_produit = code_produit ?? '';
    this._label_produit = label_produit ?? '';
    this._pu_produit = _pu_produit;
    this._qt_produit = qt_produit;
    this._total = total;
  }

  //toString
  @override
  String toString() {
    return 'Ligne: $_code_produit, Label: $_label_produit, prix unitaire: $_pu_produit, quantité: $_qt_produit, _total: $_total}';
  }
  //equals
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LigneCommande &&
          runtimeType == other.runtimeType &&
          _code_produit == other._code_produit;

  @override
  int get hashCode => _code_produit.hashCode;
}
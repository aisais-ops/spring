class Facture {
  //Attributes
  late String _code;
  String get code => _code;
  DateTime _date_generation = DateTime.now();
  DateTime get date_generation => _date_generation;
  late String _matricule_vendeur;
  String get matricule_vendeur => _matricule_vendeur;
  late String _nom_store;
  String get nom_store => _nom_store;
  double _total = 0;
  double get total => _total;
  //Constructors
  Facture({code,date_generation,nom_store,matricule_vendeur,total}){
   this._code=code??'';this._date_generation=_date_generation;this._nom_store=_nom_store??'';this._matricule_vendeur=matricule_vendeur??'';this._total=total;
  }
  //toString()
  String toString() => "Facture n° $code générée le $date_generation pour $nom_store";
  //equals
  bool operator==(Object other) => identical(this, other) || other is Facture && runtimeType == other.runtimeType && code == other.code;
}
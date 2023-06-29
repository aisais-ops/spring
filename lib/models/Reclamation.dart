enum TypeReclamation{AnnulationCommande,ChangementAdresse,DemandeRetour,Remboursement,Facturation,Autre}
enum EtatReclamation{Traitee,NonTraitee}
class Reclamation{
  //attributes
  late String _code;
  String get code => _code;
  late String _username;
  String get username => _username;
  DateTime _date=DateTime.now();
  DateTime get date=>_date;
  late TypeReclamation _type_reclamation;
  TypeReclamation get type_reclamation => _type_reclamation;
  late String _message;
  String get message => _message;
  late EtatReclamation _etat_reclamation;
  EtatReclamation get etat_reclamation => _etat_reclamation;
  set etat_reclamation(EtatReclamation value) {
    _etat_reclamation = value;
  }
  //constructors
  Reclamation({code,username,date,type_reclamation,etat_reclamation}){
    this._code=code??'';this._username=username??'';this._date=date??DateTime.now();this._type_reclamation=type_reclamation??TypeReclamation.Autre;this._etat_reclamation=etat_reclamation??EtatReclamation.NonTraitee;
  }
  //toString
  String toString()=>'Réclamation n° $code, de $username éffectuée le $date';
  //equals
  bool operator==(Object other) => identical(this, other) || other is Reclamation && runtimeType == other.runtimeType && code == other.code;
}
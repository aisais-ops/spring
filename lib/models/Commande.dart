
import 'LigneCommande.dart';

enum Etat_cmd{Paye, NonPaye, Facture}
class Commande{
  //attributes
  late String _code;
  String get code => _code;
  DateTime _date=DateTime.now();
  DateTime get date => _date;
  late LigneCommande _ligne;
  LigneCommande get ligne => _ligne;
  double _montant=0;
  double get montant => _montant;
  late String _nom_client;
  String get nom_client => _nom_client;
  late String _prenom_client;
  String get prenom_client => _prenom_client;
  late String _email_client;
  String get email_client => _email_client;
  late String _tel_client;
  String get tel_client => _tel_client;
  Etat_cmd _etat=Etat_cmd.NonPaye;
  Etat_cmd get etat_cmd => _etat;
  set etat_cmd(Etat_cmd value) {_etat = value;}
  late String _code_coupon;
  String get code_coupon => _code_coupon;
  //Constructor
  Commande([code,date,ligne,montant,nom_client,prenom_client,email_client,tel_client,etat,code_coupon]){
    this._code=code??'';
    this._date=date;
    this._ligne=ligne??LigneCommande;
    this._montant=montant;
    this._nom_client=nom_client??'';
    this._prenom_client=prenom_client??'';
    this._email_client=email_client??'';
    this._tel_client=tel_client??'';
    this._etat=etat;
    this._code_coupon=code_coupon??'';
  }
  //toString()
  @override
  String toString() {
    return 'Commande n° $_code, de $_nom_client $_prenom_client efféctuée le $_date}';
  }
  //equals
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Commande &&
          runtimeType == other.runtimeType &&
          _code == other._code;
  //hashcode
  @override
  int get hashCode => _code.hashCode;
}

import 'package:flutter/widgets.dart';
import 'package:spring/views/buyer/cart.dart';
import 'package:spring/views/buyer/categorie.dart';
import 'package:spring/views/buyer/favorite.dart';
import 'package:spring/views/buyer/productDetail.dart';
import 'package:spring/views/contact.dart';
import 'package:spring/views/createStore.dart';
import 'package:spring/views/login.dart';
import 'package:spring/views/buyer/home.dart';
import 'package:spring/views/profil.dart';
import 'package:spring/views/register.dart';
import 'package:spring/views/seller/dashboard.dart';
class Routes {
 // static const String login = 'login';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'loginLancher': (context) => LoginLancher(),
      'registerLancher': (context) => RegisterLancher(),
      'homeLancher': (context) => HomeLancher(),
      'dashboardLancher': (context) => DashboardLancher(),
      'cartLancher': (context) => cartLancher(),
      'favoriteLancher': (context) => FavoriteLancher(),
      'categorieLancher': (context) => CategorieLancher(),
      'contactUsLancher': (context) => ContactUsLancher(),
      'createStoreLancher': (context) => CreateStoreLancher(),
      'ProfileLancher': (context) => ProfilLancher(),
      //'productDetailLancher': (context) => ProductDetailLancher(),

    };
  }
}
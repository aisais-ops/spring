import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/models/Produit.dart';
import 'package:spring/routes/routes.dart';
import 'package:spring/viewmodels/productViewModel.dart';
import '../widgets/appBar.dart';
import 'widgets/drawer.dart';

class ProductDetailLancher extends StatelessWidget {
  final String productId;

  const ProductDetailLancher({required this.productId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetail(productId: productId),
      routes: Routes.getRoutes(),
    );
  }
}

class ProductDetail extends StatefulWidget {
  final String productId;
  const ProductDetail({required this.productId});

  @override
  State<ProductDetail> createState() {
    return _ProductDetail();
  }
}

class _ProductDetail extends State<ProductDetail> {
  ProductViewModel productViewModel = ProductViewModel();
  Produit? p = Produit();

  List<AssetImage> images = [
    /*const AssetImage('images/product0.png'),
    const AssetImage('images/product1.png'),
    const AssetImage('images/product2.png'),
    const AssetImage('images/product3.png'),*/
  ];

  String? userType;

  @override
  void initState() {
    super.initState();
    loadUserType();
  }

  Future<void> loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString('typeUser') == null
        ? "Geust"
        : prefs.getString('typeUser');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String? value = widget.productId;
    //print(productViewModel.getProductById(value));
    return FutureBuilder<Produit?>(
        future: productViewModel.getProductById(value),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            p = snapshot.data!;
            for (var element in p!.images) {
              images.add(AssetImage('$element'));
            }
            
            return Scaffold(
              appBar: myAppBar(context, 'PRODUCT', true),
              drawer: myDrawer(context, userType == "Geust" ? false : true),
              body: Container(
                child: SingleChildScrollView(
                  //child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Carousel Product Images*/
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 350,
                          viewportFraction: 0.8,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                        /*Images paramaiters */

                        items: images.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Image(
                                  image: image,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*Product title */
                            Text(
                              '${p!.label}',
                              style: TextStyle(
                                fontSize: 27.0,
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            /*Product description */
                            Container(
                              width: 270,
                              child: Text(
                                '${p!.description}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 81, 62, 9),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Store',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Supplier',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.brown,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${p!.pu.toDouble()} \$',
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff826035),
                                    minimumSize: const Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Add To Chart",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  //),
                ),
              ),
            );
          
          }
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        });
    //p=await productViewModel.getProductById(value);
    
  }
}

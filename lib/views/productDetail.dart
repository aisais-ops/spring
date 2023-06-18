import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'widgets/appBar.dart';
import 'widgets/drawer.dart';

class ProductDetailLancher extends StatelessWidget {
  const ProductDetailLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductDetail(),
    );
  }
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() {
    return _ProductDetail();
  }
}

class _ProductDetail extends State<ProductDetail> {
  final List<AssetImage> images = [
    const AssetImage('images/product.png'),
    const AssetImage('images/product1.png'),
    const AssetImage('images/product2.png'),
    const AssetImage('images/product3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,'PRODUCT'),
      drawer: myDrawer(context),
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
                          child: Image(image: image,fit: BoxFit.cover,),
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
                    children:  [
                      /*Product title */
                      const Text(
                            'Chamomile Oil',
                            style: TextStyle(
                                fontSize: 27.0,
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                                ),       
                          ),                 
                      /*Product description */
                      Container(
                        width: 270,
                          child:  const Text(
                            'Made from stoneware, this medium vase is available in a range of glossy and smooth color pallets.',
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
                          const Text(
                            '95.00 \$',
                            style:TextStyle(
                              color: Colors.brown,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            ) ,
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
                            onPressed: () {
                              
                            },
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
}

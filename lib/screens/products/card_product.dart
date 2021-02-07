import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerces/screens/products/product_details.dart';
import 'package:ecommerces/shares/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  CardProduct(this.product);
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailsScreen(product)),
            );
          },
          child: Container(
            child: Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height,
                    // color: Colors.red,
                    child: Image.network(product.ur)
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: size.width,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black12, Colors.black12])),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    width: 145,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: size.width,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 5),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                        // color: Colors.white,
                                        // shape: BoxShape.rectangle,
                                        // borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Text(product.price.toString() +  ' USD',style: TextStyle(color: Color(0xffFD6592), fontSize: 15, fontWeight: FontWeight.w700,))
                                )
                              ],
                            ),

                            if (product.discount > 0) Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text(product.discount.toString() +  ' %',style: TextStyle(color: Color(0xffFD6592), fontSize: 14))
                                )
                              ],
                            ),

                          ],
                        ),
                        // if(product.discount > 0) Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        //     decoration: BoxDecoration(color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(10))),
                        //     child: Text(product.discount.toString() +  ' %',style: TextStyle(color: Colors.black, fontSize: 14))
                        // )

                      ],
                    ),
                  )
                ]
            ),
          ),
        )
    )
    );
  }

  Widget _cachedNetworkImage(String url) {
    return Container(
      width: size.width,
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          width: ( MediaQuery.of(context).size.width / 2) - 110,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:ColorFilter.mode(Colors.red.withOpacity(0), BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

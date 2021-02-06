import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerces/screens/products/card_product.dart';
import 'package:ecommerces/shares/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final List<Product> products;
  ProductScreen(this.products);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductScreen> {

  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  final String sample = 'https://jnj-content-lab.brightspotcdn.com/dims4/default/33a0205/2147483647/strip/true/crop/1173x660+113+0/resize/910x512!/quality/90/?url=http%3A%2F%2Fjnj-brightspot.s3.amazonaws.com%2F66%2Ff5%2F493a65844e269c41d2f4d5a3c572%2Fj-j-sustainability-lede.jpg';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(widget.products.length, (index) {
        return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: Colors.red,
              // border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(10),
            child: CardProduct(widget.products[index].ur,
                widget.products[index].name.substring(0, 7) + '...',
                "12 Feb",
                "10",
                "500",
                '440')
          );
      }),
    );
  }

  Widget _buildArticleItem(int index) {
    Product product = widget.products[index];
    return Container(
      color: Colors.white,
        child: Stack(
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                color: bgColor,
              ),
              Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.amber,
                        child: Center(child: _cachedNetworkImage(product.ur)),
                      ),
                    ],
                  )
              )
            ]
        )
    );
  }

  Widget _cachedNetworkImage(String url) {
    return CachedNetworkImage(
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
    );
  }

}

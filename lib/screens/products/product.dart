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
  final String sample = 'https://prodimage.images-bn.com/pimages/9781250308788_p0_v2_s1200x630.jpg';

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return _buildArticleItem(index);
      },
      separatorBuilder: (context, index) =>
      const SizedBox(height: 16.0),
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
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 80.0,
                        child: Image(
                          image: NetworkImage(product.ur),
                        )
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                            children: <Widget>[
                              Text(
                                product.name,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        // WidgetSpan(
                                        //   child: CircleAvatar(
                                        //     radius: 15.0,
                                        //     backgroundColor: primaryColor,
                                        //   ),
                                        // ),
                                        WidgetSpan(
                                          child: const SizedBox(width: 5.0),
                                        ),
                                        TextSpan(
                                            text: product.price.toString(),
                                            style: TextStyle(fontSize: 16.0)),
                                        WidgetSpan(
                                          child: const SizedBox(width: 20.0),
                                        ),
                                        WidgetSpan(
                                          child: const SizedBox(width: 5.0),
                                        ),
                                        TextSpan(
                                          text: product.remark,
                                        ),
                                      ]
                                  )
                              )
                            ]
                        )
                      )
                    ],
                  )
              )
            ]
        )
    );
  }
}

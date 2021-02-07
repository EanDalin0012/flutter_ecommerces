import 'package:ecommerces/screens/products/widgets/expandable.dart';
import 'package:ecommerces/screens/products/widgets/header.dart';
import 'package:ecommerces/shares/components/round_button.dart';
import 'package:ecommerces/shares/constants/constant_colors.dart';
import 'package:ecommerces/shares/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatefulWidget {

  final Product product;
  ProductDetailsScreen(this.product);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Header(item: widget.product),
                  _details(),
                  SizedBox(height: 15),
                  Divider(color: kBorderColor),
                  Expandable(title: 'Product Details'),
                  Divider(color: kBorderColor, indent: 15, endIndent: 15),
                  Expandable(
                    title: 'Nutrition',
                    trailing: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kSecondaryColor,
                      ),
                      child: Text('100gr'),
                    ),
                  ),
                  Divider(color: kBorderColor, indent: 15, endIndent: 15),
                  Expandable(
                    title: 'Reviews',
                    trailing: Row(
                      children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          )),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RoundButton(title: 'Add To Cart'),
                  ),
                ]
            )
        )
        )
    );
  }

 Container _details() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.name,
                style: kTitleStyle.copyWith(fontSize: 18),
              ),
              SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: kBlackColor.withOpacity(0.7),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.product.name,
            style: kDescriptionStyle,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.horizontal_rule, color: kBlackColor.withOpacity(0.7),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('1', style: kTitleStyle,),
              ),
              Icon(Icons.add, color: kPrimaryColor),
              Spacer(),
              Text('\$${widget.product.price}', style: kTitleStyle.copyWith(fontSize: 18))
            ],
          ),
        ],
      ),
    );
 }

}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

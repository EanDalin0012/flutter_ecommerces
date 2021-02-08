import 'package:ecommerces/shares/constants/constant_colors.dart';
import 'package:ecommerces/shares/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  final Product item;
  const Header({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.1,
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            padding:EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: kSecondaryColor,
            ),
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.chevron_left,
                                color: kBlackColor, size: 30),
                          ),
                          SvgPicture.asset('assets/icons/share.svg'),
                        ],
                      ),
                      Hero(
                        tag: item.hashCode,
                        child: Image.network(
                          item.ur,
                          width: constraints.maxWidth * 0.8,
                          height: constraints.maxHeight * 0.8,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]
                );
              }
            ),
          )
        )
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

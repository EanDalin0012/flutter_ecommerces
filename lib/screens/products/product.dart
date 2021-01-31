import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductScreen> {
  final List<Map> articles = [
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "Does Dry is January Actually Improve Your Health?",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "You do hire a designer to make something. You hire them.",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "Does Dry is January Actually Improve Your Health?",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "You do hire a designer to make something. You hire them.",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
  ];

  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  final String sample = 'https://prodimage.images-bn.com/pimages/9781250308788_p0_v2_s1200x630.jpg';

  @override
  Widget build(BuildContext context) {


    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _buildArticleItem(index);
      },
      separatorBuilder: (context, index) =>
      const SizedBox(height: 16.0),
    );
  }

  Widget _buildArticleItem(int index) {
    Map article = articles[index];
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
                        color: Colors.blue,
                        width: 80.0,
                        child: Image(
                          image: NetworkImage(sample),
                        )
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                            children: <Widget>[
                              Text(
                                article["title"],
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
                                        WidgetSpan(
                                          child: CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: primaryColor,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: const SizedBox(width: 5.0),
                                        ),
                                        TextSpan(
                                            text: article["author"],
                                            style: TextStyle(fontSize: 16.0)),
                                        WidgetSpan(
                                          child: const SizedBox(width: 20.0),
                                        ),
                                        WidgetSpan(
                                          child: const SizedBox(width: 5.0),
                                        ),
                                        TextSpan(
                                          text: article["time"],
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

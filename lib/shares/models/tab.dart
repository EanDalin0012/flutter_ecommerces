
import 'package:flutter/material.dart';

class Tabs {
  final String title;
  final IconData icon;
  Tabs(this.title, this.icon);

  static List<Tabs> dataItems() {
    return [
      Tabs('All', Icons.home),
      Tabs('Apparel', Icons.home),
      Tabs('Baby', Icons.home),
      Tabs('Phone', Icons.home),
      Tabs('Sports & Entertainment', Icons.home),
      Tabs('Home & Tabletop', Icons.home),
      Tabs('Furniture', Icons.home),
    ];
  }
}

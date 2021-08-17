import 'package:velocity_x/velocity_x.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';


class CatalogHeader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
              "Trending Products".text.xl2.make(),
            ],
            );
  }
}
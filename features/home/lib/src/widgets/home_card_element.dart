import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class HomeCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;

  const HomeCard({
    super.key,
    required this.price,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: int.parse("${MediaQuery.of(context).size.width.round()}") * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppDarkThemeColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRect(
            child: Image.network(imageUrl),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$$price',
                style: const TextStyle(
                  color: AppDarkThemeColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppDarkThemeColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

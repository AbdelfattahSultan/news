import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final CategoryData category;
  final int index;
  final Function(CategoryData)? onTap;
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: index.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(category.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap!(category);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(84),
            color: Colors.white54,
          ),
          child: Directionality(
            textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

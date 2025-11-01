import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/network/repones/artcles/article.dart';
// ignore: must_be_immutable
class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: 300,
              fit: BoxFit.cover,
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator(strokeAlign: 2)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(article.title ?? "No Title"),
          Text(article.description ?? "No Description"),

          Row(
            children: [
              Expanded(child: Text(article.author ?? "No Author")),
              Spacer(),
              Expanded(
                child: Text(
                  article.publishedAt ?? "",
                  overflow: TextOverflow.ellipsis,
                  //DateFormat('h:mm a').format(article.dateTime ?? DateTime.now()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

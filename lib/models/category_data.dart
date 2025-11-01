import 'package:news/gen/assets.gen.dart';

class CategoryData {
  final String id;
  final String title;
  final String imageUrl;

  CategoryData({required this.id, required this.title, required this.imageUrl});

  static List<CategoryData> categories = [
    CategoryData(
      id: 'general',
      title: 'General',
      imageUrl: Assets.images.general.path,
    ),
    CategoryData(
      id: 'business',
      title: 'business',
      imageUrl: Assets.images.business.path,
    ),
    CategoryData(
      id: 'entertainment',
      title: 'entertainment',
      imageUrl: Assets.images.entertainment.path,
    ),
    CategoryData(
      id: 'health',
      title: 'health',
      imageUrl: Assets.images.health.path,
    ),
    CategoryData(
      id: 'science',
      title: 'science',
      imageUrl: Assets.images.science.path,
    ),
    CategoryData(
      id: 'technology',
      title: 'technology',
      imageUrl: Assets.images.technology.path,
    ),
    CategoryData(
      id: 'sports',
      title: 'sports',
      imageUrl: Assets.images.sports.path,
    ),
  ];
}

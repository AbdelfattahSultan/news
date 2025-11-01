class ArticlesData {
  final String? title;
  final String? description;
  final String? author;
  final String? urlToImage;
  final String? publishedAt;

  ArticlesData({
    required this.title,
    required this.description,
    required this.author,
    required this.urlToImage,
    required this.publishedAt,
  });

  static List<ArticlesData> articles = [
    ArticlesData(
      title: 'Title 1',
      description: 'Description 1',
      author: 'abdo',
      urlToImage:
          'https://i.ytimg.com/vi/LFzrA492gdw/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLD00zmsOXms9WHeK70mFLjDQ9RHWA',
      publishedAt: '2022-01-01',
    ),
    ArticlesData(
      title: 'Title 2',
      description: 'Description 2',
      author: 'abdo',
      urlToImage: 'https://example.com/image2.jpg',
      publishedAt: '2022-01-02',
    ),
    ArticlesData(
      title: 'Title 3',
      description: 'Description 3',
      author: 'abdo',
      urlToImage: 'https://example.com/image3.jpg',
      publishedAt: '2022-01-03',
    ),
    ArticlesData(
      title: 'Title 1',
      description: 'Description 1',
      author: 'abdo',
      urlToImage: 'https://example.com/image1.jpg',
      publishedAt: '2022-01-01',
    ),
    ArticlesData(
      title: 'Title 2',
      description: 'Description 2',
      author: 'abdo',
      urlToImage: 'https://example.com/image2.jpg',
      publishedAt: '2022-01-02',
    ),
    ArticlesData(
      title: 'Title 3',
      description: 'Description 3',
      author: 'abdo',
      urlToImage: 'https://example.com/image3.jpg',
      publishedAt: '2022-01-03',
    ),
  ];
}

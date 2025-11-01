class SourcesData {
  String? id;
  String? name;

  SourcesData({this.id, this.name});

  static List<SourcesData> sources = [
    SourcesData(id: 'abc-news', name: 'ABC News'),
    SourcesData(id: 'bbc-news', name: 'BBC News'),
    SourcesData(id: 'bbc-sport', name: 'BBC Sport'),
    SourcesData(id: 'business-insider', name: 'Business Insider'),
    SourcesData(id: 'engadget', name: 'Engadget'),
    SourcesData(id: 'entertainment-weekly', name: 'Entertainment Weekly'),
  ];
}

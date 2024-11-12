class RandomFact {
  final String id;
  final String text;
  final String source;
  final Uri sourceUrl;
  final String language;
  final String permalink;

  RandomFact({
    required this.id,
    required this.text,
    required this.source,
    required this.sourceUrl,
    required this.language,
    required this.permalink,
  });

  factory RandomFact.fromJson(Map<String, dynamic> json) {
    return RandomFact(
      id: json['id'],
      text: json['text'],
      source: json['source'],
      sourceUrl: Uri.parse(json['source_url']),
      language: json['language'],
      permalink: json['permalink'],
    );
  }
}
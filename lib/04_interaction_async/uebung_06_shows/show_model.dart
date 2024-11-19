class Show {
  final int id;
  final String name;
  final double? averageRating;
  final String language;
  final String type;
  final List<String> genres;
  final int? runtime;
  final String? imageUrl;

  Show({
    required this.id,
    required this.name,
    required this.averageRating,
    required this.language,
    required this.type,
    required this.genres,
    required this.runtime,
    required this.imageUrl,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      name: json['show']['name'],
      averageRating: json['show']['rating']?['average'] != null
          ? (json['show']['rating']['average'] as num).toDouble()
          : null,
      language: json['show']['language'],
      type: json['show']['type'],
      genres: List.of(json['show']['genres']).cast<String>(),
      runtime: json['show']['runtime'],
      imageUrl: json['show']['image']?['medium'],
    );
  }
}
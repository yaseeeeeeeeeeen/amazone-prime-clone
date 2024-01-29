class Movies {
  final String posterPath;
  final String name;
  Movies({required this.posterPath, required this.name});

  factory Movies.fromMap(Map<String, dynamic> json) {
    return Movies(
      name: json["original_title"]??json["original_name"],
      posterPath: json["poster_path"],
    );
  }
}

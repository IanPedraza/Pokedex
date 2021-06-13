import 'dart:convert';

class Character {
  String name;
  String url;
  String? imageUrl;

  Character({
    required this.name,
    required this.url,
    this.imageUrl,
  });

  Character copyWith({
    String? name,
    String? url,
    String? imageUrl,
  }) {
    return Character(
      name: name ?? this.name,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'imageUrl': imageUrl,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      name: map['name'],
      url: map['url'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() => 'Character(name: $name, url: $url, imageUrl: $imageUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.name == name &&
        other.url == url &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ imageUrl.hashCode;
}

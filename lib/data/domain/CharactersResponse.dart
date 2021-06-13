import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokemon_app/data/domain/Character.dart';

class CharactersResponse {
  int count;
  String? next;
  String? previous;
  List<Character> results;

  CharactersResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  CharactersResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<Character>? results,
  }) {
    return CharactersResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CharactersResponse.fromMap(Map<String, dynamic> map) {
    return CharactersResponse(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<Character>.from(
          map['results']?.map((x) => Character.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharactersResponse.fromJson(String source) =>
      CharactersResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharactersResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharactersResponse &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

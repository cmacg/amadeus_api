import 'links.dart';

/// Meta information about the returned object(s) in "data"
class Meta {
  /// Total number of object(s) retrieved.
  final int count;

  /// Sorting fields criteria and their associated priority and direction.
  /// Sorting priority is indicated by the order of the strings within the
  /// array. E.g. sort=title,size means that items are ordered by title and
  /// then, as a second ordering by size. A '-' sign before the search criteria
  /// indicates a descending ordering direction (Z to A), whereas no sign
  /// indicates a ascending direction (A to Z). E.g. sort=-title mean that the
  ///  objects are ordered by title in reverse order (Z to A).
  final List<String>? sort;

  /// Links related to the returned object(s)
  final Links? links;

  Meta({
    required this.count,
    this.sort,
    this.links,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        sort = json['sort'] == null ? null : List<String>.from(json["sort"]),
        links = json['links'] == null ? null : Links.fromJson(json['links']);
}

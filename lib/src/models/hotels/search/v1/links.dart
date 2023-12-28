/// Links related to the returned object(s)
class Links {
  /// Link to the same page.
  final String? self;

  /// Link to the first page.
  final String? first;

  /// Link to the previous page.
  final String? prev;

  /// Link to the next page.
  final String? next;

  /// Link to the last page.
  final String? last;

  Links({this.self, this.first, this.prev, this.next, this.last});

  Links.fromJson(Map<String, dynamic> json)
      : self = json['self'],
        first = json['first'],
        prev = json['prev'],
        next = json['next'],
        last = json['last'];
}

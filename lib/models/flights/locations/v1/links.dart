class Links {
  /// The hyperlink reference for this link
  final String href;

  /// The http methods that can be used when executing this link
  final List<HttpMethod>? methods;

  /// This could be anyone's guess?
  final int? count;

  Links({required this.href, this.methods, this.count});

  Links.fromJson(Map<String, dynamic> json)
      : href = json['href'],
        methods = (json['methods'] == null)
            ? null
            : (json['methods'] as List).map((i) => _getHttpMethod(i)).toList(),
        count = json['count'];

  static HttpMethod _getHttpMethod(String method) {
    for (HttpMethod httpMethod in HttpMethod.values) {
      if (httpMethod.toString().endsWith(method)) {
        return httpMethod;
      }
    }
    return HttpMethod.GET;
  }
}

enum HttpMethod { GET, PUT, DELETE, POST, PATCH }

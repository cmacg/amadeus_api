import 'package:http/http.dart' as http;
import 'dart:convert';

import '../client_exception.dart';

/// This class should be extended by any specific Amadeus product client.
/// (Example: hotel and flight).
abstract class AmadeusClient {
  /// Amadeus API Key provided.
  final String apiKey;

  /// Amadeus API Secret provided.
  final String apiSecret;

  /// Production base url for the API products.
  static const String _authority = 'api.amadeus.com';

  /// Test base url for the API products.
  static const String _testAuthority = 'test.api.amadeus.com';

  /// Path to get an updated OAuth ticket.
  static const String _authPath = '/v1/security/oauth2/token';

  /// Flag that determines whether the extending client is using test versus
  /// production api services.
  final bool test;

  /// API access token needed for access to the Amadeus API products.
  String? _accessToken;

  /// DateTime used to keep track when the access token expires.
  DateTime? _accessTokenExpiration;

  AmadeusClient(
      {required this.apiKey, required this.apiSecret, this.test = false});

  /// Helper method to generate a URI to the Amadeus self service APIs.  Based
  /// on the [test] flag, this method will determine the appropriate authority.
  Uri getUri(String path, Map<String, String>? query, bool test) {
    Uri uri = Uri.https(_authority, path, query);
    if (test) {
      uri = Uri.https(_testAuthority, path, query);
    }
    return uri;
  }

  /// This method should be used to determine if the access token has expired.
  /// The goal is to prevent the client from having to execute retries to re-
  /// initialize access tokens.
  bool _isAuthKeyExpired() {
    if ((_accessTokenExpiration == null) ||
        (DateTime.now().isAfter(_accessTokenExpiration!))) {
      return true;
    }
    return false;
  }

  /// Method used to get (or refresh) the API access key.  This is a private
  /// method because all clients should be using the [executePost] and
  /// [executeQuery] methods for call the Amadeus API.  This was the usage and
  /// application of the expirable access token is handled here and not
  /// amongst the different clients.
  Future<String> _getAccessToken() async {
    if (_accessToken != null && !_isAuthKeyExpired()) {
      return Future<String>.value(_accessToken);
    }

    String body = 'grant_type=client_credentials&client_id=' +
        apiKey +
        '&client_secret=' +
        apiSecret;

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    Uri authUri = getUri(_authPath, null, test);

    http.Response response =
        await http.post(authUri, headers: headers, body: body);

    if (response.statusCode != 200) {
      throw AmadeusClientHttpException(response.statusCode,
          'Unable to authenticate: ' + response.toString(), null);
    }

    AuthenticationResponse authResponse =
        AuthenticationResponse.fromJson(json.decode(response.body));
    _accessToken = authResponse.accessToken;

    // Update the token expiration date. The subtraction of a second is to
    // provide some buffer so a request doesn't come in at exactly the wrong
    // time and cause an error.  (Yes, this is a very small edge case.)
    _accessTokenExpiration =
        DateTime.now().add(Duration(seconds: authResponse.expiresIn - 1));

    return Future<String>.value(_accessToken);
  }

  /// This method should be used by any of clients within this library to
  /// execute an HTTP Get by passing in a [Uri].  This method handles the
  /// application of the API access tokens and wrapping errors in the
  /// appropriate exception with the errors easily accessible.
  Future<http.Response> executeQuery(Uri uri) async {
    String accessToken = await _getAccessToken();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + accessToken
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode != 200) {
      // TODO if errors exist in the response - convert them to the models
      // and add them to the throw clause below
      throw AmadeusClientHttpException(
          response.statusCode, 'Http error when calling service', null);
    }

    return response;
  }

  /// This method should be used by any of clients within this library to
  /// execute an HTTP Post.  This method handles the application of the API
  /// access tokens and wrapping errors in the appropriate exception with
  /// the errors easily accessible.
  Future<http.Response> executePost(Uri uri, Map<String, dynamic> body) async {
    String accessToken = await _getAccessToken();

    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + accessToken,
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(body));

    if (response.statusCode != 200) {
      // TODO if errors exist in the response - convert them to the models
      // and add them to the throw clause below
      throw AmadeusClientHttpException(
          response.statusCode, 'Http error when calling service', null);
    }

    return response;
  }
}

/// The response model for getting the OAuth access token.
class AuthenticationResponse {
  /// The type of resource. The value will be amadeusOAuth2Token.
  final String type;

  /// Your username (email address) attached to the API key and secret.
  final String username;

  /// The name of your application.
  final String applicationName;

  /// The API Key for your application
  final String clientId;

  /// The type of token issued by the authentication server. Value will be
  /// Bearer.
  final String tokenType;

  /// The token used to authenticate your requests.
  final String accessToken;

  /// The number of seconds until the token expires.
  final int expiresIn;

  /// The status of your request. Values can be approved or expired.
  final String state;
  final String scope;

  AuthenticationResponse.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        username = json['username'],
        applicationName = json['application_name'],
        clientId = json['client_id'],
        tokenType = json['token_type'],
        accessToken = json['access_token'],
        expiresIn = json['expires_in'],
        state = json['state'],
        scope = json['scope'];
}

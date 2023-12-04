import 'package:amadeusapi/client_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// This class should be extended by any specific Amadeus product client.
/// (Example: hotel and flight).
abstract class AmadeusClient {
  /// Amadeus API Key provided.
  final String apiKey;

  /// Amadeus API Secret provided.
  final String apiSecret;

  /// Production base url for the API products.
  final String authority = 'api.amadeus.com';

  /// Test base url for the API products.
  final String testAuthority = 'test.api.amadeus.com';

  /// Path to get an updated OAuth ticket.
  final String authPath = '/v1/security/oauth2/token';

  /// Flag that determines whether the extending client is using test versus
  /// production api services.
  final bool test;

  /// API access token needed for access to the Amadeus API products.
  String? _accessToken;

  DateTime? _accessTokenExpiration;

  AmadeusClient(
      {required this.apiKey, required this.apiSecret, this.test = false});

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

  /// Method used to get (or refresh) the API access key.
  Future<String> getAccessToken() async {
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

    var authUri = Uri(
        scheme: 'https',
        host: (test) ? testAuthority : authority,
        path: authPath);

    if (test) {
      print(authUri);
      print(body);
    }

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
}

Future<http.Response> executeQuery(
    Uri uri, Map<String, dynamic> query, String accessToken) async {
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

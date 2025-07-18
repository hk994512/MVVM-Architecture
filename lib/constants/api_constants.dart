import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  // Correct key names as per your .env file
  static final String apiKey = dotenv.get('MOVIES_API_KEY', fallback: '');
  static final String bearerToken = dotenv.get(
    'MOVIES_BEARER_TOKEN',
    fallback: '',
  );

  static const String baseUrl = "https://api.themoviedb.org/3";

  static Map<String, String> get headers => {
    'Authorization': bearerToken,
    'accept': 'application/json',
  };
}

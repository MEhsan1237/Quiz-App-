import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../core/values/app_constants.dart';

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class ApiService {
  static const Map<String, String> _headers = {
    'User-Agent':
        'Mozilla/5.0 (Linux; Android 12; Mobile; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
    'Accept': 'application/json, text/plain, */*',
    'Accept-Language': 'en-US,en;q=0.9',
    'Cache-Control': 'no-cache',
  };

  Future<Map<String, dynamic>> getQuestions({
    required int amount,
    int? category,
    String? difficulty,
  }) async {
    final queryParams = <String, String>{
      'amount': amount.toString(),
      'type': 'multiple',
    };

    if (category != null && category > 0) {
      queryParams['category'] = category.toString();
    }
    if (difficulty != null && difficulty.toLowerCase() != 'any') {
      queryParams['difficulty'] = difficulty.toLowerCase();
    }

    final uri = Uri.parse(AppConstants.baseUrl).replace(queryParameters: queryParams);

    int retries = 3;
    Duration delay = const Duration(milliseconds: 500);

    while (retries > 0) {
      try {
        final response = await http
            .get(uri, headers: _headers)
            .timeout(const Duration(seconds: 12));

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          return data;
        } else if (response.statusCode == 429 || response.statusCode >= 500) {
          // Rate limited or server error, attempt retry
          retries--;
          if (retries == 0) {
            throw Exception('Server returned status code ${response.statusCode}');
          }
          await Future.delayed(delay);
          delay *= 2;
        } else {
          throw Exception('Failed to load questions (Status: ${response.statusCode})');
        }
      } on SocketException catch (_) {
        retries--;
        if (retries == 0) rethrow;
        await Future.delayed(delay);
        delay *= 2;
      } on TimeoutException catch (_) {
        retries--;
        if (retries == 0) rethrow;
        await Future.delayed(delay);
        delay *= 2;
      } on HandshakeException catch (_) {
        retries--;
        if (retries == 0) rethrow;
        await Future.delayed(delay);
        delay *= 2;
      } catch (e) {
        retries--;
        if (retries == 0) rethrow;
        await Future.delayed(delay);
        delay *= 2;
      }
    }

    throw Exception('Failed to load questions after retries');
  }
}

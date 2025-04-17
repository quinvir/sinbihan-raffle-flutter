import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/winner.dart';
import '../models/festival.dart';

class RaffleService {
  static const String baseUrl = 'https://dev-rs.hence.world/api/v2';

  Future<Winner> drawWinner(Festival festival) async {
    final requestBody = {
      'drawType': 'ONLINE',
      'prize': '미지정 경품',
      'raffleId': festival.raffleId,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/festivals/${festival.id}/raffles/${festival.raffleId}/draw'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    print(requestBody);
    print(response.request?.url);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['code'] == 200 && responseData['data'] != null) {
        return Winner.fromJson(responseData['data']);
      }
    }
    throw Exception('Failed to draw winner: ${response.body}');
  }
}
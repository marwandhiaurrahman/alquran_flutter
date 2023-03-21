// ignore_for_file: avoid_print

import 'dart:convert';

import '../model/ayat.dart';
import '../model/surat.dart';
import 'package:http/http.dart' as http;

class AlquranApi {
  final String baseUrl = "";

  Future<List<Surat>> fetchSurat() async {
    final response = await http.get(Uri.parse('https://equran.id/api/surat'));
    if (response.statusCode == 200) {
      print('get surat');
      return suratFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Ayat> fetchAyat(int nomorsurat) async {
    final response =
        await http.get(Uri.parse("https://equran.id/api/surat/$nomorsurat"));
    if (response.statusCode == 200) {
      print('get ayat');
      return Ayat.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}

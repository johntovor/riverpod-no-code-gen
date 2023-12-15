import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/activity.dart';

final activityProvider = FutureProvider.autoDispose((ref) async {
  const String endpoint = "http://www.boredapi.com/api/activity/";
  final response = await http.get(Uri.parse(endpoint));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
});

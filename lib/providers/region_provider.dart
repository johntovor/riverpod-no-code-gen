import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/region.dart';

final regionListProvider =
    AsyncNotifierProvider.autoDispose<RegionList, List<Region>>(
  RegionList.new,
);

class RegionList extends AutoDisposeAsyncNotifier<List<Region>> {
  @override
  Future<List<Region>> build() async {
    return [];
  }

  Future<void> addRegion(Region region) async {
    const String endpoint =
        "http://127.0.0.1:8000/locations/region/create/";
    await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(region.toJson()),
    );

    ref.invalidateSelf();
    await future;
  }

  Future<void> getRegions() async {
    const String endpoint =
        "http://127.0.0.1:8000/locations/region/list-all/";
    final response = await http.get(Uri.parse(endpoint),
        headers: {"Content-Type": 'application/json'});

    final regions = (jsonDecode(response.body) as List)
        .cast<Map<String, Object?>>()
        .map(Region.fromJson)
        .toList();
    state = AsyncData(regions);
  }

}

import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:riverpod_state/model/apiMpdel.dart';

// final futureProvider=FutureProvider((ref)async{
//   await Future.delayed(const Duration(seconds: 2));
//   return ['Ahmad','khan',"ali"];
// });

final streamProvider = StreamProvider((ref) async* {
  final random = Random();
  double price = 100.0;

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    price += random.nextDouble() * 10 - 5;
    yield double.parse(price.toStringAsFixed(2));
  }
});

final futureProvider = FutureProvider<List<ApiModel>>((ref) async {
  try {
    final reposne = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (reposne.statusCode == 200) {
      final List<dynamic> data = jsonDecode(reposne.body);
      List<ApiModel> postData = data.map((e) => ApiModel.fromJson(e)).toList();
      return postData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
  throw 'Something went wrong';
});

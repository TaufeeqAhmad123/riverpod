import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// final futureProvider=FutureProvider((ref)async{
//   await Future.delayed(const Duration(seconds: 2));
//   return ['Ahmad','khan',"ali"];
// });



final streamProvider=StreamProvider((ref)async*{
final random=Random();
double price=100.0;


while(true){
  await Future.delayed(const Duration(seconds: 1));
  price+=random.nextDouble()*10-5;
  yield double.parse(price.toStringAsFixed(2));
}

});


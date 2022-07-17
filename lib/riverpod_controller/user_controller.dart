

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../clinet/client_service.dart';
import '../model/user.dart';
final apiProvider = Provider<ApiServices>((ref)=>ApiServices());


final userDataProvider = FutureProvider<List<Users>>((ref)async{
  return  await ref.read(apiProvider).getUser();
});
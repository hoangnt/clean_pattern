import 'package:clean_pattern/common/network/model/server_response.dart';

abstract class StoreRepo {
  Future<ServerResponse> getListStore();
}

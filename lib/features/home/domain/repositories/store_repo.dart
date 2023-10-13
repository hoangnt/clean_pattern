import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';

abstract class StoreRepo {
  Future<BaseResponse<List<StoreModel>>> getAllStore();
}

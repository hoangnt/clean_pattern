import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/store/data/datasource/store_remote_datasource.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:clean_pattern/features/store/domain/repositories/store_repo.dart';

class StoreRepoImpl extends StoreRepo {
  final StoreRemoteDatasouce remote = StoreRemoteDatasouce.instance;

  @override
  Future<BaseResponse<List<StoreModel>>> getAllStore() async {
    final res = await remote.getAllStore();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: [],
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      paging: res.paging,
      data: res.data != null
          ? (res.data as List).map((val) => StoreModel.fromJson(val)).toList()
          : [],
    );
  }

  @override
  Future<BaseResponse<List<StoreModel>>> getTopStore() async {
    final res = await remote.getTopStore();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: [],
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      paging: res.paging,
      data: res.data != null
          ? (res.data as List).map((val) => StoreModel.fromJson(val)).toList()
          : [],
    );
  }
}

import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/datasource/store_local_datasource.dart';
import 'package:clean_pattern/features/home/data/datasource/store_remote_datasource.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/repositories/store_repo.dart';

class StoreRepoImpl extends StoreRepo {
  final StoreRemoteDatasouce remote = StoreRemoteDatasouce.instance;
  final StoreLocalDatasource local = StoreLocalDatasource.instance;

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
}

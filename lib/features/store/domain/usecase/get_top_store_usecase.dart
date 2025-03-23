import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:clean_pattern/features/store/domain/repositories/store_repo.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';

class GetTopStoreUsecase {
  final StoreRepo repo;

  GetTopStoreUsecase(this.repo);

  Future<BaseResponse<List<StoreModel>>> call() async =>
      await repo.getTopStore();
}

import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/repositories/store_repo.dart';

import '../../../../common/network/model/base_response.dart';

class GetTopStoreUsecase {
  final StoreRepo repo;

  GetTopStoreUsecase(this.repo);

  Future<BaseResponse<List<StoreModel>>> call() async =>
      await repo.getTopStore();
}

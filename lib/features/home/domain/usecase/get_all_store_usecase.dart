import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/repositories/store_repo.dart';

class GetAllStoreUsecase {
  final StoreRepo storeRepo;

  GetAllStoreUsecase(this.storeRepo);

  Future<BaseResponse<List<StoreModel>>> call() async =>
      await storeRepo.getAllStore();
}

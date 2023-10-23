import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_top_store_usecase.dart';

class StoreController extends BaseController {
  final GetAllStoreUsecase getAllStoreUsecase;
  final GetTopStoreUsecase getTopStoreUsecase;

  StoreController(
    this.getAllStoreUsecase,
    this.getTopStoreUsecase,
  );

  List<StoreModel> listStore = [];
  List<StoreModel> listTopStore = [];

  @override
  void onInit() async {
    super.onInit();

    handleBaseResponse<List<StoreModel>>(
      usecase: getAllStoreUsecase(),
      onSuccess: (data) => listStore = data,
    );
    handleBaseResponse<List<StoreModel>>(
      usecase: getTopStoreUsecase(),
      onSuccess: (data) => listTopStore = data,
    );
  }

  Future<void> refreshData() async {
    handleBaseResponse<List<StoreModel>>(
      usecase: getAllStoreUsecase(),
      onSuccess: (data) => listStore = data,
    );
    handleBaseResponse<List<StoreModel>>(
      usecase: getTopStoreUsecase(),
      onSuccess: (data) => listTopStore = data,
    );
  }
}

import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_top_store_usecase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StoreController extends BaseController {
  final GetAllStoreUsecase getAllStoreUsecase;
  final GetTopStoreUsecase getTopStoreUsecase;

  StoreController(
    this.getAllStoreUsecase,
    this.getTopStoreUsecase,
  );

  RxList<StoreModel> listStore = RxList<StoreModel>();
  RxList<StoreModel> listTopStore = RxList<StoreModel>();

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    listStore.clear;
    listTopStore.clear();

    handle2BaseResponse<List<StoreModel>, List<StoreModel>>(
      needUpdate: false,
      usecases: [
        getAllStoreUsecase(),
        getTopStoreUsecase(),
      ],
      onSuccess: (allStore, topStore) {
        listStore.value = allStore;
        listTopStore.value = topStore;
      },
    );
  }
}

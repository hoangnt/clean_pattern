import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_top_store_usecase.dart';

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
    fetchData();
  }

  Future<void> refreshData() async {
    fetchData();
  }

  void fetchData() {
    handle2BaseResponse<List<StoreModel>, List<StoreModel>>(
      usecases: [
        getAllStoreUsecase(),
        getTopStoreUsecase(),
      ],
      onSuccess: (allStore, topStore) {
        listStore = allStore;
        listTopStore = topStore;
      },
    );
  }
}

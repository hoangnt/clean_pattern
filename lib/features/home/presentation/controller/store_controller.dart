import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_store_usecase.dart';

class StoreController extends BaseController {
  final GetAllStoreUsecase getAllStoreUsecase;

  StoreController(this.getAllStoreUsecase);

  List<StoreModel> listStore = [];

  @override
  void onInit() async {
    super.onInit();

    handleBaseResponse<List<StoreModel>>(
      result: await getAllStoreUsecase(),
      onSuccess: (data) => listStore = data,
    );
  }
}

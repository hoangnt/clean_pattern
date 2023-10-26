import 'package:clean_pattern/common/constant/hive_box_key.dart';
import 'package:clean_pattern/features/home/data/model/ramen_flavor.dart';
import 'package:clean_pattern/features/home/data/repositories/home_repo_impl.dart';
import 'package:clean_pattern/features/home/data/repositories/store_repo_impl.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_article_usecase.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_top_store_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> dependenciesInjection() async {
  homeInjection();
  await hiveBoxInjection();
}

void homeInjection() {
  getIt.registerSingleton<StoreRepoImpl>(StoreRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());

  getIt.registerSingleton<GetAllStoreUsecase>(
      GetAllStoreUsecase(getIt.get<StoreRepoImpl>()));
  getIt.registerSingleton<GetTopStoreUsecase>(
      GetTopStoreUsecase(getIt.get<StoreRepoImpl>()));
  getIt.registerSingleton<GetAllArticleUsecase>(
      GetAllArticleUsecase(getIt.get<HomeRepoImpl>()));
}

Future<void> hiveBoxInjection() async {
  await Hive.initFlutter();
  
  if (!Hive.isAdapterRegistered(HiveAdapterId.ramenFlavor)) {
    Hive.registerAdapter(RamenFlavorAdapter());
  }
  if (!Hive.isBoxOpen(HiveBoxKey.ramenFlavor)) {
    await Hive.openBox<RamenFlavor>(HiveBoxKey.ramenFlavor);
  }
}

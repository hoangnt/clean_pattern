import 'package:clean_pattern/features/home/data/repositories/home_repo_impl.dart';
import 'package:clean_pattern/features/home/data/repositories/store_repo_impl.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_article_usecase.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_store_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void homeInjection() {
  getIt.registerSingleton<StoreRepoImpl>(StoreRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());

  getIt.registerSingleton<GetAllStoreUsecase>(
      GetAllStoreUsecase(getIt.get<StoreRepoImpl>()));
  getIt.registerSingleton<GetAllArticleUsecase>(
      GetAllArticleUsecase(getIt.get<HomeRepoImpl>()));
}
